package com.monkey.app.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(MyMetaObjectHandler.class);
    @Override
    public void insertFill(MetaObject metaObject) {
        Object creationTime = getFieldValByName("creationTime",metaObject);
        //  Object tenantId = getFieldValByName("tenantId",metaObject);
        if (null == creationTime) {
          Long i=  tools.DateUtil.timestamp();
            metaObject.setValue("created",i);
        }
//        Object creatorUserId = metaObject.getValue("creatorUserId");
//        //获取当前登录用户
//        ServletRequestAttributes s=(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//        if(s!=null){
//            HttpServletRequest req = s.getRequest();
//            User user = (User) req.getAttribute("currentUser");
//            if (null == creatorUserId&&user!=null) {
//                metaObject.setValue("creatorUserId", user.getId());
//            }
//
//        }
    }
    @Override
    public boolean openUpdateFill() {
        return false;
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 关闭更新填充、这里不执行
    }
}
