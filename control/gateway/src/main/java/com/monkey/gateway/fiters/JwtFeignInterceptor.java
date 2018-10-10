package com.monkey.gateway.fiters;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.stereotype.Component;

import java.util.Collection;
@Component
public class JwtFeignInterceptor implements RequestInterceptor {
    private final String key = "Authorization";
    @Override
    public void apply(RequestTemplate template) {
        if (!template.headers().containsKey(key)) {
            Collection<String> currentToken = template.headers().get(key);
            if (!currentToken.isEmpty()){
                template.header(key, currentToken);
            }
        }
    }

}
