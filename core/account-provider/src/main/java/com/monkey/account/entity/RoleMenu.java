package com.monkey.account.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDateTime;
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
 * @since 2019-03-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("base_roleMenu")
public class RoleMenu implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * key
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    @TableField("roleId")
    private Integer roleId;

    @TableField("menuId")
    private Integer menuId;

    @TableField(value = "creatorUserId",fill = FieldFill.INSERT)
    private Integer creatorUserId;
    @TableField(value = "creationTime",fill = FieldFill.INSERT)
    private LocalDateTime creationTime;
}
