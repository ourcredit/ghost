package com.monkey.account.application.service;

import com.monkey.account.entity.BaseRole;
import com.monkey.account.mapper.BaseRoleMapper;
import com.monkey.account.service.IBaseRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2019-03-03
 */
@Service
public class RoleService extends ServiceImpl<BaseRoleMapper, BaseRole> implements IBaseRoleService {

}
