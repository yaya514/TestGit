package com.design.pojo;

import java.io.Serializable;

public class Student implements Serializable {
	
	private int student_id;				//学生id
	private String student_name;		//学生姓名
	private String student_number;		//学生账号
	private String password; 			//学生密码
	private int gender;					//学生性别（0代表女，1代表男）
	private String profession;			//学生积分
	private String teacher_number;		//学生指导老师id
	private int topic_id;				//学生所选课题id
	private int document_id;			//学生文档id
	private int scores_id;				//学生评分表id
	private int record_id;				//学生记录表id
	private int group_id;				//学生所在答辩小组id
	private int plan_id;				//学生计划表id
	private int role;					//身份类型
	
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getStudent_number() {
		return student_number;
	}
	public void setStudent_number(String student_number) {
		this.student_number = student_number;
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
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getTeacher_number() {
		return teacher_number;
	}
	public void setTeacher_number(String teacher_number) {
		this.teacher_number = teacher_number;
	}
	public int getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public int getScores_id() {
		return scores_id;
	}
	public void setScores_id(int scores_id) {
		this.scores_id = scores_id;
	}
	public int getRecord_id() {
		return record_id;
	}
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
}
