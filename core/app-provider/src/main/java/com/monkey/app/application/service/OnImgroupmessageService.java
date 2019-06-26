package com.monkey.app.application.service;

import com.monkey.app.application.IOnImgroupmessageService;
import com.monkey.app.entity.OnImgroupmessage1;
import com.monkey.app.repository.OnImgroupmessageRepository;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * IM群消息表 服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2019-06-26
 */
@Service
public class OnImgroupmessageService extends ServiceImpl<OnImgroupmessageRepository, OnImgroupmessage1> implements IOnImgroupmessageService {

}
