package com.monkey.app.controller;

import com.monkey.tenant.ApplicationContext;
import com.monkey.tenant.CurrentTenant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BaseController {
    public CurrentTenant current;
    public  BaseController(){
        this.current=  ApplicationContext.getInstance().getCurrent();
    }
}
