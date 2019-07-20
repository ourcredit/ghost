package com.monkey.gateway;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import com.didispace.swagger.butler.EnableSwaggerButler;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@SpringBootApplication
@EnableZuulProxy
@EnableEurekaClient
@EnableDiscoveryClient
@EnableApolloConfig
@EnableSwaggerButler
public class GatewayApplication {
    public static void main(String[] args) throws Exception {
         new SpringApplicationBuilder(GatewayApplication.class).run(args);
    }
}
