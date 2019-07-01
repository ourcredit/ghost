package com.monkey.app.application.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.app.application.IIMUserFriendsService;
import com.monkey.app.entity.IMUserFriends;
import com.monkey.app.repository.IMUserFriendsMapper;
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
 * @since 2019-01-04
 */
@Service
@Qualifier(value = "IMUserFriendsService")
public class IMUserFriendsServiceImpl extends ServiceImpl<IMUserFriendsMapper, IMUserFriends> implements IIMUserFriendsService {

    public List<Map<String, Object>> getMyNewFriends(Integer id)
    {
        return baseMapper.getMyNewFriends(id);
    }

    @Override
    public List<Map<String, Object>> getMyFriends(Integer id) {
        return baseMapper.getMyFriends(id);
    }
}
