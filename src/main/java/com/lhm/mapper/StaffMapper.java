package com.lhm.mapper;

import com.lhm.pojo.Staff;

import java.util.List;

public interface StaffMapper {

    List<Staff> getAllStaff();

    List<Staff> selectStaffByPageHelper(Staff staff);

    int saveStaff(Staff staff);

}