package com.spring.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spring.user.vo.UserVo;

public interface userService {

	public int userJoin(UserVo userVo) throws Exception;

}
