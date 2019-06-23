package com.design.pojo;

import java.io.Serializable;
import java.util.Date;

public class Plan implements Serializable{
	
	private int plan_id;
	private String plan_date;
	private String time;
	private String place;
	private int group_id;
	private Mygroup mygroup;
	
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	public String getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(String plan_date) {
		this.plan_date = plan_date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public Mygroup getMygroup() {
		return mygroup;
	}
	public void setMygroup(Mygroup mygroup) {
		this.mygroup = mygroup;
	}
	
}
