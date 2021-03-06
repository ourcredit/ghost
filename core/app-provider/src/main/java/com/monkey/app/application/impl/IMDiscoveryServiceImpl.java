package com.monkey.app.application.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.app.application.IIMDiscoveryService;
import com.monkey.app.entity.IMDiscovery;
import com.monkey.app.repository.IMDiscoveryMapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-15
 */
@Service
@Qualifier(value = "IMDiscoveryService")
public class IMDiscoveryServiceImpl extends ServiceImpl<IMDiscoveryMapper, IMDiscovery> implements IIMDiscoveryService {

}
