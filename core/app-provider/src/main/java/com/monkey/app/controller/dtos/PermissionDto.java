package com.monkey.app.controller.dtos;

public class PermissionDto {
    public  PermissionDto(){}
    public  PermissionDto(Integer id,String permission,String showName){
        this.id=id;
        this.permission=permission;
        this.shouName=showName;
    }
    private Integer id;
    private String permission;
    private String shouName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getShouName() {
        return shouName;
    }

    public void setShouName(String shouName) {
        this.shouName = shouName;
    }
}
