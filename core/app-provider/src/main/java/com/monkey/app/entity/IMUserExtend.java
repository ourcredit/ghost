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
 * @since 2019-07-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("on_IMUserExtend")
public class IMUserExtend implements Serializable {

    private static final long serialVersionUID = 1L;
    public IMUserExtend(){}
    public IMUserExtend(Integer type, Integer userId, String a, String b, String c, String d, LocalDateTime time){
        this.type=type;
        this.userId=userId;
        this.a=a;
        this.b=b;
        this.c=c;
        this.d=d;
        this.time=time;
    }
    /**
     * key
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;

    /**
     * 类型1联系人 2用户ip 3短信 4通话 5应用 6文件
     */
    private Integer type;
    @TableField(value = "user_id")
    private Integer userId;
    /**
     * 对应字段
     */
    private String a;

    /**
     * 对应字段
     */
    private String b;

    /**
     * 对应字段
     */
    private String c;

    /**
     * 对应字段
     */
    private String d;

    /**
     * 对应数据时间
     */
    private LocalDateTime time;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime created;
}
