package com.dine.security;

public interface TokenManager {

    String createToken(String username);

    String getUserFromToken(String token);

    default void removeToken(String token) {
        //
    };

}