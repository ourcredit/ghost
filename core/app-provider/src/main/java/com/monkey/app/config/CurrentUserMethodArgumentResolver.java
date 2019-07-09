package com.monkey.app.config;


import annotation.CurrentUser;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.monkey.app.application.IIMAdminService;
import com.monkey.app.application.IIMUserService;
import com.monkey.app.entity.IMAdmin;
import com.monkey.app.entity.IMUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import tools.JWTUtil;

/**
 *  增加方法注入，将含有 @CurrentUser 注解的方法参数注入当前登录用户
 * @author liugh
 * @since 2018-05-03
 */
public class CurrentUserMethodArgumentResolver implements HandlerMethodArgumentResolver {
    @Autowired
    IIMAdminService _adminService;
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterType().isAssignableFrom(IMUser.class)
                && parameter.hasParameterAnnotation(CurrentUser.class);
    }
    @Override
    public Object resolveArgument(MethodParameter parameter,
                                  ModelAndViewContainer mavContainer,
                                  NativeWebRequest webRequest,
                                  WebDataBinderFactory binderFactory) throws Exception {
       String token= webRequest.getHeader("Authorization");
        Integer userId= JWTUtil.getUserId(token);
        IMAdmin user = _adminService.getOne(new QueryWrapper<IMAdmin>().eq("id", userId));
        if (user == null) {
            throw new Exception("获取用户信息失败");
        }
        return user;
    }
}