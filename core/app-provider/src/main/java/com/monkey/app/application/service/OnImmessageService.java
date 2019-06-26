package com.monkey.app.application.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.app.application.IOnImmessageService;
import com.monkey.app.entity.OnImmessage1;
import com.monkey.app.repository.OnImmessageRepository;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2019-06-26
 */
@Service
public class OnImmessageService extends ServiceImpl<OnImmessageRepository, OnImmessage1> implements IOnImmessageService {

}
