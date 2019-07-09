package com.monkey.app.application;

import com.monkey.app.entity.IMAdmin;
import com.baomidou.mybatisplus.extension.service.IService;

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
    List<String> getAllPermission(Integer userId);
}
