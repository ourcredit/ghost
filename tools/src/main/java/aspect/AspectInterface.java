package aspect;

import org.aspectj.lang.ProceedingJoinPoint;

import java.lang.reflect.Method;

public interface AspectInterface {
    Object doHandlerAspect(Object[] obj, ProceedingJoinPoint pjp, Method method, boolean isAll)throws Throwable;
}
