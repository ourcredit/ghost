package com.monkey.app.controller.dtos;

public class PermissionDto {
    public  PermissionDto(String permission,String showName){
        this.permission=permission;
        this.shouName=showName;
    }
    public  PermissionDto(String id,String permission,String showName){
        this.id=id;
        this.permission=permission;
        this.shouName=showName;
    }
    private String id;
    private String permission;
    private String shouName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
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
