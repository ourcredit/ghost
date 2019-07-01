package com.monkey.app.application.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.app.application.IIMAudioService;
import com.monkey.app.entity.IMAudio;
import com.monkey.app.repository.IMAudioMapper;
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
@Qualifier(value = "IMAudioService")
public class IMAudioServiceImpl extends ServiceImpl<IMAudioMapper, IMAudio> implements IIMAudioService {

}
