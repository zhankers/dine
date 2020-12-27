package com.dine.security;

import com.dine.repository.SellerInfoRepository;
import com.dine.repository.entity.SellerInfo;
import com.dine.security.impl.DineUserDetailsService;
import com.dine.security.model.SecureUser;
import com.dine.utils.SecureUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

@Component
public class AdminAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    DineUserDetailsService userDetailsService;
    @Autowired
    private SellerInfoRepository userMapper;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        System.out.println("TEST================AdminAuthenticationProvider=======================authenticate================");

        // 获取前端表单中输入后返回的用户名、密码
        String userName = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        SecureUser userInfo = (SecureUser)userDetailsService.loadUserByUsername(userName);

        boolean isValid = SecureUtil.isValidPassword(password, userInfo.getPassword(), userInfo.getSalt());
        // 验证密码
        if (!isValid) {
            throw new BadCredentialsException("password error");
        }

        // 前后端分离情况下 处理逻辑...
        // 更新登录令牌 - 之后访问系统其它接口直接通过token认证用户权限...
        String token = SecureUtil.encodePassword(System.currentTimeMillis() + userInfo.getSalt(), userInfo.getSalt());
        SellerInfo sellerInfo = userMapper.findBySellerId(userInfo.getUserId());

        sellerInfo.setToken(token);
        userMapper.save(sellerInfo);
        userInfo.setToken(token);


        return new UsernamePasswordAuthenticationToken(userInfo, password, userInfo.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}