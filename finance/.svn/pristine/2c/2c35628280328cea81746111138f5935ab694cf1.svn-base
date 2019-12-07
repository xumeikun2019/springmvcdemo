package com.cf.project.annotation;

import java.lang.annotation.*;

/**
 * 清除缓存
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface CacheClear {

    /**
     * 缓存的key
     * @return
     */
    String key() default "";
}
