package com.monkey.account.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhaohejing
 * @since 2018-10-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("base_role")
public class Role implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * key
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 角色名
     */
    @TableField("roleName")
    private String roleName;
    /**
     * 显示名
     */
    @TableField("displayName")
    private String displayName;
    /**
     * 显示名
     */
    @TableField("description")
    private String description;
    @TableField(value = "creatorUserId",fill = FieldFill.INSERT)
    private Integer creatorUserId;
    @TableField(value = "creationTime",fill = FieldFill.INSERT)
    private LocalDateTime creationTime;

    /**
     * 启用禁用
     */
    @TableField("isActive")
    private Integer isActive;
    /**
     * 是否删除
     */
    @TableField("isDeleted")
    private Integer isDeleted;
}
