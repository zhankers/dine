package com.dine.security;


import com.dine.security.model.TokenUserDetails;
import com.dine.model.form.SellerForm;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * TokenLoginFilter过滤器是对登录信息的验证。
 *
 * 如果是form表单提交，这个地方其实和上篇的一样，可以用AuthenticationProvider对用户名密码进行校验，校验成功了之后，需要生成token并返回。
 *
 * 如果是json数据，我们不能通过配置获取到用户名密码，因此需要用TokenLoginFilter来获取。
 */
public class TokenLoginFilter extends UsernamePasswordAuthenticationFilter {
	private final AuthenticationManager authenticationManager;
	private final TokenManager tokenManager;

	public TokenLoginFilter(AuthenticationManager authenticationManager, TokenManager tokenManager) {
		this.authenticationManager = authenticationManager;
		this.tokenManager = tokenManager;
		this.setPostOnly(false);
		this.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/login"));
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res)
			throws AuthenticationException {
		System.out.println("TEST================TokenLoginFilter============================attemptAuthentication=====================================");
		try {
			SellerForm user = new ObjectMapper().readValue(req.getInputStream(), SellerForm.class);
			return authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), new ArrayList<>()));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}

	}

	@Override
	protected void successfulAuthentication(HttpServletRequest req, HttpServletResponse res, FilterChain chain,
			Authentication auth) throws IOException, ServletException {
		System.out.println("TEST===============================TokenLoginFilter==================================successfulAuthentication================");

		TokenUserDetails user = (TokenUserDetails) auth.getPrincipal();

		String token = tokenManager.createToken(user.getUsername());

//		LoginUserRes loginUserRes = new LoginUserRes();
//		loginUserRes.setUsername(user.getUsername());
//		loginUserRes.setToken(token);
//		ResultModel rm = new ResultModel(ResultCode.CODE_00000);
//		rm.setData(loginUserRes);
//
//		ObjectMapper mapper = new ObjectMapper();
//		res.setStatus(HttpStatus.OK.value());
//		res.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
//		mapper.writeValue(res.getWriter(), rm);
	}

	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException e) throws IOException, ServletException {

		System.out.println("TEST===============================TokenLoginFilter==================================unsuccessfulAuthentication================");

		response.setStatus(HttpStatus.OK.value());
		ObjectMapper mapper = new ObjectMapper();
//		ResultModel rm = null;
//		if (e instanceof BadCredentialsException) {
//			rm = new ResultModel(ResultCode.CODE_00001.getCode(), e.getMessage());
//		} else if (e instanceof UsernameNotFoundException) {
//			rm = new ResultModel(ResultCode.CODE_00011);
//		} else if (e instanceof AuthenticationCredentialsNotFoundException) {
//			rm = new ResultModel(ResultCode.CODE_00003);
//		} else if (e instanceof ProviderNotFoundException) {
//			rm = new ResultModel(ResultCode.CODE_10000, e.getMessage());
//		} else {
//			rm = new ResultModel(ResultCode.CODE_00013);
//		}
//
//		response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
//		mapper.writeValue(response.getWriter(), rm);

	}
}
