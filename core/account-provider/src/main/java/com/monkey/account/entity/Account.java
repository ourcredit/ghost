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
 * @since 2018-10-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("base_account")
public class Account  implements Serializable  {
    private static final long serialVersionUID = 1L;
    /**
     * key
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String userName;
    @TableField(value = "creatorUserId",fill = FieldFill.INSERT)
    private Integer creatorUserId;
    @TableField(value = "creationTime",fill = FieldFill.INSERT)
    private LocalDateTime creationTime;

    private String mobile;

    private Integer isActive;
    /**
     * 密码
     */
    private String password;
    /**
     * 账户
     */
    private String account;

    private Integer tenantId;

    private LocalDateTime lastLoginTime;

    private Integer isDeleted;
}
