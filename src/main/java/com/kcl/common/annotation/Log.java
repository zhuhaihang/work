package com.kcl.common.annotation;

import com.kcl.common.enums.BusinessType;
import com.kcl.common.enums.OperatorType;

import java.lang.annotation.*;

/**
 * 自定义操作日志记录注解
 *
 * @author kcl
 */
@Target({ ElementType.PARAMETER, ElementType.METHOD })//方法和方法参数
@Retention(RetentionPolicy.RUNTIME)// 注解会在class字节码文件中存在，在运行时可以通过反射获取到
@Documented///说明该注解将被包含在javadoc中
public @interface Log
{
    //如果注解有多个属性，
    // 而且前提是这多个属性都有默认值，那么你不写注解名赋值，
    // 会赋值给名字为“value”这属性。
    /**
     * 模块
     */
    String title() default "";

    /**
     * 功能
     */
    BusinessType businessType() default BusinessType.OTHER;

    /**
     * 操作人类别
     */
    OperatorType operatorType() default OperatorType.MANAGE;

    /**
     * 是否保存请求的参数
     */
    boolean isSaveRequestData() default true;
}
