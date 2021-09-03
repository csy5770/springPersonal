package com.my.app;

import java.util.ArrayList;

public interface iMember {
	void doSignin(String name,String loginid, String passcode);
	int doCheckUser(String userid,String passcode);
}
