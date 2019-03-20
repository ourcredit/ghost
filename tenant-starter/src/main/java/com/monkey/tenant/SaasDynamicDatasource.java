package com.monkey.tenant;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;

import javax.sql.DataSource;

import org.springframework.jdbc.datasource.AbstractDataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;



public class SaasDynamicDatasource extends AbstractDataSource{

    private final Map<String, DataSource>  dataSourceMap = new WeakHashMap<>();

    private GeneralAttributes generalAttributes;
    private Map<String, TenantDatasourceAttributes> tenantDatasourceAttributesMap;


    public void setDsProperties(DynamicDatasourceConfigProperties dsProperties) {
        parse(dsProperties);
    }

    private void parse(DynamicDatasourceConfigProperties dsProperties2) {
        Map<String, String> generalMap = dsProperties2.getGeneral();
        generalAttributes = new GeneralAttributes();
        generalAttributes.setMaxPoolSize(Integer.parseInt(generalMap.get("maxPoolSize")));
        generalAttributes.setMinIdle(Integer.parseInt(generalMap.get("minIdle")));
        generalAttributes.setDefaultTenant(generalMap.get("defaultTenant"));

        Map<String, Map<String, String>> tenants = dsProperties2.getTenants();
        tenantDatasourceAttributesMap = new HashMap<>();

        for (String orgCode : tenants.keySet()) {
            Map<String, String> tenantDSAttr = tenants.get(orgCode);
            TenantDatasourceAttributes tenantDatasourceAttributes = new TenantDatasourceAttributes();
            tenantDatasourceAttributes.setUrl(tenantDSAttr.get("url"));
            tenantDatasourceAttributes.setUserName(tenantDSAttr.get("userName"));
            tenantDatasourceAttributes.setPassword(tenantDSAttr.get("password"));
            if(tenantDSAttr.containsKey("maxPoolSize")) {
                tenantDatasourceAttributes.setMaxPoolSize(Integer.parseInt(tenantDSAttr.get("maxPoolSize")));
            }
            else {
                tenantDatasourceAttributes.setMaxPoolSize(generalAttributes.getMaxPoolSize());
            }
            if(tenantDSAttr.containsKey("minIdle")) {
                tenantDatasourceAttributes.setMinIdle(Integer.parseInt(tenantDSAttr.get("minIdle")));
            }
            else {
                tenantDatasourceAttributes.setMinIdle(generalAttributes.getMinIdle());
            }
            tenantDatasourceAttributesMap.put(orgCode, tenantDatasourceAttributes);
        }

    }


    private static class GeneralAttributes {
        private int maxPoolSize;
        private int minIdle;
        private String defaultTenant;

        private int getMaxPoolSize() {
            return maxPoolSize;
        }

        private void setMaxPoolSize(int maxPoolSize) {
            this.maxPoolSize = maxPoolSize;
        }

        private int getMinIdle() {
            return minIdle;
        }

        private void setMinIdle(int minIdle) {
            this.minIdle = minIdle;
        }

        private String getDefaultTenant() {
            return defaultTenant;
        }

        private void setDefaultTenant(String defaultTenant) {
            this.defaultTenant = defaultTenant;
        }
    }

    private static class TenantDatasourceAttributes {
        private String url;
        private String userName;
        private String password;
        private int maxPoolSize;
        private int minIdle;

        private String getUrl() {
            return url;
        }

        private void setUrl(String url) {
            this.url = url;
        }

        private String getUserName() {
            return userName;
        }

        private void setUserName(String userName) {
            this.userName = userName;
        }

        private String getPassword() {
            return password;
        }

        private void setPassword(String password) {
            this.password = password;
        }

        private int getMaxPoolSize() {
            return maxPoolSize;
        }

        private void setMaxPoolSize(int maxPoolSize) {
            this.maxPoolSize = maxPoolSize;
        }

        private int getMinIdle() {
            return minIdle;
        }

        private void setMinIdle(int minIdle) {
            this.minIdle = minIdle;
        }
    }

    @Override
    public Connection getConnection() throws SQLException {
        String currentOrgCode = OrgCodeHolder.getOrgCode();
        if(currentOrgCode == null) {
            currentOrgCode = generalAttributes.getDefaultTenant();
        }
        if(!tenantDatasourceAttributesMap.containsKey(currentOrgCode)) {
            throw new SQLException("该租户尚未配置数据源链接 " + currentOrgCode);
        }
        TenantDatasourceAttributes tenantDatasourceAttributes = tenantDatasourceAttributesMap.get(currentOrgCode);
        DataSource ds = dataSourceMap.get(currentOrgCode);
        //double check
        if(ds == null) {
            synchronized(this) {
                ds = dataSourceMap.get(currentOrgCode);
                if(ds == null) {
                    HikariConfig config = new HikariConfig();
                    config.setDriverClassName("com.mysql.jdbc.Driver");
                    config.setJdbcUrl(tenantDatasourceAttributes.getUrl());
                    config.setUsername(tenantDatasourceAttributes.getUserName());
                    config.setPassword(tenantDatasourceAttributes.getPassword());
                    config.setMaximumPoolSize(tenantDatasourceAttributes.getMaxPoolSize());
                    config.setMinimumIdle(tenantDatasourceAttributes.getMinIdle());
                    ds =  new HikariDataSource(config);
                    dataSourceMap.put(currentOrgCode, ds);
                }
            }
        }
        return ds.getConnection();
    }

    @Override
    public Connection getConnection(String username, String password) throws SQLException {
        throw new SQLFeatureNotSupportedException();
    }
}