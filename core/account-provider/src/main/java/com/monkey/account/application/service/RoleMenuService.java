package com.monkey.account.application.service;

import com.monkey.account.application.IRoleMenuService;
import com.monkey.account.entity.RoleMenu;
import com.monkey.account.repository.RoleMenuRepository;
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
public class RoleMenuService extends ServiceImpl<RoleMenuRepository, RoleMenu> implements IRoleMenuService {

}
