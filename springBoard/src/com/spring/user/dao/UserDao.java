package com.spring.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.user.vo.UserVo;
import com.spring.board.vo.ComCodeVo;

public interface UserDao {

	public int userJoin(UserVo userVo) throws Exception;
	
	public boolean userLoginCheck(UserVo userVo) throws Exception;
	
	public UserVo userLogin(UserVo userVo) throws Exception;
	
	public void userLogout(HttpSession session);
	
	public List<ComCodeVo> codePhoneList() throws Exception;
	
	public UserVo userIdDup(String userId) throws Exception;

}
