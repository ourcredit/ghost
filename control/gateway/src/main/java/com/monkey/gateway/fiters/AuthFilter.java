package com.monkey.gateway.fiters;

import com.alibaba.fastjson.JSON;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import result.Result;
import javax.servlet.http.HttpServletRequest;

@Component
public class AuthFilter extends ZuulFilter {
    /**
     *
     */
    private static final Logger log = LoggerFactory.getLogger(AuthFilter.class);

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
        RequestContext ctx = RequestContext.getCurrentContext();
        boolean b= !ctx.getRequest().getRequestURI().equals("/account/login");
        return  b;
    }

    @Override
    public Object run() throws ZuulException {
        RequestContext ctx = RequestContext.getCurrentContext();
        HttpServletRequest request = ctx.getRequest();
        Object accessToken = request.getHeader("Authorization");
        if (accessToken == null&&!request.getRequestURI().equals("/account/login")) {
            ctx.setSendZuulResponse(false);
            ctx.setResponseStatusCode(401);
            ctx.setResponseBody(JSON.toJSONString(Result.AuthNotAllow()));
            return null;
        }
        try {
            ctx.addZuulRequestHeader("Authorization",accessToken.toString());
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        //解析token
        return null;
    }
}
