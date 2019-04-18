package com.kcl.message;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Component;

@Component
public class Receiver implements MessageListener {
    private static Logger logger = LoggerFactory.getLogger(Receiver.class);

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public void onMessage(Message message, byte[] pattern) {
        RedisSerializer<String> valueSerializer = redisTemplate.getStringSerializer();
        String deserialize = valueSerializer.deserialize(message.getBody());
        String deserialize2 = valueSerializer.deserialize(pattern);
        String deserialize3 = valueSerializer.deserialize(message.getChannel());
        logger.info("收到的mq消息" + deserialize);
        logger.info("收到的mq2消息" + deserialize2);
        logger.info("收到的mq3消息" + deserialize3);
    }
}
