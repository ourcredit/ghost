package com.monkey.app.application.impl;

import com.monkey.app.entity.IMRole;
import com.monkey.app.repository.IMRoleMapper;
import com.monkey.app.application.IIMRoleService;
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
public class IMRoleServiceImpl extends ServiceImpl<IMRoleMapper, IMRole> implements IIMRoleService {

}
