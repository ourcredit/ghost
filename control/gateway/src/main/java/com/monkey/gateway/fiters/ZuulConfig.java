package com.monkey.gateway.fiters;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.zuul.filters.ZuulProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
@EnableApolloConfig("zuulconfig")
public class ZuulConfig {
    @Bean(name = "zuul.configuration.properties")
    @RefreshScope
    @Primary
    public ZuulProperties zuulProperties(){
        ZuulProperties p=  new ZuulProperties();
        return  p;
    }
}
