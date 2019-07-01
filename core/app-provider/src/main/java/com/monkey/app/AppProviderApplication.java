package com.monkey.app;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import com.monkey.tenant.EnableDynamicDS;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableDiscoveryClient
@EnableEurekaClient
@MapperScan("com.monkey.app.repository")
@EnableApolloConfig
@EnableDynamicDS
public class AppProviderApplication {
	public static void main(String[] args) {
		SpringApplication.run(AppProviderApplication.class, args);
	}
}
