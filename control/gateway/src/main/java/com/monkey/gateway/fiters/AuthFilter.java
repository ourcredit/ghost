package com.monkey.gateway.fiters;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import tools.JWTUtil;

import javax.servlet.http.HttpServletRequest;

@Component
public class AuthFilter extends ZuulFilter {
    private static Logger log = LoggerFactory.getLogger(AuthFilter.class);

    @Override
    public String filterType() {
        return "pre";
    }

    @Override
    public int filterOrder() {
        return 0;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    @Override
    public Object run() throws ZuulException {
        RequestContext ctx = RequestContext.getCurrentContext();
        HttpServletRequest request = ctx.getRequest();
        log.info(String.format("%s >>> %s", request.getMethod(), request.getRequestURL().toString()));
        String url = request.getRequestURL().toString();
        if (url.contains("/auth/auth/login")) return null;
        Object accessToken = request.getHeader("Authorization");
        if (accessToken == null) {
            ctx.setSendZuulResponse(false);
            ctx.setResponseStatusCode(401);
            try {
                ctx.getResponse().setHeader("Authorization", accessToken.toString());

            } catch (Exception e) {
            }
            return null;
        }

        //解析token
        return null;
    }
}
