package com.dine.security.impl;

import com.dine.security.TokenManager;
import io.jsonwebtoken.CompressionCodecs;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class JwtTokenManager implements TokenManager {
	@Value("${token.expire:3600}")
	private long tokenExpiration;
	@Value("${token.key:}")
	private String tokenSignKey;

	@Override
	public String createToken(String username) {
		System.out.println("TEST================JwtTokenManager=======================createToken================");

		return Jwts.builder().setSubject(username)
				.setExpiration(new Date(System.currentTimeMillis() + tokenExpiration))
				.signWith(SignatureAlgorithm.HS512, tokenSignKey)
				.compressWith(CompressionCodecs.GZIP)

				.compact();
	}

	@Override
	public String getUserFromToken(String token) {
		System.out.println("TEST================JwtTokenManager=======================getUserFromToken================");

		return Jwts.parser().setSigningKey(tokenSignKey)
				.parseClaimsJws(token)
				.getBody()
				.getSubject();
	}

}