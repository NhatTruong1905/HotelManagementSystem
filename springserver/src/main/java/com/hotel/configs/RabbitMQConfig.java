package com.hotel.configs;

import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.amqp.rabbit.config.SimpleRabbitListenerContainerFactory;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitAdmin;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
@EnableRabbit
public class RabbitMQConfig {

    @Value("${cloudAmqpUrl}")
    private String cloudAmqpUrl;

    public static final String EXCHANGE_NAME = "booking.exchange";
    public static final String DELAY_QUEUE = "booking.delay.queue";
    public static final String CANCEL_QUEUE = "booking.cancel.queue";
    public static final String DELAY_ROUTING_KEY = "booking.delay.routingKey";
    public static final String CANCEL_ROUTING_KEY = "booking.cancel.routingKey";

    @Bean
    public ConnectionFactory connectionFactory() {
        CachingConnectionFactory factory = new CachingConnectionFactory();
        try {
            factory.setUri(cloudAmqpUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return factory;
    }

    @Bean
    public RabbitAdmin rabbitAdmin() {
        return new RabbitAdmin(connectionFactory());
    }

    @Bean
    public RabbitTemplate rabbitTemplate() {
        return new RabbitTemplate(connectionFactory());
    }

    @Bean
    public SimpleRabbitListenerContainerFactory rabbitListenerContainerFactory() {
        SimpleRabbitListenerContainerFactory factory = new SimpleRabbitListenerContainerFactory();
        factory.setConnectionFactory(connectionFactory());
        return factory;
    }

    @Bean
    public DirectExchange bookingExchange() {
        return new DirectExchange(EXCHANGE_NAME);
    }

    @Bean
    public Queue cancelQueue() {
        return new Queue(CANCEL_QUEUE);
    }

    @Bean
    public Queue delayQueue() {
        Map<String, Object> args = new HashMap<>();
        args.put("x-dead-letter-exchange", EXCHANGE_NAME);
        args.put("x-dead-letter-routing-key", CANCEL_ROUTING_KEY);
        return new Queue(DELAY_QUEUE, true, false, false, args);
    }

    @Bean
    public Binding delayBinding() {
        return BindingBuilder.bind(delayQueue()).to(bookingExchange()).with(DELAY_ROUTING_KEY);
    }

    @Bean
    public Binding cancelBinding() {
        return BindingBuilder.bind(cancelQueue()).to(bookingExchange()).with(CANCEL_ROUTING_KEY);
    }
}