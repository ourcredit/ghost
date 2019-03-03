package com.monkey.account.application.service;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.account.application.IUserRoleService;
import com.monkey.account.entity.UserRole;
import com.monkey.account.repository.UserRoleRepository;
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
public class UserRoleService extends ServiceImpl<UserRoleRepository, UserRole> implements IUserRoleService {

}
