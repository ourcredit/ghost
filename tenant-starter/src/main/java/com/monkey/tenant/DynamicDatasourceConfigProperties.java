package com.monkey.tenant;

import com.ctrip.framework.apollo.Config;
import com.ctrip.framework.apollo.spring.annotation.ApolloConfig;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
@ConfigurationProperties
public class DynamicDatasourceConfigProperties {
    @ApolloConfig("tenants.yml")
    private Config _config;
    private String tenantId;
    private Map<String, String> general;
    private Map<String, Map<String, String>> tenants;
    public Map<String, String> getGeneral() {
        HashMap<String, String> map = new HashMap<String, String>() ;
        map.put("maxPoolSize", _config.getProperty("tenantconfig.general.maxPoolSize","10"));
        map.put("minIdle",_config.getProperty("tenantconfig.general.minIdle","3"));
        map.put("defaultTenant",_config.getProperty("tenantconfig.general.defaultTenant","account"));
        return  map;
    }


    public Map<String, Map<String, String>> getTenants() {
        String a[]=new String[9];
      String st=  _config.getProperty("tenantconfig.tenants","[]");
        Map<String, Map<String, String>> res=new HashMap<>();
//        for (String s:
//             st) {
//            //jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!&
//           String[] arr= s.split(",");
//           Map<String,String> temp=new HashMap<>();
//            temp.put("userName",arr[2]);
//            temp.put("password",arr[3]);
//            temp.put("url",arr[0]);
//            res.put(arr[1],temp);
//        }
        return res;
    }

    public String getTenantId() {
        return _config.getProperty("tenantconfig.tenantId","tenantName");
    }
}
