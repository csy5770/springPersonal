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
	@RequestMapping(value="/getReservList",method = RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String getReservList(HttpServletRequest hsr) {
		iBook book=sqlSession.getMapper(iBook.class);
		ArrayList<Bookinfo> bookinfo = book.getReservList();
		JSONArray ja = new JSONArray();
		for(int i=0;i<bookinfo.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("bookcode", bookinfo.get(i).getBookcode());
			jo.put("roomcode", bookinfo.get(i).getRoomcode());
			jo.put("typename", bookinfo.get(i).getTypename());
			jo.put("person", bookinfo.get(i).getPerson());
			jo.put("checkin", bookinfo.get(i).getCheckin());
			jo.put("checkout", bookinfo.get(i).getCheckout());
			jo.put("roomname", bookinfo.get(i).getRoomname());
			jo.put("name", bookinfo.get(i).getName());
			jo.put("mobile", bookinfo.get(i).getMobile());
			jo.put("price", bookinfo.get(i).getPrice());
			
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
	@RequestMapping(value="/deleteReserv",method = RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String deleteReserv(HttpServletRequest hsr) {
		int bookcode=Integer.parseInt(hsr.getParameter("bookcode"));
		iBook book=sqlSession.getMapper(iBook.class);
		book.doDeleteReserv(bookcode);
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
	
	@RequestMapping(value="/signin",method = RequestMethod.POST,
			produces="application/text; charset=utf8")
	public String doSignin(HttpServletRequest hsr) {
		//insert into member , 작업필요: xml interface jsp controller: 전체 완료
		iMember member=sqlSession.getMapper(iMember.class);
		String name=hsr.getParameter("rName");
		String loginid=hsr.getParameter("newid");
		String passcode=hsr.getParameter("passcode1");
		member.doSignin(name, loginid, passcode);
		return "login";
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
	@RequestMapping(value="/addReserv",method = RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String addReserv(HttpServletRequest hsr) {
		int rcode=Integer.parseInt(hsr.getParameter("roomcode"));
		System.out.println(rcode);
		int person=Integer.parseInt(hsr.getParameter("person"));
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		String name=hsr.getParameter("name");
		String mobile=hsr.getParameter("mobile");
		int price = Integer.parseInt(hsr.getParameter("price"));
		iBook book=sqlSession.getMapper(iBook.class);
		book.doAddReserv(rcode, person, checkin, checkout, name, mobile, price);
		return "ok";
	}
	
	@RequestMapping(value="/check_user", method = RequestMethod.POST)
	 public String check_user(HttpServletRequest hsr, Model model) {
	      String userid=hsr.getParameter("userid");
	      String userpw=hsr.getParameter("password");
	      iMember member=sqlSession.getMapper(iMember.class);
	      int n=member.doCheckUser(userid, userpw);
	      if(n>0) {
	    	  HttpSession session=hsr.getSession();
		      session.setAttribute("loginid",userid);
		      return "redirect:/booking";
	      }
	      else {//DB에 없는 회원
	    	  return "home";
	      }
	      
	}
	
	@RequestMapping(value="/booking",method = RequestMethod.GET)
	public String booking(HttpServletRequest hsr, Model model) {
		iRoom room_type=sqlSession.getMapper(iRoom.class);
		ArrayList<Roomtype> roomtype=room_type.getRoomType();
		model.addAttribute("list2",roomtype);
		
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
