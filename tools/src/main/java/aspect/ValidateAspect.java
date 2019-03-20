package aspect;

import com.alibaba.fastjson.JSONObject;
import exception.ParamJsonException;
import org.aspectj.lang.ProceedingJoinPoint;
import tools.ComUtil;
import tools.StringUtil;

import java.lang.reflect.Method;

public class ValidateAspect implements  AspectInterface {
    @Override
    public Object doHandlerAspect(Object [] obj ,ProceedingJoinPoint pjp, Method method,boolean isAll) throws Throwable{
        //获取注解的value值返回
        String validationParamValue = StringUtil.getMethodAnnotationOne(method,ValidateAspect.class.getSimpleName());
        if(!ComUtil.isEmpty(validationParamValue)){
            for (Object anObj : obj) {
                if (anObj instanceof JSONObject) {
                    JSONObject jsonObject = JSONObject.parseObject(anObj.toString());
                    //是否有所有必须参数
                    hasAllRequired(jsonObject, validationParamValue);
                }
            }
        }
        return obj;
    }
    /**
     * 验证前端传入参数,没有抛出异常
     * @param jsonObject
     * @param requiredColumns
     */
    public void hasAllRequired(final JSONObject jsonObject, String requiredColumns) {
        if (!ComUtil.isEmpty(requiredColumns)) {
            //验证字段非空
            String[] columns = requiredColumns.split(",");
            StringBuilder missCol = new StringBuilder();
            for (String column : columns) {
                Object val = jsonObject.get(column.trim());
                if (ComUtil.isEmpty(val)) {
                    missCol.append(column).append("  ");
                }
            }
            if (!ComUtil.isEmpty(missCol.toString())) {
                jsonObject.clear();
                throw new ParamJsonException("缺少必填参数:"+ missCol.toString().trim());
            }
        }
    }
}
