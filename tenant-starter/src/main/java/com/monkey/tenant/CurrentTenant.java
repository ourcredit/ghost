package com.monkey.tenant;

public class CurrentTenant {
    public CurrentTenant(String appId, Integer tenantId, Integer userId, String userName) {
        this.tenantId = tenantId;
        this.appId = appId;
        this.userId = userId;
        this.userName = userName;
    }
    public  CurrentTenant(){

    }
    private String appId;
    private Integer tenantId;
    private Integer userId;
    private String userName;
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }
}
