package com.dine.config;


import com.dine.security.TokenManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @Description:
 * @Authr: yaunde
 * @Date: 2020-10-08 15:33
 */
@Configuration
@EnableConfigurationProperties(SecurityProperties.class)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    static final String LOGIN_PAGE = "/login-view";
    private UserDetailsService userDetailsService;
    private TokenManager tokenManager;
    // private DefaultPasswordEncoder defaultPasswordEncoder;

    @Autowired
    public WebSecurityConfig(@Qualifier("dineUserDetailsService") UserDetailsService userDetailsService,
                             TokenManager tokenManager) {
        this.userDetailsService = userDetailsService;
        // this.defaultPasswordEncoder = defaultPasswordEncoder;
        this.tokenManager = tokenManager;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf()
//                .disable()
//                .authorizeRequests()
//                .antMatchers("/test/**").permitAll()
//                .antMatchers("/login").permitAll()
//                .antMatchers("/public/**").permitAll()
//                .anyRequest().authenticated()
//                .and()
//                .logout().logoutUrl("/logout")
//                .addLogoutHandler(new TokenLogoutHandler(tokenManager))
//                .and()
//                .addFilter(new TokenLoginFilter(authenticationManager(), tokenManager))
////                .addFilter(new TokenAuthenticationFilter(authenticationManager(), tokenManager))
////                .exceptionHandling().authenticationEntryPoint(new UnauthorizedEntryPoint())
////                .and()
//                .httpBasic();
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        // auth.userDetailsService(userDetailsService).passwordEncoder(defaultPasswordEncoder);
        auth.userDetailsService(userDetailsService);
    }
}
