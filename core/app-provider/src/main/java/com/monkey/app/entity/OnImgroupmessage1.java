package com.monkey.app.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * IM群消息表
 * </p>
 *
 * @author zhaohejing
 * @since 2019-06-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMGroupMessage_1")
public class OnImgroupmessage1 implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户的关系id
     */
    @TableField("groupId")
    private Integer groupId;

    /**
     * 发送用户的id
     */
    @TableField("userId")
    private Integer userId;

    /**
     * 消息ID
     */
    @TableField("msgId")
    private Integer msgId;

    /**
     * 消息内容
     */
    private String content;

    /**
     * 群消息类型,101为群语音,2为文本
     */
    private Integer type;

    /**
     * 消息状态
     */
    private Integer status;

    /**
     * 更新时间
     */
    private Integer updated;

    /**
     * 创建时间
     */
    private Integer created;


}
