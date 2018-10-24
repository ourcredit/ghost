package com.monkey.authprovider.application.role;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.authprovider.entity.Role;
import com.monkey.authprovider.repository.RoleRepository;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-10-24
 */
@Service
public class RoleService extends ServiceImpl<RoleRepository, Role> implements IRoleService {

}
