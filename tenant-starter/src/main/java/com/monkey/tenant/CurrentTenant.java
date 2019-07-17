package com.monkey.tenant;

public class CurrentTenant {
    public CurrentTenant( Integer tenantId, Integer userId, String userName) {
        this.tenantId = tenantId;
        this.userId = userId;
        this.userName = userName;
    }
    public  CurrentTenant(){

    }
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
}
