package com.monkey.app.application.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.app.application.IIMDepartService;
import com.monkey.app.entity.IMDepart;
import com.monkey.app.repository.IMDepartMapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-15
 */
@Service
@Qualifier(value = "IMDepartService")
public class IMDepartServiceImpl extends ServiceImpl<IMDepartMapper, IMDepart> implements IIMDepartService {

    @Override
    public List<Map<String, Object>> getMyAllDepart(Integer id) {
        return baseMapper.getMyAllDepart(id);
    }
}
