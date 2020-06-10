package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;


@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		return boardDao.selectTest();
	}
	
	@Override
	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception {
		return boardDao.selectBoardList(pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		return boardDao.selectBoardCnt();
	}
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		BoardVo boardVo = new BoardVo();
		
		System.out.println(boardVo.getBoardType()+" ServiceImpl_BoardView_boardType");
		System.out.println(boardVo.getBoardNum()+" ServiceImpl_BoardView_boardNum");
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		System.out.println(boardVo.getBoardTitle()+ " - title 데이터 확인 (서비스)");
		System.out.println(boardVo.getBoardComment()+ " - comment 데이터 확인 (서비스)");
		if(boardVo.getBoardTitle() == null || boardVo.getBoardTitle() == "" || boardVo.getBoardTitle().length() == 0
				|| boardVo.getBoardComment() == null || boardVo.getBoardComment() == "" || boardVo.getBoardComment().length() ==0) {
			return 0;
		}
		else{return boardDao.boardInsert(boardVo);}
	}
	
	
	@Override
	public int boardDelete(int boardNum) throws Exception{
		return boardDao.boardDelete(boardNum);
	}
	
	
	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		return boardDao.boardUpdate(boardVo);
	}

}
