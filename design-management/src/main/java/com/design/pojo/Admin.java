package com.design.pojo;

import java.io.Serializable;

public class Admin implements Serializable {

	private int id; 			// 管理员id
	private String name; 		// 管理员姓名
	private String number; 		// 管理员账号
	private String password; 	// 管理员密码
	private int power; 			// 管理员权限
	private int role;			//角色身份（0：管理员，1：教师，2：学生）
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	
}
