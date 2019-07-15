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
 * IM群信息
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMGroup")
public class IMGroup implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 群名称
     */
    private String name;

    /**
     * 群头像
     */
    private String avatar;

    /**
     * 创建者用户id
     */
    private Integer creator;

    /**
     * 群组类型，1-固定;2-临时群
     */
    private Integer type;

    /**
     * 成员人数
     */
    @TableField("userCnt")
    private Integer userCnt;

    /**
     * 是否删除,0-正常，1-删除
     */
    private Integer status;

    /**
     * 群版本号
     */
    private Integer version;

    /**
     * 最后聊天时间
     */
    @TableField("lastChated")
    private Integer lastChated;

    /**
     * 更新时间
     */
    private LocalDateTime updated;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime created;


}
