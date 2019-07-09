package com.monkey.app.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
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
 * @since 2019-01-04
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMUserFriends")
public class IMUserFriends implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private Integer uid;

    private Integer friuid;

    @TableField("friName")
    private String friName;

    @TableField("friAvatar")
    private String friAvatar;

    private String remark;

    @TableField("groupId")
    private Integer groupId;

    private String message;

    private Integer status;

    private Integer role;

    private Integer lv;

    private LocalDateTime updated;

    private LocalDateTime created;


}
