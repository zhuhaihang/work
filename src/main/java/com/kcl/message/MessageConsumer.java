package com.kcl.message;

import com.kcl.message.domain.Message;
import com.kcl.message.util.SpringContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * @author jack.z
 * @date 2018/12/26
 */
@Service
public class MessageConsumer extends Thread {
    @Autowired
    RedisTemplate redisTemplate2;
    @Override
    public void run() {
        while (true){
            Object message =   redisTemplate2.opsForList().rightPop("queue", 1000L, TimeUnit.SECONDS);
            System.out.println("接收到了" + message);
        }
    }
}
