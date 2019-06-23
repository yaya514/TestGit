package com.design.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.design.mapper.AdminDao;
import com.design.pojo.Admin;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	public Admin getAdminByNumber(String number) {
		return adminDao.getAdminByNumber(number);
	}

	public void editAdminPasswordByNumber(Admin admin) {
		adminDao.editAdminPasswordByNumber();
	}
}
