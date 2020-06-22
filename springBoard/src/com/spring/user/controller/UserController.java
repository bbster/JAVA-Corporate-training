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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.HomeController;
import com.spring.user.vo.UserVo;
import com.spring.user.service.userService;

import sun.invoke.empty.Empty;

@Controller
public class UserController {
	
	@Autowired 
	userService userService; 
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/users/userJoin.do", method = RequestMethod.GET)
	@ResponseBody
	public String userJoin(Locale locale,UserVo userVo, Model model
			, HttpServletRequest request, HttpServletResponse response) throws Exception{
		userService.userJoin(userVo);
		return "redirect:/users/userLogin.do";
	}
	
	@RequestMapping(value = "/users/userLogin.do", method = RequestMethod.GET)
	@ResponseBody
	public String userLogin(HttpSession session, UserVo userVo, Locale locale
			, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		return "redirect:/users/userLogin.do";
	}
}