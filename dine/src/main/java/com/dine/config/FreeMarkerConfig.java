package com.dine.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.annotation.PostConstruct;

@Slf4j
@Configuration
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FreeMarkerConfig {

    @Autowired
    private freemarker.template.Configuration configuration;
    private InternalResourceViewResolver resourceViewResolver;

    @Value(value = "${server.servlet.context-path}")
    private String ctx;

    @Value(value = "${project-url.websocket-url:'localhost:8080'}")
    private String webSocketUrl;

    /**
     * Spring 初始化的时候加载配置
     * @throws Exception
     */
    @PostConstruct
    public void setConfigure() throws Exception {

        // 加载html的资源路径
        configuration.setSharedVariable("ctx", ctx);
        configuration.setSharedVariable("webSocket_url", webSocketUrl);

    }

}