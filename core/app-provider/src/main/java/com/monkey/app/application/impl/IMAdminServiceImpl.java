package com.monkey.app.application.impl;

import com.monkey.app.entity.IMAdmin;
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
    public List<String> getAllPermission(Integer userId) {
        return baseMapper.getAllPermission(userId);
    }
}
