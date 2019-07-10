package com.monkey.app.application;

import com.monkey.app.entity.IMAdmin;
import com.baomidou.mybatisplus.extension.service.IService;
import com.monkey.app.entity.IMRole;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cloudtalk
 * @since 2019-07-09
 */
public interface IIMAdminService extends IService<IMAdmin> {
    List<String> getAllPermission();
    List<String> getUserPermission(Integer userId);

    List<IMRole> getUserRoles(Integer userId);

}
