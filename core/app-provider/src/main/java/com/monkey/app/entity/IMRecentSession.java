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
 * 
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMRecentSession")
public class IMRecentSession implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    @TableField("userId")
    private Integer userId;

    /**
     * 对方id
     */
    @TableField("peerId")
    private Integer peerId;

    /**
     * 类型，1-用户,2-群组
     */
    private Boolean type;

    /**
     * 用户:0-正常, 1-用户A删除,群组:0-正常, 1-被删除
     */
    private Boolean status;

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
