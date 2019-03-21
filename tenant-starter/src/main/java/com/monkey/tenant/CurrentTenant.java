package com.monkey.tenant;

public class CurrentTenant {
    public CurrentTenant(String tenantName,Integer tenantId,Integer userId){
        this.tenantId=tenantId;
        this.tenantName=tenantName;
        this.userId=userId;
    }

    private String tenantName;
    private Integer tenantId;
    private Integer userId;

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
}
