package com.monkey.app.application.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.app.application.IIMRecentSessionService;
import com.monkey.app.entity.IMRecentSession;
import com.monkey.app.repository.IMRecentSessionMapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-15
 */
@Service
@Qualifier(value = "IMRecentSessionService")
public class IMRecentSessionServiceImpl extends ServiceImpl<IMRecentSessionMapper, IMRecentSession> implements IIMRecentSessionService {

}
