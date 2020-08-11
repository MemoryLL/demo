package com.lhm.config.shiro;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

public class ShiroRequestUrl extends AccessControlFilter {

    private static final String INDEX = "/index.html";
    private static final String Forbidden = "/noAuth.html";
    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object o) throws Exception {
        Subject user = SecurityUtils.getSubject();
        String url = getPathWithinApplication(servletRequest);
        if (user.getPrincipal() == null || StringUtils.endsWithAny
                (url,"index.html","login.html","exit.html","login,json","noAuth.html")) {
            return true;
        }
        ShiroUser shiroUser = (ShiroUser)user.getPrincipal();
        Set<String> urlSet = shiroUser.getUrlSet();
        for (String s:urlSet){
            if (url.endsWith(s)){
                return true;
            }
        }
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        Subject user = SecurityUtils.getSubject();
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        if (!user.isAuthenticated()){
            response.sendRedirect(request.getContextPath()+INDEX);
        }else{
            response.sendRedirect(request.getContextPath()+Forbidden);
        }
        return false;
    }
}
