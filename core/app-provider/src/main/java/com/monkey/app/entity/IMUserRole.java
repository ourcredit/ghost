package com.monkey.app.entity;

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
 * @author cloudtalk
 * @since 2019-07-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMUserRole")
public class IMUserRole implements Serializable {

    private static final long serialVersionUID = 1L;
    public IMUserRole(){}
    public IMUserRole(Integer userId,Integer roleId){
        this.userId=userId;
        this.roleId=roleId;
    }
    /**
     * key
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
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
    @TableField(fill = FieldFill.INSERT)
    private Integer created;

    /**
     * 更新时间´
     */
    private Integer updated;


}
