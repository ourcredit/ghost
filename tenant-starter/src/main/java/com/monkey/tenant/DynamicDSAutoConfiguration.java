package com.monkey.tenant;

import javax.sql.DataSource;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

@Configuration
@EnableApolloConfig
@EnableConfigurationProperties(DynamicDatasourceConfigProperties.class)
public class DynamicDSAutoConfiguration {

    private final DynamicDatasourceConfigProperties properties;

    @Autowired
    public DynamicDSAutoConfiguration(DynamicDatasourceConfigProperties properties) {
        this.properties = properties;
    }

    @Bean
    @ConditionalOnMissingBean
    @ConditionalOnClass(SaasDynamicDatasource.class)
    DataSource dataSource (){
        SaasDynamicDatasource ds = new SaasDynamicDatasource();
        ds.setDsProperties(properties);
        return ds;
    }

    @Bean
    @ConditionalOnMissingBean
    @ConditionalOnClass(SaasDynamicDatasource.class)
    OrgCodeInterceptor orgCodeInterceptor() {
        OrgCodeInterceptor interceptor = new OrgCodeInterceptor();
        interceptor.setOrgCodeHeaderName(properties.getTenantId());
        interceptor.setValidOrgCodes(properties.getTenants().keySet());
        return interceptor;
    }

    @Bean
    @ConditionalOnMissingBean
    @ConditionalOnClass(SaasDynamicDatasource.class)
    InterceptorRegister interceptorRegister() {
        InterceptorRegister interceptorRegister = new InterceptorRegister();
        return interceptorRegister;
    }
}
