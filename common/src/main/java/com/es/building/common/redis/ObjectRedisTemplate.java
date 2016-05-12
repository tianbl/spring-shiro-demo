package com.es.building.common.redis;

import org.springframework.data.redis.connection.DefaultStringRedisConnection;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;

/**
 * Created by chenluo on 2015/9/14.
 */
public class ObjectRedisTemplate<T> extends RedisTemplate<String, T> {

    public ObjectRedisTemplate(RedisConnectionFactory connectionFactory){
        RedisSerializer<Object> objectSerializer = new Jackson2JsonRedisSerializer<Object>(
                Object.class);

        RedisSerializer<String> objectKeySerializer = new Jackson2JsonRedisSerializer<String>(
                String.class);

        setKeySerializer(objectKeySerializer);
        setValueSerializer(objectSerializer);
        setHashKeySerializer(objectSerializer);
        setHashValueSerializer(objectSerializer);

        setConnectionFactory(connectionFactory);
        afterPropertiesSet();
    }
    public ObjectRedisTemplate(RedisConnectionFactory connectionFactory,
                               Class<T> clazz) {

        RedisSerializer<T> objectSerializer = new Jackson2JsonRedisSerializer<T>(
                clazz);

        RedisSerializer<String> objectKeySerializer = new Jackson2JsonRedisSerializer<String>(
                String.class);

        setKeySerializer(objectKeySerializer);
        setValueSerializer(objectSerializer);
        setHashKeySerializer(objectSerializer);
        setHashValueSerializer(objectSerializer);

        setConnectionFactory(connectionFactory);
        afterPropertiesSet();
    }

    protected RedisConnection preProcessConnection(RedisConnection connection,
                                                   boolean existingConnection) {
        return new DefaultStringRedisConnection(connection);
    }
}
