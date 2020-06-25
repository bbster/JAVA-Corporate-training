package com.spring.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.user.vo.UserVo;

public interface userService {

	public int userJoin(UserVo userVo) throws Exception;

	public UserVo userLogin(String userId, String userPw) throws Exception;
	
	public List<ComCodeVo> codePhoneList() throws Exception;
}
