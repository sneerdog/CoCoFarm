package web.dto;

import java.util.Date;

public class Member {
	private int idx;
	private String name;
	private String email;
	private String phone;
	private Date joinDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	@Override
	public String toString() {
		return "Member [ idx = "+idx
				+", name = " + name 
				+", email = " + email 
				+", phone = " + phone 
				+", join_date = "+joinDate+"]\n";
		
	}
}
