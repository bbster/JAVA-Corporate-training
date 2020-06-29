package com.spring.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.user.dao.UserDao;
import com.spring.user.service.userService;
import com.spring.user.vo.UserVo;

@Service
@Repository
public class userServiceImpl implements userService{
	
	@Autowired
	UserDao userDao;
	
	@Override
	public int userJoin(UserVo userVo) throws Exception {
		
		return userDao.userJoin(userVo);
	}

	@Override
	public boolean userLogin(String userId, String userPw) throws Exception {
		String user = userDao.userLogin(userId, userPw);
		if(user == false) {
			if(userId.equals(user.getUserId()) && userPw.equals(user.getUserPw())) {
				return userDao.userLogin(userId, userPw);
			}
			else {
				return false;
			}
		}
		return userDao.userLogin(userId, userPw);
	}
	
	@Override
	public List<ComCodeVo> codePhoneList() throws Exception {
		return userDao.codePhoneList();
	}
}
