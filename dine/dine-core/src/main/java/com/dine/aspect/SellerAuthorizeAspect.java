package com.dine.aspect;

import com.dine.constant.CookieConstant;
import com.dine.exception.SellerAuthorizeException;
import com.dine.utils.CookieUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 *
 */
@Aspect
@Component
@Slf4j
public class SellerAuthorizeAspect {


    //    @Pointcut("execution(public * com.dine.controller.Seller*.*(..))" +
    //    "&& !execution(public * com.dine.controller.SellerUserController.*(..))")
    @Pointcut("execution(public * com.dine.controller.Seller*.*(..))")
    public void verify() {
    }

    @Before("verify()")
    public void doVerify() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        //查询cookie
        Cookie cookie = CookieUtil.get(request, CookieConstant.TOKEN);
        if (cookie == null) {
            log.warn("【登录校验】Cookie中查不到token");
            throw new SellerAuthorizeException();
        }
    }
}
