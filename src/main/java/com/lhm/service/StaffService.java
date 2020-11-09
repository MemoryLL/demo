package com.lhm.service;

import com.lhm.pojo.Staff;

import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/10/26 19:47
 * 4
 */
public interface StaffService {
    List<Staff> getAllStaff();

    List<Staff> selectStaffByPageHelper(Staff staff);

    int saveStaff(Staff staff);

}
