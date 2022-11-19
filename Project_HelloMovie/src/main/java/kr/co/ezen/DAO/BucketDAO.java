package kr.co.ezen.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.ezen.VO.BucketVO;
import kr.co.ezen.VO.BucketViewVO;

public class BucketDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private static BucketDAO instance = new BucketDAO();//싱글톤, 유일

	public static BucketDAO getInstance(){
		return instance;   //getInstance()메소드 호출로 instance를 담은 LogonDBBean 객체 반환
	}
	private BucketDAO() {} //생성자
	
	
	public void getConnection()  {
		  
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
	  }
	//장바구니에 등록하기
	public int insertBucket(String id, String movie_code) {
		
		int result = 0;
		//아이디가 없거나 비디오 코드가 없으면 종료(결과값 0 리턴)
		if(id == null || movie_code == null) {
			return result;
		}
		
		try {
			getConnection();
			String sql = "insert into bucket values(BUCKET_SEQ.nextval,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, movie_code);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;		
	}
	 
	//회원이 등록한 장바구니 목록 보기
	public ArrayList<BucketViewVO> selectBucket(String id){
		
		ArrayList<BucketViewVO> bucketList = new ArrayList<BucketViewVO>();
		
		try {
			getConnection();
//			String sql = "SELECT MEMBER.ID,MOVIE.MOVIE_CODE,BUCKET.MOVIEPICK_DATE"
//					+ " FROM BUCKET BUCKET"
//					+ " INNER JOIN MEMBER MEMBER CROSS JOIN MOVIE MOVIE"
//					+ " ON MEMBER.ID = BUCKET.ID AND MOVIE.MOVIE_CODE = BUCKET.MOVIE_CODE"
//					+ " WHERE MEMBER.ID=?";
			// BucketViewVO 생성 / 1.구매번호 / 2.영화 이미지 / 3.영화 제목 / 4.영화금액 / 5.구매일자 / 삭제 
			String sql = "SELECT BUCKET.BUCKET_CODE, MOVIE.MOVIE_IMG, MOVIE.MOVIE_TITLE, MOVIE.MOVIE_PRICE, BUCKET.MOVIEPICK_DATE"
					+ " FROM BUCKET BUCKET"
					+ " INNER JOIN MEMBER MEMBER CROSS JOIN MOVIE MOVIE"
					+ " ON MEMBER.ID = BUCKET.ID AND MOVIE.MOVIE_CODE = BUCKET.MOVIE_CODE"
					+ " WHERE MEMBER.ID=? ORDER BY BUCKET_CODE DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();		
			
			while(rs.next()) {
				
				BucketViewVO bvvo = new BucketViewVO();

				bvvo.setBucket_code(rs.getInt("BUCKET_CODE"));
				bvvo.setMovie_img(rs.getString("MOVIE_IMG"));
				bvvo.setMovie_title(rs.getString("MOVIE_TITLE"));
				bvvo.setMovie_price(rs.getInt("MOVIE_PRICE"));
				bvvo.setMoviePick_date(rs.getString("MOVIEPICK_DATE"));
				
				bucketList.add(bvvo);				
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}		
		return bucketList;
	}	
	//장바구니 삭제
		public void deleteBucket(int bucket_code)	{
			
			getConnection();
			String sql = "DELETE FROM BUCKET WHERE BUCKET_CODE=?";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bucket_code);
				
				pstmt.executeUpdate();
				
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				
			}catch(Exception e)	{
				e.printStackTrace();
				System.out.println("장바구니삭제 실패");
			}
			
		}
	}

