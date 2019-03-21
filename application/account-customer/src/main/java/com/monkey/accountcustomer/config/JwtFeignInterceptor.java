package com.monkey.accountcustomer.config;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.Map;

@Component
public class JwtFeignInterceptor implements RequestInterceptor {
  //  private final String key = "Authorization";

    @Override
    public void apply(RequestTemplate template) {
        Map<String,String> headers = getHeaders(getHttpServletRequest());
        for(String headerName : headers.keySet()){
            template.header(headerName, headers.get(headerName));
        }
    }
    private HttpServletRequest getHttpServletRequest() {
        try {
        RequestAttributes w=    RequestContextHolder.getRequestAttributes();
            ServletRequestAttributes s=(ServletRequestAttributes)w;
          return   s.getRequest();
           // return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private Map<String, String> getHeaders(HttpServletRequest request) {
        Map<String, String> map = new LinkedHashMap<>();
        Enumeration<String> enumeration = request.getHeaderNames();
        while (enumeration.hasMoreElements()) {
            String key = enumeration.nextElement();
            String value = request.getHeader(key);
            map.put(key, value);
        }
        return map;
    }
}
