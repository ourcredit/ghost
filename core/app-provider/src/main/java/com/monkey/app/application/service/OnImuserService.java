package com.monkey.app.application.service;

import com.monkey.app.application.IOnImuserService;
import com.monkey.app.entity.OnImuser;
import com.monkey.app.repository.OnImuserRepository;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class OnImuserService extends ServiceImpl<OnImuserRepository, OnImuser> implements IOnImuserService {

}
