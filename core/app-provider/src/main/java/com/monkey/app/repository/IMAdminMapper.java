package com.monkey.app.repository;

import com.monkey.app.entity.IMAdmin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author cloudtalk
 * @since 2019-07-09
 */
public interface IMAdminMapper extends BaseMapper<IMAdmin> {
    @Select("select c.permission from on_IMAdmin a inner join on_IMUserRole b on a.id=b.userId inner join on_IMRolePermission c on b.roleId=c.roleId where a.id=#{userId}")
    List<String> getAllPermission(Integer userId);

}
