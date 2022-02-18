package com.youngtube.demo.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.sql.DataSource;

@SpringBootConfiguration
public class DruidConfig implements WebMvcConfigurer
{
    @Override
    public void addCorsMappings(CorsRegistry corsRegistry){
        /**
         * 所有请求都允许跨域，使用这种配置就不需要
         * 在interceptor中配置header了
         */
        corsRegistry.addMapping("/**")
                .allowCredentials(true)
                .allowedOrigins("http://localhost:8010")
                .allowedMethods("POST", "GET", "PUT", "OPTIONS", "DELETE")
                .allowedHeaders("*")
                .maxAge(3600);
    }

    //将druid数据源加到容器中
    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean//组件
    public DataSource druidDataSource() {
        return new DruidDataSource();
    }



}