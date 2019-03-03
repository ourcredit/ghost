package com.monkey.account.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.monkey.account.entity.Account;
import org.apache.ibatis.reflection.MetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;


@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(MyMetaObjectHandler.class);

    @Override
    public void insertFill(MetaObject metaObject) {
        Object creationTime = getFieldValByName("creationTime",metaObject);
        if (null == creationTime) {
            this.setFieldValByName("creationTime",  LocalDateTime.now(), metaObject);//版本号3.0.6以及之前的版本
        }
        Object creatorUserId = metaObject.getValue("creatorUserId");
        //获取当前登录用户
        ServletRequestAttributes s=(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if(s!=null){
            HttpServletRequest req = s.getRequest();
            Account user = (Account) req.getAttribute("currentUser");
            if (null == creatorUserId &&user!=null) {
                this.setFieldValByName("creatorUserId",  user.getId(), metaObject);//版本号3.0.6以及之前的版本
            }
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
    }
}
