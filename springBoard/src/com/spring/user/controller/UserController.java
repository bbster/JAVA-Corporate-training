package com.spring.user.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.lang.*;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.HomeController;
import com.spring.board.vo.ComCodeVo;
import com.spring.user.vo.UserVo;
import com.spring.user.service.userService;

import sun.invoke.empty.Empty;

@Controller
public class UserController {
	
	@Autowired 
	userService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/users/userJoin.do", method = RequestMethod.GET)
	public String userJoin(Locale locale,UserVo userVo, Model model
			, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		List<ComCodeVo> codePhoneList = new ArrayList<ComCodeVo>();
		codePhoneList = userService.codePhoneList();
		model.addAttribute("codeName", codePhoneList);

		return "/users/userJoin";
	}
	
	@RequestMapping(value = "/users/userLogin.do", method = RequestMethod.GET)
	public String userLogin(Locale locale) throws Exception{

		return "/users/userLogin";
	}
	
	@RequestMapping(value = "/users/userLoginAction", method = RequestMethod.POST)
	@ResponseBody
	public String userLoginAction(HttpSession session, UserVo userVo, Locale locale
			, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		System.out.println("User ID : " + userId);
		System.out.println("User PW : " + userPw);
		
		userService.userLogin(userId, userPw);
		
		session = request.getSession();
		
		session.setAttribute("userId", userVo.getUserId());
		session.setAttribute("userName", userVo.getUserName()); 
		
		return "/board/boardList.do";
	}
	
	@RequestMapping(value = "/users/userJoinAction", method = RequestMethod.POST)
	@ResponseBody
	public String userJoinAction(HttpSession session, UserVo userVo, Locale locale
			, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		userService.userJoin(userVo);
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userPhone1 = request.getParameter("userPhone1");
		String userPhone2 = request.getParameter("userPhone2");
		String userPhone3 = request.getParameter("userPhone3");
		String userAddr1 = request.getParameter("userAddr1");
		String userAddr2 = request.getParameter("userAddr2");
		String userCompany = request.getParameter("userCompany");
		
		model.addAttribute("userId", userVo.getUserId());
		model.addAttribute("userPw", userVo.getUserPw());
		model.addAttribute("userName", userVo.getUserName());
		model.addAttribute("userPhone1", userVo.getUserPhone1());
		model.addAttribute("userPhone2", userVo.getUserPhone2());
		model.addAttribute("userPhone3", userVo.getUserPhone3());
		model.addAttribute("userAddr1", userVo.getUserAddr1());
		model.addAttribute("userAddr2", userVo.getUserAddr2());
		model.addAttribute("userCompany", userVo.getUserCompany());
		
		return "redirect:/users/userLogin";
	}
}