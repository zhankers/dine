package com.dine.security;

import com.dine.utils.JsonUtil;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;

@Slf4j
public class MultiReadHttpServletRequest extends HttpServletRequestWrapper {

    private final byte[] body;

    public MultiReadHttpServletRequest(HttpServletRequest request) throws IOException {
        super(request);
        body = getBodyString(request).getBytes(StandardCharsets.UTF_8);
    }

    @Override
    public BufferedReader getReader() throws IOException {
        return new BufferedReader(new InputStreamReader(getInputStream()));
    }

    @Override
    public ServletInputStream getInputStream() throws IOException {

        final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(body);

        return new ServletInputStream() {

            @Override
            public int read() throws IOException {
                return byteArrayInputStream.read();
            }

            @Override
            public boolean isFinished() {
                return false;
            }

            @Override
            public boolean isReady() {
                return false;
            }

            @Override
            public void setReadListener(ReadListener readListener) {

            }
        };
    }

    /**
     * 获取请求Body
     */
    private String getBodyString(ServletRequest request) {

        try (
                var inputStream = request.getInputStream();
                var reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
        ) {
            return reader.lines().collect(StringBuilder::new, StringBuilder::append, StringBuilder::append).toString();
        } catch (IOException e) {
            log.error("content of request body is empty! exception:{}", e.getMessage());
            return "";
        }
    }

    /**
     * 将前端请求的表单数据转换成json字符串 - 前后端一体的情况下使用
     */
    public String getFormBodyJsonString(ServletRequest request) {
        var bodyMap = new HashMap<>(16);
        try {
            Enumeration<String> enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                bodyMap.put(enumeration.nextElement(), request.getParameter(enumeration.nextElement()));
            }
        } catch (Exception e) {
            log.error("request parameter conversion error ! ", e);
        }
        return JsonUtil.toJsonString(bodyMap);
    }

    /**
     * 将前端传递的json数据转换成json字符串 - 前后端分离的情况下使用
     */
    public String getBodyJsonString(ServletRequest request) {
        try {
            return request.getReader().lines()
                    .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append)
                    .toString();
        } catch (Exception e) {
            log.error("request parameter conversion error ! ", e);
            return "{}";
        }
    }

}