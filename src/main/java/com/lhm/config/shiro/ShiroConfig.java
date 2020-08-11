package com.lhm.config.shiro;

import com.google.common.collect.Maps;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.AnonymousFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {
    /**
     * 创建ShiroFilterFactoryBean
     */
    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("securityManager")DefaultWebSecurityManager securityManager){
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        //设置安全管理器
        bean.setSecurityManager(securityManager);
        //添加shiro内置过滤器
        /**
         * Shiro内置过滤器，可以实现权限相关的拦截器
         * 	常用的过滤器
         * 		anon：无需认证（登录）就可以访问
         * 		authc:必须认证才可以访问
         * 		user：如果使用rememberMe的功能可以直接访问
         * 		perms:该资源必须得到资源授权才可以访问
         * 		role:该资源必须得到角色权限才可以访问
         */
        //修改未认证跳转的登录页面
        bean.setLoginUrl("/login.html");
        //设置未授权提示页面
        bean.setUnauthorizedUrl("/noAuth.html");

        Map<String, Filter> filters = Maps.newHashMap();
        filters.put("anon",new AnonymousFilter());
        filters.put("perms",getShiroRequestUrl());
        bean.setFilters(filters);

        Map<String,String> filterMap = new LinkedHashMap<String,String>();
        filterMap.put("/login.json","anon");
        filterMap.put("/login.html","anon");
        filterMap.put("/*","authc");
        bean.setFilterChainDefinitionMap(filterMap);
        return bean;
    }

    /**
     * 创建DefauleWebSecurityManager
     */
    @Bean(name="securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("userRealm") UserRealm userRealm){
        DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
        manager.setRealm(userRealm);
        return manager;
    }

    @Bean(name = "shiroRequestUrl")
    public ShiroRequestUrl getShiroRequestUrl(){
        return new ShiroRequestUrl();
    }

    /**
     * 创建Realm
     */
    @Bean(name = "userRealm")
    public UserRealm getUserRealm(){
        return new UserRealm();
    }

    /**
     * 配置ShiroDialect，用于Thymeleaf和shiro标签配合使用
     */
}
