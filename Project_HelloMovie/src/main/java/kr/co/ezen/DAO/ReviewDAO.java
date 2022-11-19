package kr.co.ezen.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import kr.co.ezen.VO.QnaVO;
import kr.co.ezen.VO.ReviewVO;

public class ReviewDAO {
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String Driver = "oracle.jdbc.driver.OracleDriver";
		String id = "C##HELLO";
		String pass = "MOVIE";
		
		try {
			Class.forName(Driver);
			conn = DriverManager.getConnection(url,id,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	//리뷰 작성
	public void insertReview(ReviewVO rvo) {
		
		try {
			conn = getConnection();
			
			String sql = "insert into review values(REVIEW_SEQ.nextval,?,?,sysdate,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rvo.getMovie_code());
			pstmt.setString(2, rvo.getId());
			pstmt.setInt(3, rvo.getReview_star());
			pstmt.setString(4, rvo.getReview_content());
			
			pstmt.executeUpdate();
				
			conn.close();		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//영화 상세보기 화면에서 영화 리뷰 불러오기
	public Vector<ReviewVO> allReviewList(String movie_code){
		
		Vector<ReviewVO> v = new Vector<>();
		
		try { 
		conn = getConnection();
		
		String sql = "select * from review where movie_code = ? order by review_date ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, movie_code);
		
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReviewVO rvo = new ReviewVO();
			
			rvo.setReview_code(		rs.getInt( 		"REVIEW_CODE"));
			rvo.setMovie_code(		rs.getString(	"MOVIE_CODE"));
			rvo.setId(				rs.getString(	"ID"));
			rvo.setReview_date(		rs.getDate(		"REVIEW_DATE"));
			rvo.setReview_star(		rs.getInt(		"REVIEW_STAR"));
			rvo.setReview_content(	rs.getString(	"REVIEW_CONTENT"));
		
			v.add(rvo);
		}
		
		if(conn != null) {
			conn.close();
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		return v;
	
	}
	
	//내가 작성한 리뷰
	public Vector<ReviewVO> myReviewList(String id){
		
		Vector<ReviewVO> v = new Vector<>();
		
		try { 
		conn = getConnection();
		
		String sql = "SELECT * FROM REVIEW WHERE ID = ? ORDER BY REVIEW_DATE DESC";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			ReviewVO rvo = new ReviewVO();
			
			rvo.setReview_code(		rs.getInt( 		"REVIEW_CODE"));
			rvo.setMovie_code(		rs.getString(	"MOVIE_CODE"));
			rvo.setId(				rs.getString(	"ID"));
			rvo.setReview_date(		rs.getDate(		"REVIEW_DATE"));
			rvo.setReview_star(		rs.getInt(		"REVIEW_STAR"));
			rvo.setReview_content(	rs.getString(	"REVIEW_CONTENT"));
		
			v.add(rvo);
		}
		
		if(conn != null) {
			conn.close();
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		return v;
	
		}
	
}