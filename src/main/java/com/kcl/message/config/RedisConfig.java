package com.kcl.message.config;

import com.kcl.message.MessageReceiver;
import com.kcl.message.MessageReceiver2;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * @author jack.z
 * @date 2018/12/26
 */
@Configuration //相当于xml中的beans
public class RedisConfig {
    /**
     * redis消息监听器容器
     * 可以添加多个监听不同话题的redis监听器，只需要把消息监听器和相应的消息订阅处理器绑定，该消息监听器
     * 通过反射技术调用消息订阅处理器的相关方法进行一些业务处理
     * @param connectionFactory
     * @param listenerAdapter
     * @return
     */
    @Bean
    //相当于xml中的bean
    //创建容器，绑定 -》消息处理适配器。消息处理适配器绑定处理类和回调方法名
    RedisMessageListenerContainer container(RedisConnectionFactory connectionFactory,
                                            MessageListenerAdapter listenerAdapter,
                                            MessageListenerAdapter listenerAdapter2)
    {
        RedisMessageListenerContainer container = new RedisMessageListenerContainer();
        container.setConnectionFactory(connectionFactory);
        //订阅了一个叫chat 的通道
        container.addMessageListener(listenerAdapter, new PatternTopic("chat"));
        container.addMessageListener(listenerAdapter2, new PatternTopic("chat"));
        //这个container 可以添加多个 messageListener
        return container;
    }
    /**
     * 消息监听器适配器，绑定消息处理器，利用反射技术调用消息处理器的业务方法
     * @param receiver
     * @return
     */
    @Bean
    MessageListenerAdapter listenerAdapter(MessageReceiver receiver)
    { //这个地方 是给messageListenerAdapter 传入一个消息接受的处理器，
      // 利用反射的方法调用“receiveMessage” //也有好几个重载方法，这边默认调用处理器的方法
        // 叫handleMessage 可以自己到源码里面看
      return new MessageListenerAdapter(receiver, "receiveMessage");//第二个参数是监听的方法
    }
    @Bean
    MessageListenerAdapter listenerAdapter2(MessageReceiver2 receiver2)
    { //这个地方 是给messageListenerAdapter 传入一个消息接受的处理器，
        // 利用反射的方法调用“receiveMessage” //也有好几个重载方法，这边默认调用处理器的方法
        // 叫handleMessage 可以自己到源码里面看
        return new MessageListenerAdapter(receiver2, "receiveMessage");//第二个参数是监听的方法
    }
    /**redis 读取内容的template */
    @Bean
    StringRedisTemplate template(RedisConnectionFactory connectionFactory) {
        return new StringRedisTemplate(connectionFactory);
    }

    @Bean(name = "redisTemplate2")
    RedisTemplate<?, ?> template2(RedisConnectionFactory connectionFactory) {
        RedisTemplate<?, ?> template = new RedisTemplate<>();
        template.setKeySerializer(new StringRedisSerializer());
        template.setValueSerializer(new JdkSerializationRedisSerializer());
        template.setConnectionFactory(connectionFactory);
        return template;
    }

}
