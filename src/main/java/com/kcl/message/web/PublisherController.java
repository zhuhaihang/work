package com.kcl.message.web;
import com.kcl.message.domain.Message;
import com.kcl.message.service.impl.MessageProducerService;
import com.kcl.message.service.impl.PublisherService;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("publisher")
public class PublisherController {

    @Autowired
    private PublisherService publisherService;
    @Autowired
    private MessageProducerService publisherLefService;
    @RequestMapping("{name}")
    public String sendMessage(@PathVariable("name") String name) {
        return publisherService.sendMessage(name);
    }
    @RequestMapping("left/{name}")
    public long sendLefMessage(@PathVariable("name") String name) {
        Message message=new Message();
        message.setId(String.valueOf(Math.random()));
        message.setContent(name);
        return publisherLefService.sendMessage(message);
    }
    @RequestMapping("pop")
    public void popMessage() {
        publisherLefService.popMessage();
    }
}

