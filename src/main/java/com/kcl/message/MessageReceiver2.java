package com.kcl.message;

import org.springframework.stereotype.Component;

/**
 * @author jack.z
 * @date 2018/12/26
 */
@Component
public class MessageReceiver2 {
    /**
     * 接收消息的方法
     */
    public void receiveMessage(String message) {
        try{
            Thread.sleep(1000);
            System.out.println("第二收到一条消息：" + message);
        }catch(InterruptedException ie){
            ie.printStackTrace();
        }


    }
}

