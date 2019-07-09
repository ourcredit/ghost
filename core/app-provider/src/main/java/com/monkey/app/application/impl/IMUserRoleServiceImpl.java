package com.monkey.app.application.impl;

import com.monkey.app.entity.IMUserRole;
import com.monkey.app.repository.IMUserRoleMapper;
import com.monkey.app.application.IIMUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cloudtalk
 * @since 2019-07-09
 */
@Service
public class IMUserRoleServiceImpl extends ServiceImpl<IMUserRoleMapper, IMUserRole> implements IIMUserRoleService {

}
