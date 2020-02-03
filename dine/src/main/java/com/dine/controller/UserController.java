package com.dine.controller;

import com.dine.entity.User;
import com.dine.enums.ResultEnum;
import com.dine.exception.SellException;
import com.dine.form.UserForm;
import com.dine.repository.UserRepository;
import com.dine.utils.JwtUtil;
import com.dine.utils.KeyUtil;
import com.dine.utils.ResultVOUtil;
import com.dine.vo.ResultVO;
import com.google.common.base.Objects;
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

import javax.validation.Valid;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
    public ResultVO login(String username, String password) {
        log.info("username:{}, password:{}", username, password);
        Map<String, Object> result = new HashMap<>(16);
        result.put("openid", "13423215432551435");
        result.put("state", 1);
        return ResultVOUtil.success(result);
    }

    @PostMapping("/register")
    public ResultVO register(@RequestBody Map<String, String> map) {
        String username = map.get("username");
        String password = map.get("password");
        String confirmm = map.get("confirmm");
        log.info("username:{}, password:{}, confirmPwd:{}", username, password, confirmm);

        if (StringUtils.isEmpty(username) || !Objects.equal(password, confirmm)) {
            log.error("两次密码不一致");
            return ResultVO.error(2, "密码不匹配");
        }

        String userId = KeyUtil.genUUID();
        String token = JwtUtil.sign(String.valueOf(userId));

        System.out.println(token.length() +" --- ");

        User example = new User();
        example.setUsername(username);
        example.setOpenid(userId);
        example.setToken(token);
        example.setPassword(password);
        example.setCreateTime(new Date());
        example.setUpdateTime(new Date());
        User user = repository.save(example);

        repository.save(user);

        return ResultVO.success(user);
    }

}
