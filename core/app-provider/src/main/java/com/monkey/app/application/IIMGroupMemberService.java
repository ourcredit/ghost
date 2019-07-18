package com.monkey.app.application;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.monkey.app.entity.IMGroupMember;
import com.monkey.app.entity.IMUser;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户和群的关系表 服务类
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-15
 */
public interface IIMGroupMemberService extends IService<IMGroupMember> {
    List<Map<String, Object>> getGroupMemberList(String ids);

    List<Map<String, Object>> getGroupMemberInfoById(Integer id);

}
