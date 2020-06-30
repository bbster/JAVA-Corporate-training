package com.spring.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.user.vo.UserVo;

public interface userService {

	public int userJoin(UserVo userVo) throws Exception;

	public boolean userLoginCheck(UserVo userVo, HttpSession session) throws Exception;
	
	public UserVo userLogin(UserVo userVo) throws Exception;
	
	public void userLogout(HttpSession session) throws Exception;
	
	public List<ComCodeVo> codePhoneList() throws Exception;

}
