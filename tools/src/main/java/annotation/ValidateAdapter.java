package annotation;

import java.lang.annotation.*;


/**
 *@author zhaohejing
 */
@Target(ElementType.PARAMETER)          // 可用在方法的参数上
@Retention(RetentionPolicy.RUNTIME)     // 运行时有效
@Documented
public @interface ValidateAdapter {
}
