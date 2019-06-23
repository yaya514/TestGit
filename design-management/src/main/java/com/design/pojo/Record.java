package com.design.pojo;

import java.io.Serializable;

public class Record implements Serializable{

	private int record_id;
	private String content;
	private String teacher_comments;
	private int student_id;
	
	public int getRecord_id() {
		return record_id;
	}
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTeacher_comments() {
		return teacher_comments;
	}
	public void setTeacher_comments(String teacher_comments) {
		this.teacher_comments = teacher_comments;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	
	
}
