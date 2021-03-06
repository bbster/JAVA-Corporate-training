package com.spring.board.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.lang.*;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

import sun.invoke.empty.Empty;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, PageVo pageVo, Model model
			, HttpServletRequest request) throws Exception{
		
		String[] checkList =(String[])request.getParameterValues("boardType");
		
		if(checkList != null) {
			for(int j=0; j<checkList.length; j++) {
				System.out.println("checked List 출력 : " + checkList[j]);
			}
			pageVo.setBoardTypeParams(checkList);
		}
		
		List<ComCodeVo> codeList = new ArrayList<ComCodeVo>();
		codeList = boardService.codeNameList();
		List<BoardVo> boardList = new ArrayList<BoardVo>();

		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);;
		}
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();

		model.addAttribute("codeName", codeList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum,
			RedirectAttributes redirectAttributes) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		if(boardService.selectBoard(boardType,boardNum) == null){
			redirectAttributes.addFlashAttribute("msg", "존재하지 않는 게시글입니다.");
			return "redirect:/board/boardList.do";
		}
		
		else {
			boardVo = boardService.selectBoard(boardType,boardNum);
			model.addAttribute("boardType", boardType);
			model.addAttribute("boardNum", boardNum);
			model.addAttribute("board", boardVo);
			
			return "board/boardView";
		}
	}
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(HttpServletRequest request, Locale locale, Model model) throws Exception{
		
		List<ComCodeVo> codeNameList = new ArrayList<ComCodeVo>();
		codeNameList = boardService.codeNameList();
		model.addAttribute("codeName", codeNameList);

		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(HttpSession session, Model model, Locale locale, BoardVo boardVo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		System.out.println(session.getAttribute("userName"));
		String boardCreator = (String)session.getAttribute("userName");
		System.out.println("UserName DATA : " + boardCreator);
		boardVo.setCreator(boardCreator);
		System.out.println("boardVo getCreator " + boardVo.getCreator());
		
		
		int resultCnt = boardService.boardInsert(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/board/boardDelete", method = RequestMethod.GET) 
	public String boardDelete(@RequestParam("boardNum")int boardNum, RedirectAttributes redirectAttributes
			, HttpServletRequest request) throws Exception{
		
		int status = boardService.boardDelete(boardNum);
		
		if(status >= 1) {
			redirectAttributes.addFlashAttribute("msg", "게시글이 삭제 되었습니다.");
			return "redirect:/board/boardList.do";
		}
	
		else{
			redirectAttributes.addFlashAttribute("msg", "존재하지 않는 게시글입니다.");
			return "redirect:/board/boardList.do";
		}
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(BoardVo boardVo, Model model 
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum
			,HttpSession session ,RedirectAttributes redirectAttributes) throws Exception{

		boardVo = boardService.selectBoard(boardType,boardNum);
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardUpdate";
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdateAction", method = RequestMethod.POST)
	public String boardUpdateAction(BoardVo boardVo, Model model,
			RedirectAttributes redirectAttributes) throws Exception{

		boardService.boardUpdate(boardVo);
		
		return "redirect:/board/{boardType}/{boardNum}/boardView.do";
	}
}
