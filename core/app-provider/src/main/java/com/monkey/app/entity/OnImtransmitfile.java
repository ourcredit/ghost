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
@TableName("on_IMTransmitFile")
public class OnImtransmitfile implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableField("fromId")
    private Integer fromId;

    @TableField("toId")
    private Integer toId;

    @TableField("fileName")
    private String fileName;

    private Integer size;

    @TableField("taskId")
    private Integer taskId;

    private Integer status;

    private Integer created;

    private Integer updated;


}
