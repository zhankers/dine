package com.dine.config;

import com.dine.repository.support.LambdaRepositoryFactoryBean;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.web.config.EnableSpringDataWebSupport;


@Configuration
@EntityScan(basePackages = "com.dine.repository.entity")
@EnableJpaRepositories(basePackages = "com.dine.repository",
        repositoryFactoryBeanClass = LambdaRepositoryFactoryBean.class)
@EnableSpringDataWebSupport
public class JpaDataConfig {
    /**
     * <repositories base-package="com.acme.repository"
     * factory-class="com.acme.MyRepositoryFactoryBean" />
     */
}
