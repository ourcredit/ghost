package com.monkey.gateway.fiters;

import com.ctrip.framework.apollo.model.ConfigChangeEvent;
import com.ctrip.framework.apollo.spring.annotation.ApolloConfigChangeListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.scope.refresh.RefreshScope;
import org.springframework.stereotype.Component;

@Component
public class ZuulConfigRefreshConfig {
    private final ZuulConfig zuulConfig;
    private final RefreshScope _ref;

    @Autowired
    public ZuulConfigRefreshConfig(ZuulConfig zuulConfig, RefreshScope _ref) {
        this.zuulConfig = zuulConfig;
        this._ref = _ref;
    }
    @ApolloConfigChangeListener
    public void onChange(ConfigChangeEvent e) {
        _ref.refresh("zuul.configuration.properties");
    }

}
