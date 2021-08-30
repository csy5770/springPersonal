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
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo=room.getRoomList();
		model.addAttribute("list",roominfo); 
		return "room";
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
