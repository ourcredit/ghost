package com.monkey.app.repository;

import com.monkey.app.entity.IMAdmin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.monkey.app.entity.IMRole;
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
    List<String> getUserPermission(Integer userId);
    @Select("select c.permission from on_IMAdmin a inner join on_IMUserRole b on a.id=b.userId inner join on_IMRolePermission c on b.roleId=c.roleId")
    List<String> getAllPermission();
    @Select("SELECT\n" +
            "\tc.* \n" +
            "FROM\n" +
            "\ton_IMAdmin a\n" +
            "\tINNER JOIN on_IMUserRole b ON a.id = b.userId\n" +
            "\tINNER JOIN on_IMRole c ON b.roleId = c.id where a.id=#{userId}")
    List<IMRole> getUserRoles(Integer userId);

}
