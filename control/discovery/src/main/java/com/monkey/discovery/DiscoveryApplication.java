package com.monkey.discovery;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication()
@EnableEurekaServer
@EnableApolloConfig
public class DiscoveryApplication {
//    static {
//        System.setProperty("-Dapp.id","ghost");
//        System.setProperty("-Denv","dev");
//        System.setProperty("-Ddev_meta","http://47.94.214.199:8080");
//    }
    public static void main(String[] args) {
        SpringApplication.run( DiscoveryApplication.class, args );
    }
}
