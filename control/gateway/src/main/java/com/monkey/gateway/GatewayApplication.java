package com.monkey.gateway;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.ApplicationContext;

import java.awt.*;
import java.net.URI;

@SpringBootApplication
@EnableZuulProxy
@EnableEurekaClient
@EnableDiscoveryClient
@EnableApolloConfig
public class GatewayApplication {
    public static void main(String[] args) throws Exception {
        System.setProperty("java.awt.headless", "false");
        ApplicationContext context = new SpringApplicationBuilder(GatewayApplication.class).run(args);
        Desktop.getDesktop().browse(
                new URI("http://localhost:" + context.getEnvironment().getProperty("server.port", "8080")));
    }
}
