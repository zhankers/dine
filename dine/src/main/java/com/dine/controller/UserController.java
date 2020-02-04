package com.dine.controller;

import com.dine.constant.CookieConstant;
import com.dine.constant.RedisConstant;
import com.dine.entity.User;
import com.dine.enums.ResultEnum;
import com.dine.exception.SellException;
import com.dine.form.UserForm;
import com.dine.listener.SessionListener;
import com.dine.repository.UserRepository;
import com.dine.utils.CookieUtil;
import com.dine.utils.JwtUtil;
import com.dine.utils.KeyUtil;
import com.dine.utils.ResultVOUtil;
import com.dine.vo.ResultVO;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * 用户相关
 */
@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {

    @Autowired
    UserRepository repository;

    /**
     * 创建用户
     *
     * @param userForm
     * @param bindingResult
     * @return
     */
    @PostMapping("/save")
    public ResultVO create(@Valid UserForm userForm, BindingResult bindingResult) {
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
        user.setPhone(userForm.getPhone());
        user.setZhuohao(userForm.getZhuohao());
        user.setRenshu(userForm.getRenshu());

        return ResultVOUtil.success(repository.save(user));
    }

    @GetMapping("/getUserInfo")
    public ResultVO getUserInfo(@RequestParam("openid") String openid) {
        User user = repository.findByOpenid(openid);
        return ResultVOUtil.success(user);
    }

    /**
     * 用户登录
     */
    @GetMapping("/login")
    public ResultVO login(String username, String password, HttpServletRequest request, HttpServletResponse response) {
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
     * 用户登录
     */
    @GetMapping("/logout")
    public ResultVO logout(HttpServletRequest request) {
        SessionListener.removeSession(request.getSession());
        return ResultVOUtil.success();
    }


    @PostMapping("/register")
    public ResultVO register(@RequestBody Map<String, String> map, HttpServletRequest request) {
        String phone = map.get("username");
        String password = map.get("password");
        String confirmm = map.get("confirmm");
        log.info("phone:{}, password:{}, confirmPwd:{}", phone, password, confirmm);

        if (StringUtils.isEmpty(phone) || !Objects.equals(password, confirmm)) {
            log.error("两次密码不一致");
            return ResultVO.error(2, "密码不匹配");
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

        return ResultVO.success(result);
    }

}
