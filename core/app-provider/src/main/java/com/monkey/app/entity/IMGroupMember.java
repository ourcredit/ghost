package com.monkey.app.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 用户和群的关系表
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMGroupMember")
public class IMGroupMember implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 群Id
     */
    @TableField("groupId")
    private Integer groupId;

    /**
     * 用户id
     */
    @TableField("userId")
    private Integer userId;

    /**
     * 是否退出群，0-正常，1-已退出
     */
    private Integer status;

    private String remak;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Integer created;

    /**
     * 更新时间
     */
    private Integer updated;


}
