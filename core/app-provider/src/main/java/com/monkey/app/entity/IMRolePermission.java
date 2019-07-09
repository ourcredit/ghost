package com.monkey.app.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
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
    public IMRolePermission(Integer roleId,String permission){
        this.roleId=roleId;
        this.permission=permission;
    }
    private static final long serialVersionUID = 1L;

    /**
     * key
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

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
    private LocalDateTime created;

    /**
     * 更新时间´
     */
    private LocalDateTime updated;


}
