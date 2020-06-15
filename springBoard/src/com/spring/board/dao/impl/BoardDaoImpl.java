package com.spring.board.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.logging.impl.Log4JLogger;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.impl.Log4jLoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;
import com.sun.media.jfxmedia.logging.Logger;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}
	/**
	 * 
	 * */
	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardList",pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		return sqlSession.selectOne("board.boardTotal");
	}
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws SQLException {
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", boardVo);
	}
	
	@Override
	public int boardDelete(int boardNum){
			int count = sqlSession.delete("board.boardDelete", boardNum);
			if(count == 1) {
				System.out.println(sqlSession.delete("board.boardDelete", boardNum)+" - 정상 실행 되었을때");
				return count;
			}
			else{
				System.out.println(sqlSession.delete("board.boardDelete", boardNum)+" - 없는 데이터 삭제 했을때");
				return count;
			}
	}
	
	@Override
	public int boardUpdate(BoardVo boardVo) throws SQLException {
		System.out.println(sqlSession.update("board.boardUpdate", boardVo)+" 보드 업데이트 데이터 체크");
		return sqlSession.update("board.boardUpdate", boardVo);
	}
	
	@Override
	public List<ComCodeVo> codeNameList() throws Exception {
		return sqlSession.selectList("board.codeNameList");
	}
}
