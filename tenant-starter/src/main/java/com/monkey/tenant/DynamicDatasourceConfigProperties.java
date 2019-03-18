package com.monkey.tenant;

import org.springframework.boot.context.properties.ConfigurationProperties;
import java.util.Map;
@ConfigurationProperties(prefix = "dynamicds")
public class DynamicDatasourceConfigProperties {
    private String tenantId;
    private Map<String, String> general;
    private Map<String, Map<String, String>> tenants;


    public Map<String, String> getGeneral() {
        return general;
    }

    public void setGeneral(Map<String, String> general) {
        this.general = general;
    }

    public Map<String, Map<String, String>> getTenants() {
        return tenants;
    }

    public void setTenants(Map<String, Map<String, String>> tenants) {
        this.tenants = tenants;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }
}
