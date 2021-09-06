package com.my.app;

import java.util.ArrayList;

public interface iBook {
	ArrayList<Bookinfo> getReservList();
	void doDeleteReserv(int bookcode);
	void doAddReserv(int roomcode,int person,String checkin,String checkout,String name,String mobile);
}
