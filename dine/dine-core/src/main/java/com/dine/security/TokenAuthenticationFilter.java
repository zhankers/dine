package com.dine.security;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class TokenAuthenticationFilter extends BasicAuthenticationFilter {
	private final TokenManager tokenManager;

	public TokenAuthenticationFilter(AuthenticationManager authManager, TokenManager tokenManager) {
		super(authManager);
		this.tokenManager = tokenManager;
	}

	/**
	 * 这里假设token字段存在http头中。
	 * 从http头中取出token字段，并通过TokenManager解析出用户信息，生成
	 * UsernamePasswordAuthenticationToken交给SpringSecurity进行管理。
	 * @param req
	 * @param res
	 * @param chain
	 * @throws IOException
	 * @throws ServletException
	 */
	@Override
	protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("TEST================TokenAuthenticationFilter============================doFilterInternal=====================");

		String header = req.getHeader("token");

		if (header == null) {
			chain.doFilter(req, res);
			return;
		}

		UsernamePasswordAuthenticationToken authentication = getAuthentication(req);

		if (authentication != null) {
			SecurityContextHolder.getContext().setAuthentication(authentication);
		}
		chain.doFilter(req, res);
	}

	private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
		System.out.println("TEST================TokenAuthenticationFilter============================getAuthentication=====================");

		// token置于header里
		String token = request.getHeader("token");
		if (token != null && !"".equals(token.trim())) {
			// parse the token.
			String userName = tokenManager.getUserFromToken(token);

			if (!StringUtils.isEmpty(userName)) {
				return new UsernamePasswordAuthenticationToken(userName, token, new ArrayList<>());
			}
			return null;
		}
		return null;
	}
}
