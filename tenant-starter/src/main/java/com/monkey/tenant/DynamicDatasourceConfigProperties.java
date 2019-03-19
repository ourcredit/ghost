package com.monkey.tenant;

import com.ctrip.framework.apollo.Config;
import com.ctrip.framework.apollo.spring.annotation.ApolloConfig;
import org.springframework.boot.context.properties.ConfigurationProperties;
import java.util.Map;
@ConfigurationProperties(prefix = "dynamicds")
public class DynamicDatasourceConfigProperties {
    @ApolloConfig("tenants.yml")
    private Config _config;

    private String orgCodeHeader;
    private Map<String, String> general;
    private Map<String, Map<String, String>> tenants;
    public Map<String, String> getGeneral() {
        return  general;
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


    public String getOrgCodeHeader() {
        return _config.getProperty("dynamicds.orgCodeHeader","TenantId");
    }

    public void setOrgCodeHeader(String orgCodeHeader) {
        this.orgCodeHeader = orgCodeHeader;
    }
}
