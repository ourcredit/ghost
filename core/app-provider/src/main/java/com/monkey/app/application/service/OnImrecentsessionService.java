package com.monkey.app.application.service;

import com.monkey.app.application.IOnImrecentsessionService;
import com.monkey.app.entity.OnImrecentsession;
import com.monkey.app.repository.OnImrecentsessionRepository;
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
public class OnImrecentsessionService extends ServiceImpl<OnImrecentsessionRepository, OnImrecentsession> implements IOnImrecentsessionService {

}
