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
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.spring.common.CommonUtil;
import com.spring.user.vo.UserVo;
import com.spring.user.service.userService;
import com.spring.board.service.boardService;

import sun.invoke.empty.Empty;

@Controller
public class UserController {
	
	@Autowired 
	userService userService;
	
	@Autowired
	boardService boardService;
	
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
	
	@RequestMapping(value = "/users/userLoginCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView userLoginAction(@ModelAttribute UserVo userVo, HttpSession session, Locale locale
			, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		boolean result = userService.userLoginCheck(userVo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("redirect:/board/boardList.do");
			mav.addObject("msg", "success");
		}
		else {
			mav.setViewName("users/userLogin");
			mav.addObject("msg", "failed");
		}
		return mav;
	}
	
	@RequestMapping("users/userLogout.do")
	public ModelAndView userLogout(HttpSession session) throws Exception {
		userService.userLogout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/boardList.do");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	@RequestMapping(value = "/users/userJoinAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String userJoinAction(HttpSession session, UserVo userVo, Locale locale
			, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = userService.userJoin(userVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/users/userIdDupCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int userIdDup(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String userId = request.getParameter("userId");
		
		if(userId == null) {
			System.out.println("userId is NULL");
		}
		System.out.println("USER ID : " + userId);
		
		UserVo idDupCheck = userService.userIdDup(userId);
		 

		System.out.println("id Duplicate data" + idDupCheck);
		
		int result = 0;
		
		if(idDupCheck != null) {
			result = 1;
		}
		
		System.out.println(result);
		
		return result;
	}
}