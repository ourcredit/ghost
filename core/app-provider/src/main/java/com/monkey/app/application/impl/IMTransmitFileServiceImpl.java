package com.monkey.app.application.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.app.application.IIMTransmitFileService;
import com.monkey.app.entity.IMTransmitFile;
import com.monkey.app.repository.IMTransmitFileMapper;
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
@Qualifier(value = "IMTransmitFileService")
public class IMTransmitFileServiceImpl extends ServiceImpl<IMTransmitFileMapper, IMTransmitFile> implements IIMTransmitFileService {

}
