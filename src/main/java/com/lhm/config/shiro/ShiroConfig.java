package com.lhm.config.shiro;

import com.google.common.collect.Maps;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.mgt.RememberMeManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.AnonymousFilter;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
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
        filterMap.put("/getImageCode.json","anon");
        filterMap.put("/*","user");
        bean.setFilterChainDefinitionMap(filterMap);
        return bean;
    }

    /**
     * 创建DefauleWebSecurityManager
     */
    @Bean(name="securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("userRealm") UserRealm userRealm,
                                                                  @Qualifier("rememberMeManager") RememberMeManager rememberMeManager){
        DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
        manager.setRealm(userRealm);
        manager.setRememberMeManager(rememberMeManager);
        return manager;
    }

    //记住我
    @Bean(name = "rememberMeManager")
    public CookieRememberMeManager rememberMeManager(){
        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
        cookieRememberMeManager.setCookie(rememberMeCookie());
        //这个地方有点坑，不是所有的base64编码都可以用，长度过大过小都不行，没搞明白，官网给出的要么0x开头十六进制，要么base64
        cookieRememberMeManager.setCipherKey(Base64.decode("4AvVhmFLUs0KTA3Kprsdag=="));
        return cookieRememberMeManager;
    }

    //cookie管理
    @Bean
    public SimpleCookie rememberMeCookie() {
        SimpleCookie cookie = new SimpleCookie("demo_rememberMe");
        cookie.setHttpOnly(true);
        cookie.setMaxAge(1 * 60 * 60);
        return cookie;
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
