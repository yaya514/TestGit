package com.design.mapper;

import com.design.pojo.Admin;

public interface AdminDao {

    Admin getAdminByNumber(String number);

    void editAdminPasswordByNumber();
}
