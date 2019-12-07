package com.cf.project.annotation;

import java.lang.annotation.*;

/**
 * 缓存注解
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Cache {

    /**
     * 缓存的key
     * @return
     */
    String key() default "";
}
