package com.monkey.tenant;


import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Map;

/**

 * Yaml Sample: application.yaml
 * <pre>
 * redis:
 *   cache:
 *     enabled: true
 *     expireSeconds: 100
 *     clusterNodes: 1,2
 *     commandTimeout: 50
 *     someMap:
 *       key1: a
 *       key2: b
 *     someList:
 *     - c
 *     - d
 * </pre>
 *
 * To make <code>@ConditionalOnProperty</code> work properly, <code>apollo.bootstrap.enabled</code> should be set to true
 * and <code>redis.cache.enabled</code> should also be set to true. Check 'src/main/resources/application.yml' for more information.
 *
 * @author Jason Song(song_s@ctrip.com)
 */
@ConfigurationProperties(prefix = "redis.cache")
@RefreshScope
public class DynamicTenantConfig {

    private static final Logger logger = LoggerFactory.getLogger(DynamicTenantConfig.class);

    private int expireSeconds;
    private String clusterNodes;
    private int commandTimeout;

    private Map<String, String> someMap = Maps.newLinkedHashMap();
    private List<String> someList = Lists.newLinkedList();

    @PostConstruct
    private void initialize() {
        logger.info(
                "SampleRedisConfig initialized - expireSeconds: {}, clusterNodes: {}, commandTimeout: {}, someMap: {}, someList: {}",
                expireSeconds, clusterNodes, commandTimeout, someMap, someList);
    }

    public void setExpireSeconds(int expireSeconds) {
        this.expireSeconds = expireSeconds;
    }

    public void setClusterNodes(String clusterNodes) {
        this.clusterNodes = clusterNodes;
    }

    public void setCommandTimeout(int commandTimeout) {
        this.commandTimeout = commandTimeout;
    }

    public Map<String, String> getSomeMap() {
        return someMap;
    }

    public List<String> getSomeList() {
        return someList;
    }

    @Override
    public String toString() {
        return String.format(
                "[SampleRedisConfig] expireSeconds: %d, clusterNodes: %s, commandTimeout: %d, someMap: %s, someList: %s",
                expireSeconds, clusterNodes, commandTimeout, someMap, someList);
    }
}