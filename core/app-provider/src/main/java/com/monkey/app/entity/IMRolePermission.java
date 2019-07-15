package com.monkey.app.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author cloudtalk
 * @since 2019-07-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMRolePermission")
public class IMRolePermission implements Serializable {

    public IMRolePermission(){}
    public IMRolePermission(Integer roleId,String permission,String showName){
        this.roleId=roleId;
        this.permission=permission;
        this.shouName=showName;
    }
    private static final long serialVersionUID = 1L;

    /**
     * key
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;

    /**
     * 角色id
     */
    @TableField("roleId")
    private Integer roleId;

    /**
     * 权限名
     */
    private String permission;

    /**
     * 显示名
     */
    @TableField("shouName")
    private String shouName;

    /**
     * 创建时间´
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime created;

    /**
     * 更新时间´
     */
    private LocalDateTime updated;


}
