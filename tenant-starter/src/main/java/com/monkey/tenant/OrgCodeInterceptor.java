package com.monkey.tenant;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class OrgCodeInterceptor implements HandlerInterceptor {
    private static final Logger LOGGER = LoggerFactory.getLogger(HandlerInterceptor.class);
    private String orgCodeHeaderName = "tenantName";

    private Set<String> validOrgCodes;


    void setOrgCodeHeaderName(String orgCodeName) {
        orgCodeHeaderName = orgCodeName;
    }

    void setValidOrgCodes(Set<String> validOrgCodes) {
        this.validOrgCodes = validOrgCodes;
    }

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) {
        String orgCodeVal = httpServletRequest.getHeader(orgCodeHeaderName);
        if (orgCodeVal == null) {
            LOGGER.error("未传递租户编码" + orgCodeHeaderName);
            return false;
        }
        if (!validOrgCodes.contains(orgCodeVal)) {
            LOGGER.error(String.format("无效的租户编码", orgCodeVal));
            return false;
        }
        OrgCodeHolder.putOrgCode(orgCodeVal);
        return true;
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("请求之后被调用的地方");
        OrgCodeHolder.remove();
    }


}