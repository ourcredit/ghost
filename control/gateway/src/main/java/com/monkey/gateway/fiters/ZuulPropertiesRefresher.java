package com.monkey.gateway.fiters;

import com.ctrip.framework.apollo.model.ConfigChangeEvent;
import com.ctrip.framework.apollo.spring.annotation.ApolloConfigChangeListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.scope.refresh.RefreshScope;
import org.springframework.stereotype.Component;
@Component
public class ZuulPropertiesRefresher {

    private static final Logger logger = LoggerFactory.getLogger(ZuulPropertiesRefresher.class);

    private final RefreshScope refreshScope;

    @Autowired
    public ZuulPropertiesRefresher(RefreshScope refreshScope) {
        this.refreshScope = refreshScope;
    }

    @ApolloConfigChangeListener
    public void onChange(ConfigChangeEvent changeEvent) {
        boolean zuulPropertiesChanged = false;
        for (String changedKey : changeEvent.changedKeys()) {
            if (changedKey.startsWith("zuul.")) {
                zuulPropertiesChanged = true;
                break;
            }
        }
        if (zuulPropertiesChanged) {
            logger.info("Refreshing zuul properties!");
            refreshScope.refresh("ZUUL_PROPERTIES_BEAN");
        }
    }
}
