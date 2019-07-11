package com.monkey.app.application.impl;

import com.monkey.app.entity.IMAdmin;
import com.monkey.app.entity.IMRole;
import com.monkey.app.repository.IMAdminMapper;
import com.monkey.app.application.IIMAdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cloudtalk
 * @since 2019-07-09
 */
@Service
public class IMAdminServiceImpl extends ServiceImpl<IMAdminMapper, IMAdmin> implements IIMAdminService {

    @Override
    public List<String> getAllPermission( ) {
        return baseMapper.getAllPermission();
    }

    @Override
    public List<String> getUserPermission(Integer userId) {
        return baseMapper.getUserPermission(userId);
    }

    @Override
    public List<IMRole> getUserRoles(Integer userId) {
        return baseMapper.getUserRoles(userId);
    }

    @Override
    public List<IMRole> getAllRoles() {
        return baseMapper.getAllRoles();
    }
}
