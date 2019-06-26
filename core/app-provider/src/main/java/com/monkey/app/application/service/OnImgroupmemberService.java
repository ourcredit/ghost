package com.monkey.app.application.service;

import com.monkey.app.application.IOnImgroupmemberService;
import com.monkey.app.entity.OnImgroupmember;
import com.monkey.app.repository.OnImgroupmemberRepository;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户和群的关系表 服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2019-06-26
 */
@Service
public class OnImgroupmemberService extends ServiceImpl<OnImgroupmemberRepository, OnImgroupmember> implements IOnImgroupmemberService {

}
