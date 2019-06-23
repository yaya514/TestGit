package com.design.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Teacher implements Serializable {
	
	private int teacher_id;				//教师id
	private String teacher_name;		//教师姓名
	private String teacher_number;		//教师账号
	private String password; 			//教师密码
	private int gender;					//教师性别（0代表女，1代表男）
	private int group_id;				//教师所在答辩小组id
	private String teach_course;		//教师所教的课程
	private List<Topic> topicList = new ArrayList<Topic>();		//教师所发布的课题
	private int role;			
	
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getTeacher_number() {
		return teacher_number;
	}
	public void setTeacher_number(String teacher_number) {
		this.teacher_number = teacher_number;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public List<Topic> getTopicList() {
		return topicList;
	}
	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}
	public String getTeach_course() {
		return teach_course;
	}
	public void setTeach_course(String teach_course) {
		this.teach_course = teach_course;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
}
