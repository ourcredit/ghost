package com.monkey.authprovider;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableDiscoveryClient
@EnableEurekaClient
@MapperScan("com.monkey.authprovider.repository")
@EnableCaching
public class AuthProviderApplication {
    public static void main(String[] args) {
        SpringApplication.run(AuthProviderApplication.class, args);
    }
}
