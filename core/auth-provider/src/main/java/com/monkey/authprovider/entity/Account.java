package com.monkey.authprovider.entity;


import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@TableName("ghost_account")
public class Account extends Model<Account> {

    private static final long serialVersionUID = 1L;
    public  Account(){}
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String account;
    private String password;
    @TableField(fill = FieldFill.INSERT)
    private Date creation_time;
    @TableField(fill = FieldFill.INSERT)
    private Integer creator_user_id;
    private String user_name;
    private String mobile;
    private Integer is_active;
    private Integer is_deleted;
    private Date last_login_time;

    private Integer tenant_id;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }


    @Override
    protected Serializable pkVal() {
        return this.getId();
    }


    /**
     * 自增主键
     */
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 账户
     */
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    /**
     * 密码
     */
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 创建时间
     */
    public Date getCreation_time() {
        return creation_time;
    }

    public void setCreation_time(Date creation_time) {
        this.creation_time = creation_time;
    }

    /**
     * 创建人id
     */
    public Integer getCreator_user_id() {
        return creator_user_id;
    }

    public void setCreator_user_id(Integer creator_user_id) {
        this.creator_user_id = creator_user_id;
    }

    /**
     * 姓名
     */
    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    /**
     * 手机
     */
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 1启用  0禁用
     */
    public Integer getIs_active() {
        return is_active;
    }

    public void setIs_active(Integer is_active) {
        this.is_active = is_active;
    }

    /**
     * 软删除
     */
    public Integer getIs_deleted() {
        return is_deleted;
    }

    public void setIs_deleted(Integer is_deleted) {
        this.is_deleted = is_deleted;
    }

    /**
     * 最后登陆时间
     */
    public Date getLast_login_time() {
        return last_login_time;
    }

    public void setLast_login_time(Date last_login_time) {
        this.last_login_time = last_login_time;
    }

    /**
     * 租户id
     */
    public Integer getTenant_id() {
        return tenant_id;
    }

    public void setTenant_id(Integer tenant_id) {
        this.tenant_id = tenant_id;
    }
}
