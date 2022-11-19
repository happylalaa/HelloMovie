package kr.co.ezen.VO;

public class MovieVO {

	private String movie_code;  //영화코드
	private String genre;  //장르
	private String director; //감독
	private String actor; //출연배우
	private int movie_age; //시청연령
	private String d_day; //개봉일
	private String summary; //줄거리
	private String movie_title; //영화제목
	private String movie_img; // 영화 이미지 
	private int movie_sold; // 영화 판매 개수
	private int movie_price;	 //영화가격
	
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public int getMovie_age() {
		return movie_age;
	}
	public void setMovie_age(int movie_age) {
		this.movie_age = movie_age;
	}
	public String getD_day() {
		return d_day;
	}
	public void setD_day(String d_day) {
		this.d_day = d_day;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
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
	public int getMovie_sold() {
		return movie_sold;
	}
	public void setMovie_sold(int movie_sold) {
		this.movie_sold = movie_sold;
	}
	public int getMovie_price() {
		return movie_price;
	}
	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}
}

//getInstance()
//+static getInstanstance() : MovieDAO
//
////1.영화 등록
//+ insertMovie
////2.영화 검색
//+ searchMovie
////3.영화 수정 
//+ updateMovie
////4.영화 전체(리스트) 조회
//+ selectAllMovieList
////5.영화 상세 조회(영화코드)
//+ selectMovieDetail
////6.인기 영화 조회  : 
//+ selectPopularityMovie
////7.최신 영화 조회 (메인페이지)
//+ selectMainPoster
////8.장르별 조회 (프로그램설계 추가??!!!)
//+ selectGenreMovie
////9.연령별 조회 (프로그램설계 추가??!!!)
//+ selectAgeMovie
////10.영화 삭제 
//+ deleteMovie