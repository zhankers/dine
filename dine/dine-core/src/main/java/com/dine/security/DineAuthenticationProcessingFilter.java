package com.dine.security;

import com.dine.constant.Constants;
import com.dine.model.form.SellerForm;
import com.dine.utils.JsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Optional;

@Slf4j
@Component
public class DineAuthenticationProcessingFilter extends AbstractAuthenticationProcessingFilter {

    /**
     * @param authenticationManager:             认证管理器
     * @param authenticationSuccessHandler: 认证成功处理
     * @param authenticationFailureHandler: 认证失败处理
     */
    public DineAuthenticationProcessingFilter(CusAuthenticationManager authenticationManager,
                AuthSuccessHandler authenticationSuccessHandler, AuthFailureHandler authenticationFailureHandler) {
        super(new AntPathRequestMatcher("/login", "POST"));
        this.setAuthenticationManager(authenticationManager);
        this.setAuthenticationSuccessHandler(authenticationSuccessHandler);
        this.setAuthenticationFailureHandler(authenticationFailureHandler);
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        System.out.println("TEST================DineAuthenticationProcessingFilter============================attemptAuthentication=====================");

        Optional.ofNullable(request.getContentType())
                .filter(contentType -> contentType.contains(Constants.REQUEST_HEADERS_CONTENT_TYPE))
                .orElseThrow(() -> new AuthenticationServiceException("request type is not supported: " + request.getContentType()));

        UsernamePasswordAuthenticationToken authRequest;
        try {
            var wrappedRequest = new MultiReadHttpServletRequest(request);
            // 将前端传递的数据转换成jsonBean数据格式
            var user = JsonUtil.parseObject(wrappedRequest.getFormBodyJsonString(wrappedRequest), SellerForm.class);
            authRequest = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), null);
            authRequest.setDetails(authenticationDetailsSource.buildDetails(wrappedRequest));
        } catch (Exception e) {
            throw new AuthenticationServiceException(e.getMessage());
        }
        return this.getAuthenticationManager().authenticate(authRequest);
    }
}