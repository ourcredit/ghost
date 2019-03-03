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
@TableName("base_userRole")
public class UserRole implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * key
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 角色名
     */
    @TableField("userId")
    private Integer userId;
    /**
     * 显示名
     */
    @TableField("roleId")
    private String roleId;
    @TableField(value = "creatorUserId",fill = FieldFill.INSERT)
    private Integer creatorUserId;
    @TableField(value = "creationTime",fill = FieldFill.INSERT)
    private LocalDateTime creationTime;
}
