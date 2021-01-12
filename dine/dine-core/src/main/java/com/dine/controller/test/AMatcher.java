package com.dine.controller.test;

import org.springframework.util.AntPathMatcher;

public class AMatcher extends AntPathMatcher {
    public String[] tokenizePattern(String pattern) {
        return super.tokenizePattern(pattern);
    }
}
