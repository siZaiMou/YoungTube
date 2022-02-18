package com.youngtube.demo;

import com.youngtube.demo.config.RabbitMQConfig_producer;
import com.youngtube.demo.entity.VideoComment;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class RabbitMQTest
{
    @Autowired
    RabbitTemplate rabbitTemplate;

    @Test
    void sendMessageTest()
    {
        rabbitTemplate.convertAndSend(RabbitMQConfig_producer.EXCHANGE_NAME,"videoPraise","video praise");
        for(int i=0;i<1000;i++)
        {
            VideoComment videoComment = new VideoComment();
            videoComment.setCommentContent("你好你好绝绝子"+i);
            rabbitTemplate.convertAndSend(RabbitMQConfig_producer.EXCHANGE_NAME,"videoComment",videoComment);

        }
     }
}
