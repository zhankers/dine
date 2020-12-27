package com.dine.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class AuthSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
        System.out.println("TEST================AuthSuccessHandler============================onAuthenticationSuccess=====================");

//        User user = new User();
//        SecurityUser securityUser = ((SecurityUser) auth.getPrincipal());
//        user.setToken(securityUser.getCurrentUserInfo().getToken());
//        ResponseUtils.out(response, ApiResult.ok("登录成功!", user));
    }
}