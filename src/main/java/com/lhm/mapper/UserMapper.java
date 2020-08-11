package com.lhm.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lhm.pojo.User;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    IPage<User> selectUserPage(Page page);

    int saveUser(User user);

    int delUserBuId(int id);

    int updateAgeById(User user);

    List<User> selectUserByPageHelper(User user);

    List<User> getAllUser();

    int UpdateUserStateById(User user);

    User findUserByName(@Param("username") String username);

}