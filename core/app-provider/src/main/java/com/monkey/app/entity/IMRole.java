package com.monkey.app.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDateTime;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * <p>
 * </p>
 *
 * @author cloudtalk
 * @since 2019-07-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMRole")
public class IMRole implements Serializable {

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
     * 创建时间´
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime created;
    @TableField(exist = false)
    private String permissions;
    /**
     * 更新时间´
     */
    private LocalDateTime updated;


}
