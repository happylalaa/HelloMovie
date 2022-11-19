package kr.co.ezen.VO;

import java.util.Date;

public class BuyVO {
	
	private int buy_code;
	private Date buy_date;
	private String id;
	private String movie_code;
	
	public int getBuy_code() {
		return buy_code;
	}
	public void setBuy_code(int buy_code) {
		this.buy_code = buy_code;
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	
	
	
}
