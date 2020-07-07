package com.spring.user.service.impl;

import java.util.List;
import java.util.regex.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.user.dao.UserDao;
import com.spring.user.service.userService;
import com.spring.user.vo.UserVo;

@Service
public class userServiceImpl implements userService{
	
	@Autowired
	UserDao userDao;
	
	@Override
	public int userJoin(UserVo userVo) throws Exception{
//		if(userVo.getUserId().length() < 5 || userVo.getUserId().length() > 20) {
//			String pattern = "^[a-zA-Z]+[a-zA-Z0-9]";
//			boolean idPattern = Pattern.matches(pattern, userVo.getUserId());
//			boolean pwPattern = Pattern.matches(pattern, userVo.getUserPw());
//			if(idPattern==true) {
//				return userDao.userJoin(userVo);
//			}else {
//				return 0;
//			}
//		}
		return userDao.userJoin(userVo);
	}

	@Override
	public boolean userLoginCheck(UserVo userVo, HttpSession session) throws Exception {
		boolean result = userDao.userLoginCheck(userVo);
		if(result) {
			UserVo addSession = userLogin(userVo);
			
			session.setAttribute("userId", addSession.getUserId());
			session.setAttribute("userName", addSession.getUserName());
		}
		return result;
	}
	
	@Override
	public UserVo userLogin(UserVo userVo) throws Exception{
		return userDao.userLogin(userVo);
	}
	
	@Override
	public void userLogout(HttpSession session) throws Exception{
		session.setAttribute("userId", null);
		session.setAttribute("userName", null);
		session.invalidate();
	}
	
	
	@Override
	public List<ComCodeVo> codePhoneList() throws Exception {
		return userDao.codePhoneList();
	}

	@Override
	public UserVo userIdDup(String userId) throws Exception {
		return userDao.userIdDup(userId);
	}
}
