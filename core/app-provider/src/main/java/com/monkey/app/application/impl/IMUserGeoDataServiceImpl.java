package com.monkey.app.application.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.app.application.IIMUserGeoDataService;
import com.monkey.app.entity.IMUserGeoData;
import com.monkey.app.repository.IMUserGeoDataMapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-10
 */
@Service
@Qualifier(value = "imUserGeoDataService")
public class IMUserGeoDataServiceImpl extends ServiceImpl<IMUserGeoDataMapper, IMUserGeoData> implements IIMUserGeoDataService {

}
