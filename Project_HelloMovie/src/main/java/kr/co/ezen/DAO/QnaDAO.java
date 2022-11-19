package kr.co.ezen.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import kr.co.ezen.VO.QnaVO;

public class QnaDAO {
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
	
	public void insertQna(QnaVO qvo) {
		
		try {
			conn = getConnection();
			
			String sql = "insert into qna values(QNA_SEQ.nextval,?,sysdate,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qvo.getId());
			pstmt.setString(2, qvo.getQna_title());
			pstmt.setString(3, qvo.getQna_content());
			pstmt.setString(4, null);
			pstmt.executeUpdate();
				
			conn.close();		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Vector<QnaVO> allQnaList(){
		
		Vector<QnaVO> v = new Vector<>();
		
		try { 
		conn = getConnection();
		
		String sql = "select * from qna order by qna_date ";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			QnaVO qvo = new QnaVO();
			
			qvo.setQna_code(rs.getInt(1));
			qvo.setId(rs.getString(2));
			qvo.setQna_date(rs.getDate(3));
			qvo.setQna_title(rs.getString(4));
			qvo.setQna_content(rs.getString(5));
			qvo.setQna_answer(rs.getString(6));
		
			v.add(qvo);
		}
			if(conn != null) {
				conn.close();
			}
		
	}catch(Exception e) {
		e.printStackTrace();
		System.out.println("모든 회원정보를 조회하는데 실패 하였습니다.");
	}
		return v;
	
	}
	
	public QnaVO oneSelectQna(int qna_code){
		QnaVO mvo = new QnaVO();
		
		try { 
			conn = getConnection();
			
			String sql = "select * from qna where qna_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_code);
			 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
							
				mvo.setQna_code(rs.getInt(1));
				mvo.setId(rs.getString(2));
				mvo.setQna_date(rs.getDate(3));
				mvo.setQna_title(rs.getString(4));
				mvo.setQna_content(rs.getString(5));
				mvo.setQna_answer(rs.getString(6));

			}
				if(conn != null) {
					conn.close();
				}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("모든 1:1 문의 정보를 조회하는데 실패 하였습니다.");
		}
			return mvo;		
	}
	
	public Vector<QnaVO> idQnaList(String id){
		
		Vector<QnaVO> v = new Vector<>();
		
		try { 
		conn = getConnection();
		
		String sql = "select * from qna where id = ? order by qna_date ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			QnaVO qvo = new QnaVO();
			
			qvo.setQna_code(rs.getInt(1));
			qvo.setId(rs.getString(2));
			qvo.setQna_date(rs.getDate(3));
			qvo.setQna_title(rs.getString(4));
			qvo.setQna_content(rs.getString(5));
			qvo.setQna_answer(rs.getString(6));
		
			v.add(qvo);
		}
			if(conn != null) {
				conn.close();
			}
		
	}catch(Exception e) {
		e.printStackTrace();
		System.out.println("한 사람의 문의정보를 조회하는데 실패 하였습니다.");
	}
		return v;
	
	}
	
	public QnaVO insertQnaAnswer(QnaVO qvo){
		
		try { 
			conn = getConnection();
			
			String sql = "update qna set qna_answer = ? where qna_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qvo.getQna_answer());
			pstmt.setInt(2, qvo.getQna_code());
			 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	
				qvo.setQna_answer(rs.getString(1));
			}
				if(conn != null) {
					conn.close();
				}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("답글 입력에 실패 하였습니다.");
		}
			return qvo;		
	}
}
