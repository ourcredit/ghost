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
@TableName("on_IMAdmin")
public class IMAdmin implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户名
     */
    private String uname;

    /**
     * 密码
     */
    private String pwd;

    /**
     * 用户状态 0 :正常 1:删除 可扩展
     */
    private Integer status;

    /**
     * 创建时间´
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime created;
    @TableField("createrUser")
    private String createrUser;
    /**
     * 更新时间´
     */
    private LocalDateTime updated;
}
