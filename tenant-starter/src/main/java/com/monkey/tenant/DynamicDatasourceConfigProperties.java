package com.monkey.tenant;

import org.springframework.boot.context.properties.ConfigurationProperties;
import java.util.Map;
@ConfigurationProperties(prefix = "dynamicds")
public class DynamicDatasourceConfigProperties {
    private String orgCodeHeader;
    private Map<String, String> general;
    private Map<String, Map<String, String>> tenants;

    public String getOrgCodeHeader() {
        return orgCodeHeader;
    }

    public void setOrgCodeHeader(String orgCodeHeader) {
        this.orgCodeHeader = orgCodeHeader;
    }

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
}
