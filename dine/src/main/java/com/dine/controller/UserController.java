package com.dine.controller;

import com.dine.config.ProjectUrlConfig;
import com.dine.config.WechatAccountConfig;
import com.dine.constant.CookieConstant;
import com.dine.constant.RedisConstant;
import com.dine.entity.Address;
import com.dine.entity.User;
import com.dine.enums.ResultEnum;
import com.dine.exception.SellException;
import com.dine.form.AddressForm;
import com.dine.form.UserForm;
import com.dine.listener.SessionListener;
import com.dine.repository.AddressRepository;
import com.dine.repository.UserRepository;
import com.dine.utils.CookieUtil;
import com.dine.utils.HttpUtil;
import com.dine.utils.JsonUtil;
import com.dine.utils.JwtUtil;
import com.dine.utils.KeyUtil;
import com.dine.utils.ResultVOUtil;
import com.dine.vo.RestResponse;
import com.fasterxml.jackson.databind.JsonNode;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 用户相关
 */
@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {

    @Autowired
    UserRepository repository;
    @Autowired
    AddressRepository addressRepository;
    @Autowired
    WechatAccountConfig wechatAccountConfig;
    @Autowired
    ProjectUrlConfig projectUrlConfig;

    /**
     * 创建用户
     *
     * @param userForm
     * @param bindingResult
     * @return
     */
    @PostMapping("/save")
    public RestResponse create(@RequestBody @Valid UserForm userForm, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            log.error("参数不正确, userForm={}", userForm);
            throw new SellException(ResultEnum.PARAM_ERROR.getCode(), bindingResult.getFieldError().getDefaultMessage());
        }
        User userOld = repository.findByOpenid(userForm.getOpenid());
        User user = new User();
        if (userOld != null) {
            user.setId(userOld.getId());
        }
        user.setUsername(userForm.getUsername());
        user.setOpenid(userForm.getOpenid());
        user.setToken(userForm.getToken());
        user.setAvatarUrl(userForm.getAvatarUrl());
        user.setCity(userForm.getCity());
        user.setCountry(userForm.getCountry());
        user.setProvince(userForm.getProvince());
        user.setPhone(userForm.getPhone());
        user.setZhuohao(userForm.getZhuohao());
        user.setRenshu(userForm.getRenshu());
        return ResultVOUtil.success(repository.save(user));
    }

    @GetMapping("/getUserInfo")
    public RestResponse getUserInfo2(@RequestParam("openid") String openid) {
        User user = repository.findByOpenid(openid);
        return ResultVOUtil.success(user);
    }

    /**
     * 用户登录
     */
    @GetMapping("/login")
    public RestResponse login(String username, String password, HttpServletRequest request, HttpServletResponse response) {
        log.info("username:{}, password:{}", username, password);
        Map<String, Object> result = new HashMap<>(16);

        User user = repository.findByPhoneAndPassword(username, password);
        if (Objects.isNull(user)) {
            log.error("用户不存在, username={}, password={}", username, password);
            throw new SellException(ResultEnum.LOGIN_FAIL);
        }

        HttpSession session = request.getSession();
        session.setAttribute("userId", user.getOpenid());
        SessionListener.addSession(session);
        String token = JwtUtil.sign(user.getOpenid());
        log.info("微信登录成功的token={}", token);
        user.setToken(token);
        user.setUpdateTime(new Date());
        repository.save(user);


        Integer expire = RedisConstant.EXPIRE;
        //3. 设置token至cookie
        CookieUtil.set(response, CookieConstant.TOKEN, token, expire);

        result.put("openid", user.getOpenid());
        result.put("token", user.getToken());
        result.put("userInfo", user);
        result.put("state", 1);
        return ResultVOUtil.success(result);
    }

    /**
     * 微信授权登录
     */
    @PostMapping("/wx-login")
    public RestResponse wxAuthorization(@RequestBody @Valid UserForm userForm, HttpServletRequest request) {
        log.info("userForm:{}", userForm);
        Map<String, Object> result = new HashMap<>();
        String appId = userForm.getAppId();
        String code = userForm.getCode();
        String secret = userForm.getSecret();

        if (StringUtils.isEmpty(code)) {
            throw new SellException(ResultEnum.LOGIN_FAIL);
        }

        if (StringUtils.isEmpty(appId)) {
            appId = wechatAccountConfig.getMpAppId();
        }

        if (StringUtils.isEmpty(secret)) {
            secret = wechatAccountConfig.getMpAppSecret();
        }

        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("appid", appId));
        params.add(new BasicNameValuePair("secret", secret));
        params.add(new BasicNameValuePair("js_code", code));
        params.add(new BasicNameValuePair("grant_type", "authorization_code"));

        String responseResult = HttpUtil.doGet(projectUrlConfig.wechatMpAuthorize, params);
        JsonNode jsonNode = (JsonNode)JsonUtil.toNode(responseResult);
        if (Objects.isNull(jsonNode)) {
            throw new SellException(ResultEnum.LOGIN_FAIL);
        }
        String sessionKey = jsonNode.get("session_key").asText();
        String openId = jsonNode.get("openid").asText();

        if (StringUtils.isEmpty(sessionKey) && StringUtils.isEmpty(openId)) {
            throw new SellException(ResultEnum.LOGIN_FAIL);
        }

        User user = repository.findByOpenid(openId);
        HttpSession session = request.getSession();
        session.setAttribute("userId", openId);
        session.setAttribute("session_key", sessionKey);
        SessionListener.addSession(session);
        String token = JwtUtil.sign(openId);
        log.info("微信登录成功的token={}", token);

        if (Objects.isNull(user)) {
            user = new User();
            user.setUsername(userForm.getUsername());
            user.setOpenid(openId);
            user.setToken(token);
            user.setAvatarUrl(userForm.getAvatarUrl());
            user.setCity(userForm.getCity());
            user.setCountry(userForm.getCountry());
            user.setProvince(userForm.getProvince());
            user.setPhone(userForm.getPhone());
            user.setZhuohao(userForm.getZhuohao());
            user.setRenshu(userForm.getRenshu());
            user = repository.save(user);
        } else {
            user.setToken(token);
            user.setUpdateTime(new Date());
            repository.updateTokenByOpenid(openId, token);
        }

        result.put("openid", openId);
        result.put("token", token);
        result.put("session_key", sessionKey);
        result.put("userInfo", user);
        result.put("state", 1);

        return ResultVOUtil.success(result);
    }

    /**
     * 用户登出
     */
    @GetMapping("/logout")
    public RestResponse logout(HttpServletRequest request) {
        SessionListener.removeSession(request.getSession());
        return ResultVOUtil.success();
    }


    @PostMapping("/register")
    public RestResponse register(@RequestBody Map<String, String> map, HttpServletRequest request) {
        String phone = map.get("username");
        String password = map.get("password");
        String confirmm = map.get("confirmm");
        log.info("phone:{}, password:{}, confirmPwd:{}", phone, password, confirmm);

        if (StringUtils.isEmpty(phone) || !Objects.equals(password, confirmm)) {
            log.error("两次密码不一致");
            return RestResponse.error(2, "密码不匹配");
        }
        String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        String avatarUrl = url + "/avatar/default.png";
        String userId = KeyUtil.genUUID();

        User user = new User();
        user.setPhone(phone);
        user.setUsername(phone);
        user.setOpenid(userId);
        user.setPassword(password);
        user.setAvatarUrl(avatarUrl);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        User result = repository.save(user);

        return RestResponse.success(result);
    }

    @PostMapping("/address")
    public RestResponse addAddress(@RequestBody AddressForm addressForm, BindingResult bindingResult,
                                   @RequestHeader("token") String token,
                                   HttpServletRequest request) {
        log.info("addressForm: {} token: {}", addressForm, token);

        if (bindingResult.hasErrors()) {
            log.error("参数不正确, addressForm={}", addressForm);
            throw new SellException(ResultEnum.PARAM_ERROR.getCode(), bindingResult.getFieldError().getDefaultMessage());
        }

        if (StringUtils.isEmpty(token)) {
            log.error("token is null");
            throw new SellException(ResultEnum.TOKEN_ILLEGAL);
        }

        String openid = JwtUtil.getUserId(token);

        Address oldAddress = addressRepository.findByUserIdAndUserNameAndTelNumberAndProvinceNameAndCityNameAndCountyNameAndDetailInfo(
                openid, addressForm.getUserName(), addressForm.getTelNumber(), addressForm.getProvinceName(), addressForm.getCityName(),
                addressForm.getCountyName(), addressForm.getDetailInfo());

        List<Address> addresses = addressRepository.findByUserId(openid);
        if (!CollectionUtils.isEmpty(addresses)) {
            List<Address> collect = addresses.stream().peek(addr -> addr.setActive(0)).collect(Collectors.toList());
            addressRepository.saveAll(collect);
        }

        Address address = new Address();
        if (Objects.isNull(oldAddress)) {
            BeanUtils.copyProperties(addressForm, address);
        } else {
            address = oldAddress;
        }

        address.setActive(1);
        address.setUserId(openid);
        return RestResponse.success(addressRepository.saveAndFlush(address));
    }

    @GetMapping("/address")
    public RestResponse getAddress(@RequestHeader("token") String token) {
        if (StringUtils.isEmpty(token)) {
            log.error("token is null");
            throw new SellException(ResultEnum.TOKEN_ILLEGAL);
        }
        String openid = JwtUtil.getUserId(token);
        List<Address> addresses = addressRepository.findByUserIdAndActive(openid, 1);
        if (CollectionUtils.isEmpty(addresses)) {
            return RestResponse.success(null);
        }
        return RestResponse.success(addresses.get(0));
    }


    @GetMapping("/info")
    public RestResponse getUserInfo(@RequestHeader("token") String token) {
        log.info("token: {}", token);
        if (StringUtils.isEmpty(token)) {
            log.error("token is null");
            throw new SellException(ResultEnum.TOKEN_ILLEGAL);
        }
        String openid = JwtUtil.getUserId(token);
        User userInfo = repository.findByOpenid(openid);
        return RestResponse.success(userInfo);
    }

    @PostMapping("/info")
    public RestResponse modifyUserInfo(@RequestBody UserForm userForm, BindingResult bindingResult,
                                       @RequestHeader("token") String token) {
        log.info("token: {}", token);
        if (StringUtils.isEmpty(token)) {
            log.error("token is null");
            throw new SellException(ResultEnum.TOKEN_ILLEGAL);
        }
        String openid = JwtUtil.getUserId(token);
        User userInfo = repository.findByOpenid(openid);
        if (Objects.isNull(userInfo)) {
            log.error("userInfo is null");
            throw new SellException(ResultEnum.TOKEN_ILLEGAL);
        }

        if (!StringUtils.isEmpty(userForm.getUsername())) {
            userInfo.setUsername(userForm.getUsername());
        }

        if (!StringUtils.isEmpty(userForm.getGender())) {
            userInfo.setGender(userForm.getGender());
        }

        if (!StringUtils.isEmpty(userForm.getCity())) {
            userInfo.setCity(userForm.getCity());
        }

        if (!StringUtils.isEmpty(userForm.getCountry())) {
            userInfo.setCountry(userForm.getCountry());
        }

        if (!StringUtils.isEmpty(userForm.getProvince())) {
            userInfo.setProvince(userForm.getProvince());
        }

        userInfo.setUpdateTime(new Date());

        return RestResponse.success(repository.saveAndFlush(userInfo));
    }

}
