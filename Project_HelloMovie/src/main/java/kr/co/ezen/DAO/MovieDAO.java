package kr.co.ezen.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import kr.co.ezen.VO.MemberVO;
import kr.co.ezen.VO.MovieVO;

public class MovieDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;

	public void getConnection() {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String Driver = "oracle.jdbc.driver.OracleDriver";
		String id = "C##HELLO";
		String pwd = "MOVIE";
		
		try	{
			
			Class.forName(Driver);
			conn = DriverManager.getConnection(url, id, pwd);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}// close getConnection()
	
	private static MovieDAO instance = new MovieDAO();

	public static MovieDAO getInstance(){
		return instance;   
	}
	
	private MovieDAO() {} //생성자

	 // 1.영화등록 - 관리자
	public void insertMovie(MovieVO mvvo) {
		getConnection();
		String sql = "INSERT INTO MOVIE "
				+ "(MOVIE_IMG, MOVIE_CODE,MOVIE_TITLE,DIRECTOR,D_DAY,GENRE,MOVIE_AGE,"
				+ "ACTOR,MOVIE_SOLD,SUMMARY)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?)"; 
		
		try {
			
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,	mvvo.getMovie_img());
				pstmt.setString(2,	mvvo.getMovie_code());
				pstmt.setString(3,	mvvo.getMovie_title());
				pstmt.setString(4,	mvvo.getDirector());
				pstmt.setString(5,	mvvo.getD_day());
				pstmt.setString(6,	mvvo.getGenre());
				pstmt.setInt(	7,	mvvo.getMovie_age());
				pstmt.setString(8,	mvvo.getActor());
				//pstmt.setInt(	9,	mvvo.getMovie_price());
				pstmt.setInt(	9,	mvvo.getMovie_sold());	
				pstmt.setString(10,	mvvo.getSummary());
				
				pstmt.executeUpdate();

			conn.close();
			pstmt.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	} // close insertMovie()
	
	 // 2. 영화수정 - 관리자
	public void updateMovie(MovieVO mvvo){
		getConnection();
		String sql = "UPDATE MOVIE SET "
				+ "MOVIE_IMG=?, MOVIE_TITLE=?, DIRECTOR=?, D_DAY=?,"
				+ "GENRE=?,MOVIE_AGE=?,ACTOR=?,MOVIE_SOLD=?,SUMMARY=? "
				+ "WHERE MOVIE_CODE=?";
		
		try {
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,	mvvo.getMovie_img());
				pstmt.setString(2,	mvvo.getMovie_title());
				pstmt.setString(3,	mvvo.getDirector());
				pstmt.setString(4,	mvvo.getD_day());
				pstmt.setString(5,	mvvo.getGenre());
				pstmt.setInt(	6,	mvvo.getMovie_age());
				pstmt.setString(7,	mvvo.getActor());
				pstmt.setInt(	8,	mvvo.getMovie_sold());	
				pstmt.setString(9,	mvvo.getSummary());
				pstmt.setString(10,	mvvo.getMovie_code());
				pstmt.executeUpdate();
				
			conn.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("관리자 영화 수정 실패");
		}
	} //close updateMovie()
	
	 // 3. 영화 전체(리스트) : 관리자 -- Vector
	public Vector<MovieVO> selectAllMovieList(){
		
		Vector<MovieVO> vo = new Vector<MovieVO>();
		MovieVO mvvo = null;
		getConnection();
		String Sql = "SELECT * FROM MOVIE ORDER BY D_DAY DESC";
		
		try {
			
			pstmt = conn.prepareStatement(Sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				mvvo = new MovieVO();
				mvvo.setMovie_img(	rs.getString(	"MOVIE_IMG"));
				mvvo.setMovie_code(	rs.getString(	"MOVIE_CODE"));
				mvvo.setMovie_title(rs.getString(	"MOVIE_TITLE"));
				mvvo.setDirector(	rs.getString(	"DIRECTOR"));
				mvvo.setD_day(		rs.getString(	"D_DAY"));
				mvvo.setGenre(		rs.getString(	"GENRE"));
				mvvo.setMovie_age(	rs.getInt(		"MOVIE_AGE")); 
				mvvo.setActor(		rs.getString(	"ACTOR"));
				//mvvo.setMovie_price(rs.getInt(		"MOVIE_PRICE"));
				mvvo.setMovie_sold(	rs.getInt(		"MOVIE_SOLD"));
				mvvo.setSummary(	rs.getString(	"SUMMARY"));
				
				vo.add(mvvo);
				
			}
			conn.close();
			pstmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("관리자 영화 전체 조회 실패");
		} 
		return vo;
	}// close selectAllMovieList()
	
	// 4. 영화 상세 조회 - 관리자, 회원 // 
	public MovieVO selectMovieDetail (String movie_code) {
		
		MovieVO mvvo = new MovieVO();  
		Vector<MovieVO> vo = new Vector<MovieVO>();
		getConnection();
		String Sql = "SELECT * FROM MOVIE WHERE MOVIE_CODE=?";
		
		try {
			
			pstmt = conn.prepareStatement(Sql);
			pstmt.setString(1, movie_code);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mvvo = new MovieVO();
				mvvo.setMovie_img(	rs.getString(	"MOVIE_IMG"));
				mvvo.setMovie_code(	rs.getString(	"MOVIE_CODE"));
				mvvo.setMovie_title(rs.getString(	"MOVIE_TITLE"));
				mvvo.setDirector(	rs.getString(	"DIRECTOR"));
				mvvo.setD_day(		rs.getString(	"D_DAY"));
				mvvo.setGenre(		rs.getString(	"GENRE"));
				mvvo.setMovie_age(	rs.getInt(		"MOVIE_AGE")); 
				mvvo.setActor(		rs.getString(	"ACTOR"));
				//mvvo.setMovie_price(rs.getInt(		"MOVIE_PRICE"));
				mvvo.setMovie_sold(	rs.getInt(		"MOVIE_SOLD"));
				mvvo.setSummary(	rs.getString(	"SUMMARY"));
				vo.add(mvvo);
			}
			
			conn.close();
			pstmt.close();
			rs.close();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("관리자, 회원 영화 상세 조회 실패");
		}
		return mvvo;
	} // close selectMovieDetail()
	
	// 5. 영화 삭제 deleteMovie -관리자
	public void deleteMovie(String movie_code) {
		
		getConnection();
		String sql = "DELETE FROM MOVIE WHERE MOVIE_CODE=?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,movie_code);
			
			pstmt.executeUpdate();
			
			conn.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}// close deleteMovie()

	 // MOVIE_CODE, MOVIE_SOLD MOVIE_CATEGORY 제외
	 // SELECT MOVIE_IMG,MOVIE_TITLE,DIRECTOR,D_DAY,GENRE,MOVIE_AGE,ACTOR,MOVIE_PRICE,SUMMARY FROM MOVIE
	 // 6.영화 조회 : 회원화면 조회
	public Vector <MovieVO> getMovieSelect(){
		
		Vector<MovieVO> vo = new Vector<MovieVO>();
		MovieVO mvvo = null;
		getConnection();
		String Sql = "SELECT MOVIE_IMG,MOVIE_TITLE,DIRECTOR,D_DAY,"
				+ "GENRE,MOVIE_AGE,ACTOR,MOVIE_PRICE,SUMMARY FROM MOVIE ORDER BY MOVIE_CODE";
		
		try {
			
			pstmt = conn.prepareStatement(Sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				mvvo = new MovieVO();
				
				mvvo.setMovie_img(	rs.getString(	"MOVIE_IMG"));
				mvvo.setMovie_code(	rs.getString(	"MOVIE_CODE"));
				mvvo.setMovie_title(rs.getString(	"MOVIE_TITLE"));
				mvvo.setDirector(	rs.getString(	"DIRECTOR"));
				mvvo.setD_day(		rs.getString(	"D_DAY"));
				mvvo.setGenre(		rs.getString(	"GENRE"));
				mvvo.setMovie_age(	rs.getInt(		"MOVIE_AGE")); 
				mvvo.setActor(		rs.getString(	"ACTOR"));
				//mvvo.setMovie_price(rs.getInt(		"MOVIE_PRICE"));
				mvvo.setMovie_sold(	rs.getInt(		"MOVIE_SOLD"));
				mvvo.setSummary(	rs.getString(	"SUMMARY"));
				
				vo.add(mvvo);
			}
			
			conn.close();
			pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return vo;
	}
	 // 7-1. 인기 또는 최신 top3 영화 조회
	 // 최신영화 조회버튼 클릭시 개봉일순 영화목록조회 1. 로그인 해야 조회 가능,2.로그인 하시오 로그인 페이지 이동!!
	public Vector<MovieVO> selectMainPoster(String keyword){
		
		Vector<MovieVO> v = new Vector<MovieVO>();
		getConnection();
		String Sql = "";
		
		switch (keyword) {
		
		case "popular" : 
			Sql = "SELECT * FROM MOVIE ORDER BY MOVIE_SOLD DESC";
			break;
			
		case "recent" : 
			Sql = "SELECT * FROM MOVIE ORDER BY D_DAY DESC";
			break;
		}
		
		try {
			
			pstmt = conn.prepareStatement(Sql);
			rs = pstmt.executeQuery();
			
			int count = 0;
			
			while(rs.next()) {
				
				MovieVO mvvo = new MovieVO();
				
				mvvo.setMovie_img(	rs.getString(	"MOVIE_IMG"));
				mvvo.setMovie_code(	rs.getString(	"MOVIE_CODE"));
				mvvo.setMovie_title(rs.getString(	"MOVIE_TITLE"));
				mvvo.setDirector(	rs.getString(	"DIRECTOR"));
				mvvo.setD_day(		rs.getString(	"D_DAY"));
				mvvo.setGenre(		rs.getString(	"GENRE"));
				mvvo.setMovie_age(	rs.getInt(		"MOVIE_AGE")); 
				mvvo.setActor(		rs.getString(	"ACTOR"));
				//mvvo.setMovie_price(rs.getInt(		"MOVIE_PRICE"));
				mvvo.setMovie_sold(	rs.getInt(		"MOVIE_SOLD"));
				mvvo.setSummary(	rs.getString(	"SUMMARY"));
				
				v.add(mvvo);
				
				count++;
				
				if(count>=3)break;
			}
			
			conn.close();
			pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return v;
		
	} //close selectMainPoster()
	
	// 7-2. 최신 영화 조회 - 회원
	 // 최신영화 조회버튼 클릭시 개봉일순 영화목록조회 1. 로그인 해야 조회 가능,2.로그인 하시오 로그인 페이지 이동!!
	public Vector<MovieVO> selectMainPoster(){
		
		Vector<MovieVO> v = new Vector<MovieVO>();
		getConnection();
		String Sql = "SELECT * FROM MOVIE ORDER BY D_DAY DESC";
		
		try {
			
			pstmt = conn.prepareStatement(Sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MovieVO mvvo = new MovieVO();
				
				mvvo.setMovie_img(	rs.getString(	"MOVIE_IMG"));
				mvvo.setMovie_code(	rs.getString(	"MOVIE_CODE"));
				mvvo.setMovie_title(rs.getString(	"MOVIE_TITLE"));
				mvvo.setDirector(	rs.getString(	"DIRECTOR"));
				mvvo.setD_day(		rs.getString(	"D_DAY"));
				mvvo.setGenre(		rs.getString(	"GENRE"));
				mvvo.setMovie_age(	rs.getInt(		"MOVIE_AGE")); 
				mvvo.setActor(		rs.getString(	"ACTOR"));
				mvvo.setMovie_price(rs.getInt(		"MOVIE_PRICE"));
				mvvo.setMovie_sold(	rs.getInt(		"MOVIE_SOLD"));
				mvvo.setSummary(	rs.getString(	"SUMMARY"));
				
				v.add(mvvo);
				
			}
			
			conn.close();
			pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return v;
		
		} //close selectMainPoster()

	// 8. 인기 영화 조회 selectPopularityMovie - 회원
	// 인기영화 조회버튼 클릭시 판매량순 영화목록조회 1. 로그인 해야 조회 가능,2.로그인 하시오 로그인 페이지 이동!!
	public Vector<MovieVO> selectPopularityMovie(){
		
		Vector<MovieVO> v = new Vector<MovieVO>();
		getConnection();
		String sql = "SELECT * FROM MOVIE ORDER BY MOVIE_SOLD DESC";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MovieVO mvvo = new MovieVO();
				
				mvvo.setMovie_img(	rs.getString(	"MOVIE_IMG"));
				mvvo.setMovie_code(	rs.getString(	"MOVIE_CODE"));
				mvvo.setMovie_title(rs.getString(	"MOVIE_TITLE"));
				mvvo.setDirector(	rs.getString(	"DIRECTOR"));
				mvvo.setD_day(		rs.getString(	"D_DAY"));
				mvvo.setGenre(		rs.getString(	"GENRE"));
				mvvo.setMovie_age(	rs.getInt(		"MOVIE_AGE")); 
				mvvo.setActor(		rs.getString(	"ACTOR"));
				mvvo.setMovie_price(rs.getInt(		"MOVIE_PRICE"));
				mvvo.setMovie_sold(	rs.getInt(		"MOVIE_SOLD"));
				mvvo.setSummary(	rs.getString(	"SUMMARY"));
				
				v.add(mvvo);
			}
			
			conn.close();
			pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 인기 영화 조회 실패");
		}
		
		return v;
		
	} //close 인기 영화 조회 

	 // 9. 장르별 조회 selectGenreMovie - 회원
	 // 장르별 조회버튼 클릭시 장르별순 영화목록조회 1. 로그인 해야 조회 가능,2.로그인 하시오 로그인 페이지 이동!!
	 // value 값 - action : 액션, horror : 공포, romantic : 로맨스, animation : 애니메이션, sf : SF
	public Vector<MovieVO> selectGenreMovie(String genre){
		
		Vector<MovieVO> v = new Vector<MovieVO>();
		getConnection();
			
			String Sql = "SELECT * FROM MOVIE WHERE GENRE=? ORDER BY D_DAY DESC";
			
			try {
				pstmt = conn.prepareStatement(Sql);
				pstmt.setString(1, genre);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					MovieVO mvvo = new MovieVO();
					
					mvvo.setMovie_img(	rs.getString(	"MOVIE_IMG"));
					mvvo.setMovie_code(	rs.getString(	"MOVIE_CODE"));
					mvvo.setMovie_title(rs.getString(	"MOVIE_TITLE"));
					mvvo.setDirector(	rs.getString(	"DIRECTOR"));
					mvvo.setD_day(		rs.getString(	"D_DAY"));
					mvvo.setGenre(		rs.getString(	"GENRE"));
					mvvo.setMovie_age(	rs.getInt(		"MOVIE_AGE")); 
					mvvo.setActor(		rs.getString(	"ACTOR"));
					mvvo.setMovie_price(rs.getInt(		"MOVIE_PRICE"));
					mvvo.setMovie_sold(	rs.getInt(		"MOVIE_SOLD"));
					mvvo.setSummary(	rs.getString(	"SUMMARY"));
					v.add(mvvo);
					
				}
				
				conn.close();
				pstmt.close();
				rs.close();
			
			}catch(Exception e) {
				e.printStackTrace();
		}
		return v;
		
	} //close selectGenreMovie()
	
	 // 10. 연령별 조회 selectAgeMovie (19세이하) - 회원
	 // 연령별 조회버튼 클릭시 연령순 영화목록조회 1. 로그인 해야 조회 가능,2.로그인 하시오 로그인 페이지 이동!!
	 // value 값 - 1 : 전체 , 2 : 청소년 관람불가
	public Vector<MovieVO> selectAgeMovie(int movie_age){
		
		Vector<MovieVO> v = new Vector<MovieVO>();
		MovieVO mvvo = null;
		getConnection();
		String Sql = "SELECT * FROM MOVIE WHERE MOVIE_AGE = ?";
		
		try {
			
			pstmt = conn.prepareStatement(Sql);
			pstmt.setInt(1, movie_age);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				mvvo = new MovieVO();
				
				mvvo.setMovie_img(	rs.getString(	"MOVIE_IMG"));
				mvvo.setMovie_code(	rs.getString(	"MOVIE_CODE"));
				mvvo.setMovie_title(rs.getString(	"MOVIE_TITLE"));
				mvvo.setDirector(	rs.getString(	"DIRECTOR"));
				mvvo.setD_day(		rs.getString(	"D_DAY"));
				mvvo.setGenre(		rs.getString(	"GENRE"));
				mvvo.setMovie_age(	rs.getInt(		"MOVIE_AGE")); 
				mvvo.setActor(		rs.getString(	"ACTOR"));
				mvvo.setMovie_price(rs.getInt(		"MOVIE_PRICE"));
				mvvo.setMovie_sold(	rs.getInt(		"MOVIE_SOLD"));
				mvvo.setSummary(	rs.getString(	"SUMMARY"));
				
				v.add(mvvo);
			}
			
			conn.close();
			pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	} //close selectAgeMovie()
	
	 // 11. 영화검색 searchMovie - 회원 
	public Vector<MovieVO> searchMovie(String keyword, String searchWord) {
		
		Vector<MovieVO> v = new Vector<MovieVO>();
		MovieVO mvvo = null;
		getConnection();
		
		try {
			String Sql = "";
			
			switch (keyword) {
			
			case "movie_title" : 
				Sql = "SELECT * FROM MOVIE WHERE MOVIE_TITLE LIKE ?";
				break;
				
			case "director" : 
				Sql = "SELECT * FROM MOVIE WHERE DIRECTOR LIKE ?";
				break;
			
			case "actor" : 
				Sql = "SELECT * FROM MOVIE WHERE REPLACE (ACTOR,'','') LIKE ?";
				break;	
			}
			
			pstmt = conn.prepareStatement(Sql);
			pstmt.setString(1,"%"+searchWord+"%"); 
			// Where ? like : 변경 where 컬럼명 like ?
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				mvvo = new MovieVO();
				
				mvvo.setMovie_img(	rs.getString(	"MOVIE_IMG"));
				mvvo.setMovie_code(	rs.getString(	"MOVIE_CODE"));
				mvvo.setMovie_title(rs.getString(	"MOVIE_TITLE"));
				mvvo.setDirector(	rs.getString(	"DIRECTOR"));
				mvvo.setD_day(		rs.getString(	"D_DAY"));
				mvvo.setGenre(		rs.getString(	"GENRE"));
				mvvo.setMovie_age(	rs.getInt(		"MOVIE_AGE")); 
				mvvo.setActor(		rs.getString(	"ACTOR"));
				mvvo.setMovie_price(rs.getInt(		"MOVIE_PRICE"));
				mvvo.setMovie_sold(	rs.getInt(		"MOVIE_SOLD"));
				mvvo.setSummary(	rs.getString(	"SUMMARY"));
				
				v.add(mvvo);
			}
			
			conn.close();
			pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return v;
		
	} //close searchMovie()
 
	}// close MovieDAO()
