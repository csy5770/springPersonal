package com.my.app;

import java.util.ArrayList;

public interface iBook {
	ArrayList<Roominfo> getAvailRoom(String checkin, String checkout, int typecode);
	ArrayList<Bookinfo> getReservList(String checkin, String checkout);
	void doDeleteReserv(int bookcode);
	void doAddReserv(int roomcode,int person,String checkin,String checkout,String name,String mobile,int price);
}
