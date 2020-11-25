package com.spring.board.vo;

public class pinkBoardVo {
	
	private int boardIdx;
	private String boardId;
	private String boardComment;
	private int totalCnt;
	private String boardTime;
	
	

	public String getBoardTime() {
		return boardTime;
	}
	public void setBoardTime(String boardTime) {
		this.boardTime = boardTime;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	
	
	

}
