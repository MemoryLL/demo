package com.lhm.config.shiro;

import com.lhm.pojo.User;
import com.lhm.service.UserService;
import com.lhm.utils.MD5Utils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 自定义Realm
 */
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        //System.out.println("执行授权逻辑");
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //添加资源授权的字符串
//        Subject subject = SecurityUtils.getSubject();
//        User user = (User) subject.getPrincipal();
//        List<String> permissions = userService.findPermsById(user.getId());
//        for (String perm:permissions) {
//            System.out.println(perm);
//        }
        info.addStringPermissions(shiroUser.getUrlSet());
        return info;
    }


    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //System.out.println("执行认证逻辑");
        //1.判断用户名
        UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
        System.out.println(token.getPassword());
        User user = userService.findUserByName(token.getUsername());
        if (user==null){
            //用户名不存在
            return null;
        }
        List<String> permissions = userService.findPermsById(user.getId());
        Set<String> urlSet=new HashSet<>();
        if (null!=permissions&&0!=permissions.size()){
            for (String perm:permissions){
                if (null!=perm && !"".equals(perm)) {
                    urlSet.add(perm);
                }
            }
        }
        ShiroUser shiroUser = new ShiroUser(user.getId(),user.getName());
        shiroUser.setUrlSet(urlSet);
        //如果用户状态为1，则代表该用户被禁用了
        if (user.getState()==1){
            throw new AuthenticationException();
        }
        //2.判断密码
        return new SimpleAuthenticationInfo(shiroUser,user.getPassword(),getName());
    }
}
