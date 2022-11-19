package kr.co.ezen.VO;

public class BucketVO {

	private int bucket_code; //장바구니 번호
	private String id;  //구매아이디 등록(회원 아이디)
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