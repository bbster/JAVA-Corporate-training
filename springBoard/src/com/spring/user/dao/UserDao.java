package com.spring.user.dao;

import java.util.List;
import com.spring.user.vo.UserVo;
import com.spring.board.vo.ComCodeVo;

public interface UserDao {

	public int userJoin(UserVo userVo) throws Exception;
	
	public boolean userLogin(String userId, String userPw) throws Exception;
	
	public List<ComCodeVo> codePhoneList() throws Exception;

}
