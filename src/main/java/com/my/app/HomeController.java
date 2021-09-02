package com.my.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private HttpSession session;
	
	@Autowired
	   private SqlSession sqlSession;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping("/newbie")
	public String newbie() {
		return "newbie";
	}
	@RequestMapping("/room")
	public String room(HttpServletRequest hsr,Model model) {
		HttpSession session=hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/login";
		}
		// 여기서 interface 호출, 결과를 room.jsp로 전송.
//		iRoom room=sqlSession.getMapper(iRoom.class);
//		ArrayList<Roominfo> roominfo=room.getRoomList();
//		model.addAttribute("list",roominfo);
		
		iRoom room_type=sqlSession.getMapper(iRoom.class);
		ArrayList<Roomtype> roomtype=room_type.getRoomType();
		model.addAttribute("list2",roomtype);
		return "room";
	}
	@RequestMapping(value="/getRoomList",method = RequestMethod.POST,
					produces="application/text; charset=utf8")
	@ResponseBody
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo=room.getRoomList();
		//찾은 데이터로 JSONArray 만들기
		JSONArray ja = new JSONArray();
		for(int i=0;i<roominfo.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("roomcode", roominfo.get(i).getRoomcode());
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("typename", roominfo.get(i).getTypename());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	@RequestMapping(value="/deleteRoom",method = RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	@RequestMapping(value="/addRoom",method = RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
		String rname=hsr.getParameter("roomname");
		int rtype=Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doAddRoom(rname, rtype, howmany, howmuch);
		return "ok";
	}
	@RequestMapping(value="/updateRoom",method = RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(Integer.parseInt(hsr.getParameter("roomcode")),
				hsr.getParameter("roomname"),
				Integer.parseInt(hsr.getParameter("roomtype")),
				Integer.parseInt(hsr.getParameter("howmany")),
				Integer.parseInt(hsr.getParameter("howmuch")));
		return "ok";
	}
	@RequestMapping(value="/check_user", method = RequestMethod.POST)
	 public String check_user(HttpServletRequest hsr, Model model) {
	      String userid=hsr.getParameter("userid");
	      String userpw=hsr.getParameter("password");
	      HttpSession session=hsr.getSession();
	      session.setAttribute("loginid",userid);
	      return "redirect:/booking";
	}
	@RequestMapping(value="/booking",method = RequestMethod.GET)
	public String booking(HttpServletRequest hsr) {
		HttpSession session=hsr.getSession();
		String loginid=(String)session.getAttribute("loginid");
		if(loginid.equals("")|| loginid==null) { 
			return "redirect:/login";
		}
		else {
			return "booking";
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
	HttpSession session=hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
//	@RequestMapping(value="/join_info",method = RequestMethod.POST)
//	public String doInfo(HttpServletRequest hsr,Model model) {
//		String rn=hsr.getParameter("rName");
//		String nid=hsr.getParameter("newid");
//		String pc1=hsr.getParameter("passcode1");
//		String pc2=hsr.getParameter("passcode2");
//		String mobile=hsr.getParameter("mobile");
//		model.addAttribute("newid",nid);
//		model.addAttribute("name",rn);
//		model.addAttribute("pc1",pc1);
//		model.addAttribute("pc2",pc2);
//		model.addAttribute("mobile",mobile);
//		return "newinfo";
//	}
	@RequestMapping("/selected")
	public String doJob(HttpServletRequest hsr, Model model) {
		String strPath=hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "login";
		}
		else if(strPath.equals("newbie")) {
			return "newbie";
		}
		return "redirect:/home";	
	}
}
