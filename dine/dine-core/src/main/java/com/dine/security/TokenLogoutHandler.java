package com.dine.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TokenLogoutHandler implements LogoutHandler {
	private TokenManager tokenManager;

	public TokenLogoutHandler(TokenManager tokenManager) {
		this.tokenManager = tokenManager;
	}

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		System.out.println("TEST================TokenLogoutHandler============================logout=====================");

//		String token = request.getHeader("token");
//		if (token != null) {
//			tokenManager.removeToken(token);
//		}
//		ResultModel rm = new ResultModel(ResultCode.CODE_00000);
//
//		ObjectMapper mapper = new ObjectMapper();
//		response.setStatus(HttpStatus.OK.value());
//		response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
//		try {
//			mapper.writeValue(response.getWriter(), rm);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

}