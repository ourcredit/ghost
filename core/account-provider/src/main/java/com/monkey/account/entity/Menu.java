package com.monkey.account.entity;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.*;

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
@TableName("base_menu")
public class Menu implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * key
     */
    @TableId(value = "id", type = IdType.AUTO)
    /**
     * 显示名
     */
    private String name;
    /**
     * url
     */
    private String url;

    /**
     * 1 菜单 2按钮
     */
    private Integer type;

    /**
     * 权限码
     */
    private String code;
    /**
     * 父级id
     */
    @TableField("parentId")
    private Integer parentId;

    @TableField(value = "creatorUserId",fill = FieldFill.INSERT)
    private Integer creatorUserId;
    @TableField(value = "creationTime",fill = FieldFill.INSERT)
    private LocalDateTime creationTime;

    @TableField("isDeleted")
    private Integer isDeleted;


}
