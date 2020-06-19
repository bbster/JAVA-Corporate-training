package com.spring.user.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.logging.impl.Log4JLogger;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.impl.Log4jLoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.user.dao.UserDao;
import com.spring.user.vo.UserVo;
import com.sun.media.jfxmedia.logging.Logger;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int userJoin(UserVo userVo) throws SQLException {
		return sqlSession.insert("user.userJoin", userVo);
	}
	
}
