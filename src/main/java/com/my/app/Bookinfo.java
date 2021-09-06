package com.my.app;

public class Bookinfo {
	private int bookcode;
	private int roomcode;
	private int person;
	private String name;
	private String checkin;
	private String checkout;
	private String roomname;
	private String mobile;
	private String typename;
	
	public Bookinfo() {}
	public Bookinfo(int bookcode, int roomcode, int person, String checkin, String checkout, String roomname,
			String mobile, String typename,String name) {
		this.bookcode = bookcode;
		this.roomcode = roomcode;
		this.person = person;
		this.checkin = checkin;
		this.checkout = checkout;
		this.roomname = roomname;
		this.mobile = mobile;
		this.typename = typename;
		this.name=name;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public int getBookcode() {
		return bookcode;
	}
	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
