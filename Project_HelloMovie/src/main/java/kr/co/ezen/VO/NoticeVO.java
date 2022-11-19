package kr.co.ezen.VO;

import java.util.Date;

public class NoticeVO {

	private int notice_code;  //공지사항 번호
	private int notice_sorting; //0:공지사항, 1:이벤트
	private Date notice_date; //공지사항 등록날자
	private String notice_title; //제목
	private String notice_content; //공지내용
	private String notice_event;	//이미지 파일
	
	public int getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(int notice_code) {
		this.notice_code = notice_code;
	}
	public int getNotice_sorting() {
		return notice_sorting;
	}
	public void setNotice_sorting(int notice_sorting) {
		this.notice_sorting = notice_sorting;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_event() {
		return notice_event;
	}
	public void setNotice_event(String notice_event) {
		this.notice_event = notice_event;
	}
	
}
