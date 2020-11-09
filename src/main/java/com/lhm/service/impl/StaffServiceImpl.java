package com.lhm.service.impl;

import com.lhm.mapper.StaffMapper;
import com.lhm.pojo.Staff;
import com.lhm.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author: lhm
 * @Date: 2020/10/26 19:47
 * 4
 */
@Service
public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffMapper staffMapper;

    @Override
    public List<Staff> getAllStaff() {
        return staffMapper.getAllStaff();
    }

    @Override
    public List<Staff> selectStaffByPageHelper(Staff staff) {
        return staffMapper.selectStaffByPageHelper(staff);
    }

    @Override
    public int saveStaff(Staff staff) {
        staff.setCreateTime(new Date());
        return staffMapper.saveStaff(staff);
    }
}
