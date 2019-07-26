package com.monkey.app.application;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.monkey.app.entity.IMUserFriends;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-04
 */

public interface IIMUserFriendsService extends IService<IMUserFriends> {

    List<Map<String, Object>> getMyNewFriends(Integer id);
    List<Map<String, Object>> getMyFriends(Integer id);
    String getNearRecord(Integer fromid,Integer toid);
    IPage<Map<String,Object>> getRecordsByUserId(IPage page, Integer fromid, Integer toid);
}
