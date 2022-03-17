package com.youngtube.demo.config;

import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitMQConfig_producer
{
    public static final String EXCHANGE_NAME = "boot_topic_exchange";
    public static final String QUEUE_NAME = "boot_queue";

    @Bean("bootExchange")
    public Exchange bootExchange()
    {
        return ExchangeBuilder.topicExchange(EXCHANGE_NAME).durable(true).build();
    }

    @Bean("videoPraise")
    public Queue bootQueue1()
    {
        return QueueBuilder.durable("videoPraise").build();
    }

    @Bean("videoComment")
    public Queue bootQueue2()
    {
        return QueueBuilder.durable("videoComment").build();
    }

    @Bean("danmu")
    public Queue bootQueue3(){return QueueBuilder.durable("danmu").build();}

    @Bean
    public Binding bindQueueExchange1(@Qualifier("videoPraise")Queue queue, @Qualifier("bootExchange")Exchange exchange)
    {
        return BindingBuilder.bind(queue).to(exchange).with("videoPraise").noargs();
    }

    @Bean
    public Binding bindQueueExchange2(@Qualifier("videoComment")Queue queue, @Qualifier("bootExchange")Exchange exchange)
    {
        return BindingBuilder.bind(queue).to(exchange).with("videoComment").noargs();
    }

    @Bean
    public Binding bindQueueExchange3(@Qualifier("danmu")Queue queue, @Qualifier("bootExchange")Exchange exchange)
    {
        return BindingBuilder.bind(queue).to(exchange).with("danmu").noargs();
    }

    @Bean
    public RabbitTemplate rabbitTemplate(final ConnectionFactory connectionFactory) {
        final RabbitTemplate rabbitTemplate = new RabbitTemplate(connectionFactory);
        rabbitTemplate.setMessageConverter(producerJackson2MessageConverter());
        return rabbitTemplate;
    }

    @Bean
    public Jackson2JsonMessageConverter producerJackson2MessageConverter() //生产者bean->json序列化转换器
    {
        return new Jackson2JsonMessageConverter();
    }

}
