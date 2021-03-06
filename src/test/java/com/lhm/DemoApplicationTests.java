package com.lhm;

import com.lhm.common.TreeNode;
import com.lhm.mapper.RoleMapper;
import com.lhm.pojo.Class;
import com.lhm.pojo.Major;
import com.lhm.pojo.Resource;
import com.lhm.pojo.Role;
import com.lhm.pojo.RoleResource;
import com.lhm.service.*;
import com.lhm.utils.MD5Utils;
import com.lhm.utils.TreeBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@SpringBootTest
class DemoApplicationTests {

    @Autowired
    ResourceService resourceService;
    @Autowired
    RoleService roleService;
    @Autowired
    UserService userService;
    @Autowired
    RoleMapper roleMapper;

    @Test
    void testMd5() throws NoSuchAlgorithmException {
        String s = MD5Utils.stringToMD5("123");
        System.out.println(s);
        String s1 = MD5Utils.stringToMD5("123");
        System.out.println(s1);
    }

    @Test
    void testTreeNode(){
        List<Resource> list = resourceService.getAllResource();
        List<TreeNode> treeNodes = TreeBuilder.TreeNodeBulid(list);
        System.out.println(treeNodes);
    }

    @Test
    void saveRoleResource(){
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        list.add(5);
        list.add(6);
        Role role = new Role();
        role.setRoleName("普通");
        role.setRoleLevel((byte)1);
        role.setDescription("普通角色");
        role.setCreateUserId(1);
        role.setCreateUserId(1);
        role.setCreateTime(new Date());
        int i = roleService.saveRoleResource(role, list);
        System.out.println(i);
    }

    @Test
    void testFindPermsById(){
        List<String> perms = userService.findPermsById(2);
        System.out.println(perms);
    }

    @Test
    void testMd52(){
        String password = MD5Utils.md5("123456");
        System.out.println(password);
        String password2 = MD5Utils.md5("123456");
        System.out.println(password2);
    }

    @Test
    void testdeleteResourceByRoleId(){
        roleMapper.deleteResourceByRoleId(3);
    }

    @Test
    void testgetRoleResourceByRoleId(){
        List<RoleResource> roleResource = roleMapper.getRoleResourceByRoleId(1);
        System.out.println(roleResource);
    }
}
