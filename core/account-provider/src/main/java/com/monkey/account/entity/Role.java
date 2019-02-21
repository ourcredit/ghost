package com.monkey.account.entity;

import com.baomidou.mybatisplus.annotation.TableField;
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
public class Role implements Serializable {
    private static final long serialVersionUID = 1L;
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
     * 创建人
     */
    @TableField("creatorUserId")
    private Integer creatorUserId;
    /**
     * 创建时间
     */
    @TableField("creationTime")
    private LocalDateTime creationTime;

    /**
     * 启用禁用
     */
    @TableField("isActive")
    private Integer isActive;
    /**
     * 租户id
     */
    @TableField("tenantId")
    private Integer tenantId;

    /**
     * 是否删除
     */
    @TableField("isDeleted")
    private Integer isDeleted;
}
