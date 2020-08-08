package com.lhm;

import com.lhm.common.TreeNode;
import com.lhm.pojo.Resource;
import com.lhm.service.ResourceService;
import com.lhm.utils.MD5Utils;
import com.lhm.utils.TreeBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.security.NoSuchAlgorithmException;
import java.util.List;

@SpringBootTest
class DemoApplicationTests {

    @Autowired
    ResourceService resourceService;

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

}
