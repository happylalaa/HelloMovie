package kr.co.ezen.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import kr.co.ezen.VO.NoticeVO;

public class NoticeDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//DB연결
	public void getConnection() {
		
		String url = 		"jdbc:oracle:thin:@localhost:1521:xe";
		String driver = 	"oracle.jdbc.driver.OracleDriver";
		String oracleId = 	"C##HELLO";
		String oraclePw = 	"MOVIE";
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, oracleId, oraclePw);
			
		} catch (Exception e)	{
			e.printStackTrace();
		}
		
	}//getConnection
	
	//공지사항 등록
	public void insertNotice(NoticeVO nvo)	{
		
		getConnection();
													// 0은 공지 1은 이벤트
		String sql = "INSERT INTO NOTICE(NOTICE_CODE, NOTICE_SORTING, NOTICE_DATE, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_EVENT)"
				+ " VALUES(NOTICE_SEQ.NEXTVAL, ?, SYSDATE, ?, ?, ?)";
		
		try	{
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(	1, nvo.getNotice_sorting());
			pstmt.setString(2, nvo.getNotice_title());
			pstmt.setString(3, nvo.getNotice_content());
			pstmt.setString(4, nvo.getNotice_event());
			
			pstmt.executeUpdate();
			
			if(con!=null) con.close();
			if(pstmt!=null) pstmt.close();
			
		}catch(Exception e)	{
			System.out.println("dddddd");
			e.printStackTrace();
		}
	}
	
	//공지사항 리스트
	public Vector<NoticeVO> selectNoticeList()	{
		
		getConnection();
		Vector<NoticeVO> v = new Vector<NoticeVO>();
		String sql = "SELECT * FROM NOTICE ORDER BY NOTICE_CODE DESC";
		
		try	{
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())	{
				
				NoticeVO nvo = new NoticeVO();
				
				nvo.setNotice_code(		rs.getInt(		"NOTICE_CODE"));
				nvo.setNotice_sorting(	rs.getInt(		"NOTICE_SORTING"));
				nvo.setNotice_date(		rs.getDate(		"NOTICE_DATE"));
				nvo.setNotice_title(	rs.getString(	"NOTICE_TITLE"));
				nvo.setNotice_content(	rs.getString(	"NOTICE_CONTENT"));
				nvo.setNotice_event(	rs.getString(	"NOTICE_EVENT"));
				
				v.add(nvo);
			}
			
			if(con!=null) con.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
			
		}catch(Exception e)	{
			e.printStackTrace();
		}
		
		return v;
	}
	
	//공지사항 상세보기
	public NoticeVO selectNoticeView(String notice_code)	{
		
		getConnection();
		NoticeVO nvo = new NoticeVO();
		String sql = "SELECT * FROM NOTICE WHERE NOTICE_CODE=?";
		
		try	{
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notice_code);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())	{
				
				nvo.setNotice_code(		rs.getInt(		"NOTICE_CODE"));
				nvo.setNotice_sorting(	rs.getInt(		"NOTICE_SORTING"));
				nvo.setNotice_date(		rs.getDate(		"NOTICE_DATE"));
				nvo.setNotice_title(	rs.getString(	"NOTICE_TITLE"));
				nvo.setNotice_content(	rs.getString(	"NOTICE_CONTENT"));
				nvo.setNotice_event(	rs.getString(	"NOTICE_EVENT"));
				
			}
			
			if(con!=null) con.close();
			if(pstmt!=null)	pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return nvo;
		
	}
	
	//공지사항 수정
	public void updateNotice(NoticeVO nvo)	{
		
		getConnection();
		String sql = "UPDATE NOTICE "
				+ "SET NOTICE_SORTING=?, NOTICE_DATE=SYSDATE, NOTICE_TITLE=?, NOTICE_CONTENT=?, NOTICE_EVENT=? "
				+ "WHERE NOTICE_CODE=?";
		
		String content = nvo.getNotice_content();
		String event = nvo.getNotice_event();
		
		if(nvo.getNotice_content() == null)	{
			content = "　";
		}
		
		if(nvo.getNotice_event() == null)	{
			event = "　";
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(	1, 	nvo.getNotice_sorting());
			pstmt.setString(2, 	nvo.getNotice_title());
			pstmt.setString(3, 	content);
			pstmt.setString(4, 	event);
			pstmt.setInt(	5, 	nvo.getNotice_code());
			
			pstmt.executeUpdate();
			
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			
		}catch(Exception e)	{
			e.printStackTrace();
		}
		
	}
	
	//공지사항 삭제
	public void deleteNotice(int notice_code)	{
		
		getConnection();
		String sql = "DELETE FROM NOTICE WHERE NOTICE_CODE=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, notice_code);
			
			pstmt.executeUpdate();
			
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			
		}catch(Exception e)	{
			e.printStackTrace();
		}
		
	}
}
