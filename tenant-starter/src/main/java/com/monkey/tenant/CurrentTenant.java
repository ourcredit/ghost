package com.monkey.tenant;

public class CurrentTenant {
    public CurrentTenant(String tenantName, Integer tenantId, Integer userId, String userName) {
        this.tenantId = tenantId;
        this.tenantName = tenantName;
        this.userId = userId;
        this.userName = userName;
    }

    private String tenantName;
    private Integer tenantId;
    private Integer userId;
    private String userName;

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

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
}
