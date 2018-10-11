package com.monkey.authprovider.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.logging.Log;
import com.alibaba.druid.support.logging.LogFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BasicDbConfig {
    private static final Log log = LogFactory.getLog(BasicDbConfig.class);
    //	配置数据源
    @Bean(name = "basicDataSource", initMethod = "init", destroyMethod = "close")
    public DruidDataSource initDataSource(SourceConfig mysql) {

        DruidDataSource dds = new DruidDataSource();
        dds.setDriverClassName(mysql.getDriverClassName());
        dds.setUrl(mysql.getUrl() );
        dds.setUsername(mysql.getUsername());
        dds.setPassword(mysql.getPassword());
//        dds.setInitialSize(bdop.getInitialSize());
//        dds.setMinIdle(bdop.getMinIdle());
//        dds.setMaxActive(bdop.getMaxActive());
//        dds.setMaxWait(bdop.getMaxWait());
//        dds.setTimeBetweenEvictionRunsMillis(bdop.getTimeBetweenEvictionRunsMillis());
//        dds.setMinEvictableIdleTimeMillis(bdop.getMinEvictableIdleTimeMillis());
//        dds.setValidationQuery(bdop.getValidationQuery());
//        dds.setTestWhileIdle(bdop.getTestWhileIdle());
//        dds.setTestOnBorrow(bdop.getTestOnBorrow());
//        dds.setTestOnReturn(bdop.getTestOnReturn());
//        dds.setPoolPreparedStatements(bdop.getPoolPreparedStatements());
//        dds.setMaxPoolPreparedStatementPerConnectionSize(bdop.getMaxPoolPreparedStatementPerConnectionSize());
        try {
            // dds.setFilters(bdop.getFilters());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dds;
    }


}
