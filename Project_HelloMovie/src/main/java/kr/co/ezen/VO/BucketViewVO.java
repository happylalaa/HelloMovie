package kr.co.ezen.VO;

public class BucketViewVO {
	private int bucket_code; // 장바구니 번호
	private String id;  // 회원 아이디
	private String movie_title; // 영화 제목
	private String movie_img; // 영화 이미지
	private int movie_price; // 영화 금액
	private String movie_code; //영화 코드
	private String moviePick_date;// 구매일자
	
	
	public int getBucket_code() {
		return bucket_code;
	}
	public void setBucket_code(int bucket_code) {
		this.bucket_code = bucket_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_img() {
		return movie_img;
	}
	public void setMovie_img(String movie_img) {
		this.movie_img = movie_img;
	}
	public int getMovie_price() {
		return movie_price;
	}
	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getMoviePick_date() {
		return moviePick_date;
	}
	public void setMoviePick_date(String moviePick_date) {
		this.moviePick_date = moviePick_date;
	}
	
	

}
