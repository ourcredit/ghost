package com.monkey.tenant;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import tools.JWTUtil;

public class OrgCodeInterceptor implements HandlerInterceptor {
    private static final Logger LOGGER = LoggerFactory.getLogger(HandlerInterceptor.class);
    private String orgCodeHeaderName = "tenantName";
    private String oauthName = "Authorization";

    private Set<String> validOrgCodes;


    void setOrgCodeHeaderName(String orgCodeName) {
        orgCodeHeaderName = orgCodeName;
    }

    void setValidOrgCodes(Set<String> validOrgCodes) {
        this.validOrgCodes = validOrgCodes;
    }

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) {
        String tenantName = httpServletRequest.getHeader(orgCodeHeaderName);
        String oauth = httpServletRequest.getHeader(oauthName);
        if (tenantName == null) {
            LOGGER.error("未获取到租户编码" + orgCodeHeaderName);
            return false;
        }
        if (!validOrgCodes.contains(tenantName)) {
            LOGGER.error(String.format("无效的租户编码", tenantName));
            return false;
        }
        OrgCodeHolder.putOrgCode(tenantName);
        String appId = httpServletRequest.getHeader("appId");
        CurrentTenant current=new CurrentTenant();
        if(appId.isEmpty()){
            current.setAppId("88888");
        }else {
            current.setAppId(appId);
        }
        if(oauth!=null&& !oauth.isEmpty()){
            current.setAppId(JWTUtil.getUserName(oauth));
            current.setUserId(JWTUtil.getUserId(oauth));
            current.setUserName(JWTUtil.getUserName(oauth));
            ApplicationContext.getInstance().setCurrent(current);
        }
        return true;
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        OrgCodeHolder.remove();
        ApplicationContext.getInstance().setCurrent(null);
    }
}