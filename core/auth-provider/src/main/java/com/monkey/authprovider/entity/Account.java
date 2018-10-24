package com.monkey.authprovider.entity;


import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDateTime;
import java.io.Serializable;

import com.netflix.discovery.provider.ISerializer;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
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
public class Account  implements Serializable  {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String userName;

    private Integer creatorUserId;

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
