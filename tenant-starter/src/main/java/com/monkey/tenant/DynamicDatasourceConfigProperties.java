package com.monkey.tenant;

import com.ctrip.framework.apollo.Config;
import com.ctrip.framework.apollo.spring.annotation.ApolloConfig;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.HashMap;
import java.util.Map;

@ConfigurationProperties
public class DynamicDatasourceConfigProperties {
    @ApolloConfig("tenants.yml")
    private Config _config;
    private Map<String, String> general;
    private Map<String, Map<String, String>> tenants;

    Map<String, String> getGeneral() {
        general = new HashMap<>();
        general.put("maxPoolSize", _config.getProperty("tenantconfig.general.maxPoolSize", "10"));
        general.put("minIdle", _config.getProperty("tenantconfig.general.minIdle", "3"));
        general.put("defaultTenant", _config.getProperty("tenantconfig.general.defaultTenant", "account"));
        return general;
    }

    Map<String, Map<String, String>> getTenants() {
        String a[] = new String[9];
        Integer count=    _config.getIntProperty("tenantconfig.tenantCount",1);
        tenants = new HashMap<>();
        for (int i = 0; i <count ; i++) {
            String key="tenantconfig.tenants["+i+"]";
          String st[]  = _config.getArrayProperty(key, "tenants", a);
            for (String s:st) {
                if(s!=null){
                    //jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!&
                    String[] arr= s.split(",");
                    Map<String,String> temp=new HashMap<>();
                    temp.put("userName",arr[2]);
                    temp.put("password",arr[3]);
                    temp.put("url",arr[0]);
                    tenants.put(arr[1],temp);
                }
            }
        }
        return tenants;
    }

    String getTenantId() {
        return _config.getProperty("tenantconfig.tenantId", "tenantName");
    }
}
