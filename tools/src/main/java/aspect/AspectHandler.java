package aspect;

import org.aspectj.lang.ProceedingJoinPoint;

import java.lang.reflect.Method;

public abstract class AspectHandler {
    /**
     *  工厂方法模式完成注解功能
     * @param pjp 切面类
     * @param args 方法参数
     * @param method 方法
     * @param isAll 是否log和validation全验证
     * @return
     * @throws Throwable
     */
    public Object doAspectHandler(ProceedingJoinPoint pjp, Object[] args, Method method, boolean isAll)throws Throwable{
        AspectInterface aspectApi = factoryMethod();
        return aspectApi.doHandlerAspect(args,pjp,method,isAll);
    }
    protected  abstract AspectInterface factoryMethod();
}
