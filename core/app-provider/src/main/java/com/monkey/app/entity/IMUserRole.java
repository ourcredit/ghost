package com.monkey.app.entity;

import com.baomidou.mybatisplus.annotation.TableName;
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
 * @author cloudtalk
 * @since 2019-07-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMUserRole")
public class IMUserRole implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * key
     */
    private Integer id;

    /**
     * 用户id
     */
    @TableField("userId")
    private Integer userId;

    /**
     * 角色id
     */
    @TableField("roleId")
    private Integer roleId;

    /**
     * 创建时间´
     */
    private LocalDateTime created;

    /**
     * 更新时间´
     */
    private LocalDateTime updated;


}
