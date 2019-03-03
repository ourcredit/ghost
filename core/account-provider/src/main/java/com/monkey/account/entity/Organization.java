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
public class BaseOrganization implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 节点名
     */
    private String name;

    /**
     * 父级id
     */
    @TableField("parentId")
    private Integer parentId;

    /**
     * 创建时间
     */
    @TableField("creationTime")
    private LocalDateTime creationTime;

    /**
     * 创建人id
     */
    @TableField("creatorUserId")
    private Integer creatorUserId;

    /**
     * 级别code
     */
    @TableField("levelCode")
    private String levelCode;


}
