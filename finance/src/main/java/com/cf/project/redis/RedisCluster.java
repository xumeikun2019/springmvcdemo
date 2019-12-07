package com.cf.project.redis;


import org.springframework.beans.factory.annotation.Autowired;

import redis.clients.jedis.JedisCluster;

/**
 * Redis集群工具类
 */

public class RedisCluster implements RedisUtil {

    @Autowired
    private JedisCluster jedisCluster;

    public void set(String key, String value) {
        this.jedisCluster.set(key, value);
    }

    public void set(String key, String value, Integer seconds) {
        this.jedisCluster.set(key, value);
        this.jedisCluster.expire(key, seconds);
    }

    public String get(String key) {
        return this.jedisCluster.get(key);
    }

    public void del(String key) {
        this.jedisCluster.del(key);
    }

    public void deleteKeyByPrefix(String prefix) {

    }

    public void deleteKeyByContain(String contain) {

    }

    public void expire(String key, Integer seconds) {
        this.jedisCluster.expire(key, seconds);
    }

    public Long incr(String key) {
        return this.jedisCluster.incr(key);
    }

    /**
     * 获取JedisCluster对象
     * 可以直接使用它来进行redis操作
     *
     * @return JedisCluster对象
     */
    public JedisCluster getJedisCluster() {
        return jedisCluster;
    }

    public void setData4Object2Redis(String key, Object object) {
    }

    public Object getData4Object2Redis(String key) {
        return null;
    }
}