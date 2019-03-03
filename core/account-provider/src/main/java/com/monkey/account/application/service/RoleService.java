package com.monkey.account.application.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.account.application.IRoleService;
import com.monkey.account.entity.Role;
import com.monkey.account.repository.RoleRepository;
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
public class RoleService extends ServiceImpl<RoleRepository, Role> implements IRoleService {

}
