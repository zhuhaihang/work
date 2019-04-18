package com.kcl.message;

import org.springframework.stereotype.Component;

/**
 * @author jack.z
 * @date 2018/12/26
 */
@Component
public class MessageReceiver {
    /**
     * 接收消息的方法
     */
    public void receiveMessage(String message) {
        System.out.println("收到一条消息：" + message);
    }
}

