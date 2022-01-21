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
public class MyConfigurer implements WebMvcConfigurer
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


//    /**
//     * 配置session工厂
//     * 排除springboot自动配置的pagehelper拦截器
//     * @return
//     * @throws Exception
//     */
//    @Bean
//    public
//    SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
//        final SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
//
//        sqlSessionFactoryBean.setDataSource(dataSource);
//
//        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
//        sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath*:/mapper/*Mapper.xml"));
//
////        PageInterceptor pageInterceptor = new PageInterceptor();
////        Properties properties = new Properties();
////        properties.setProperty("helperDialect", "oracle");
////        properties.setProperty("reasonable", "true");
////        properties.setProperty("supportMethodsArguments", "true");
////        properties.setProperty("params", "pageNum=pageNum;pageSize=pageSize");
////        pageInterceptor.setProperties(properties);
////        sqlSessionFactoryBean.setPlugins(new Interceptor[]{pageInterceptor});
//
//        return sqlSessionFactoryBean.getObject();
//    }


}