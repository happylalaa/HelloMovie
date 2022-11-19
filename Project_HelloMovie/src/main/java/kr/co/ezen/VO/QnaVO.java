package kr.co.ezen.VO;

import java.util.Date;

public class QnaVO {

	private int qna_code;  //1:1문의 게시글 번호
	private String id; //작성자(1:1문의자)
	private Date qna_date; //작성일자(문의 등록날짜)
	private String qna_title; //제목(문의 유형)
	private String qna_content; //내용(문의내용)
	private String qna_answer;
	
	public int getQna_code() {
		return qna_code;
	}
	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	
	
}
