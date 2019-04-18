package com.kcl.message.service.impl;
import com.kcl.message.domain.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * @author jack.z
 * @date 2018/12/26
 */
@Service
public class MessageProducerService {

    @Autowired
    RedisTemplate<String,Message> redisTemplate2;

    public Long sendMessage(Message message) {
        System.out.println("发送了"+ message);
        return redisTemplate2.opsForList().leftPush("queue", message);
    }
    public void popMessage() {
          new Thread(){
              @Override
              public void run() {
                  while (true){
                      Object message =  redisTemplate2.opsForList().rightPop("queue", 1000L, TimeUnit.SECONDS);
                      System.out.println("接收到了" + message);
                  }
                  // do something...
                  //SomeThread.this.someService.doSomething();
                  // 此时someService已被注入，非null.
              }
          }.start();
//          Object message =   redisTemplate2.opsForList().rightPop("queue", 1000L, TimeUnit.SECONDS);
//          System.out.println("拿出"+ message);
    }

}
