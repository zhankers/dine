package com.dine.security.impl;

import com.dine.repository.SellerInfoRepository;
import com.dine.repository.entity.SellerInfo;
import com.dine.security.model.SecureUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.List;

import static java.util.Objects.isNull;

/**
 * @Description: 用户登陆查询的操作
 * @Authr: yaunde
 * @Date: 2020-10-08 23:16
 */
@Service
@Slf4j
public class DineUserDetailsService implements UserDetailsService {

    @Autowired
    private SellerInfoRepository sellerInfoRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("TEST================DineUserDetailsService=======================loadUserByUsername================");

        log.info("表单登录用户名:" + username);
        SellerInfo sellerInfo = sellerInfoRepository.findByPhone(username);
        if (isNull(sellerInfo)) {
            return null;
        }

        String password = sellerInfo.getPassword();

        SecureUser secureUser = new SecureUser(username, password, roles("admin"));
        secureUser.setSalt(sellerInfo.getSalt());
        secureUser.setPhone(sellerInfo.getPhone());
        secureUser.setUserId(sellerInfo.getSellerId());
        return secureUser;
    }

    private List<GrantedAuthority> roles(String... roles) {
        List<GrantedAuthority> authorities = new ArrayList<>(roles.length);
        for (String role : roles) {
            Assert.isTrue(!role.startsWith("ROLE_"), () -> {
                return role + " cannot start with ROLE_ (it is automatically added)";
            });
            authorities.add(new SimpleGrantedAuthority("ROLE_" + role));
        }
        return authorities;

    }
}
