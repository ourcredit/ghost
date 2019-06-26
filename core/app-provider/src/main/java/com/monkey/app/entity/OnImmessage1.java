package com.monkey.app.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhaohejing
 * @since 2019-06-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMMessage_1")
public class OnImmessage1 implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户的关系id
     */
    @TableField("relateId")
    private Integer relateId;

    /**
     * 发送用户的id
     */
    @TableField("fromId")
    private Integer fromId;

    /**
     * 接收用户的id
     */
    @TableField("toId")
    private Integer toId;

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
     * 消息类型
     */
    private Integer type;

    /**
     * 0正常 1被删除
     */
    private Boolean status;

    /**
     * 更新时间
     */
    private Integer updated;

    /**
     * 创建时间
     */
    private Integer created;

    private Integer flag;


}
