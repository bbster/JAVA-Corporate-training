package com.spring.board.vo;

public class PageVo {
	
	private Integer pageNo = 0;
	private String codeId;
	private String[] boardTypeParams ;

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getCodeId() {
		return codeId;
	}
	
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String[] getBoardTypeParams() {
		return boardTypeParams;
	}

	public void setBoardTypeParams(String[] boardTypeParams) {
		this.boardTypeParams = boardTypeParams;
	}
	
}
