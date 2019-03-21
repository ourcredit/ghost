package com.monkey.authcustomer.config;

import feign.Request;
import feign.Retryer;
import org.springframework.context.annotation.Bean;

public class FeignConfig {
    /**
     * 配置请求重试
     *
     */
    @Bean
    public Retryer feignRetryer() {
        return new Retryer.Default(200, 2000, 10);
    }


    /**
     * 设置请求超时时间
     *默认
     * public Options() {
     * this(10 * 1000, 60 * 1000);
     * }
     *
     */
    @Bean
    Request.Options feignOptions() {
        return new Request.Options(60 * 1000, 60 * 1000);
    }
    /**
     * 打印请求日志
     * @return level
     */
    @Bean
    public feign.Logger.Level multipartLoggerLevel() {
        return feign.Logger.Level.FULL;
    }

}
