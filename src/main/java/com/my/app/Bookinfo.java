package com.my.app;

public class Bookinfo {
	private int bookcode;
	private int roomcode;
	private int person;
	private int howmany;
	private String name;
	private String checkin;
	private String checkout;
	private String roomname;
	private String mobile;
	private String typename;
	private int price;
	private int max_person;
	
	public Bookinfo() {}
	public Bookinfo(int bookcode, int roomcode, int person, String checkin, String checkout, String roomname,
			String mobile, String typename,String name,int price,int howmany,int max_person) {
		this.bookcode = bookcode;
		this.roomcode = roomcode;
		this.person = person;
		this.checkin = checkin;
		this.checkout = checkout;
		this.roomname = roomname;
		this.mobile = mobile;
		this.typename = typename;
		this.name=name;
		this.price=price;
		this.howmany=howmany;
		this.max_person=max_person;
	}
	
	public int getMax_person() {
		return max_person;
	}
	public void setMax_person(int max_person) {
		this.max_person = max_person;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
