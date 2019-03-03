package com.monkey.account.entity;

import java.time.LocalDateTime;
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
 * @since 2019-03-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class BaseMenu implements Serializable {

    private static final long serialVersionUID = 1L;

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

    @TableField("creationTime")
    private LocalDateTime creationTime;

    @TableField("creatorUserId")
    private Integer creatorUserId;

    @TableField("isDeleted")
    private Integer isDeleted;


}
