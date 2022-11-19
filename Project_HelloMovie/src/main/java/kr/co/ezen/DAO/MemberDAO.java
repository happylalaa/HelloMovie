package kr.co.ezen.DAO;

import java.sql.*;
import java.util.Vector;

import kr.co.ezen.VO.MemberVO;

public class MemberDAO{
	
	//DB Connection
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public static MemberDAO getInstance()	{
		return new MemberDAO();
	}
	
	public void getConnection(){
		
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
	}
	
	//전체 회원 리스트 조회
	public Vector<MemberVO> getList() {

		Vector<MemberVO> list = new Vector<>();
		getConnection();
		
		try {

			String sql = "SELECT * FROM MEMBER ORDER BY MEMBER_CODE DESC";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberVO mvo = new MemberVO();
				
				mvo.setMember_code(		rs.getInt(		"MEMBER_CODE"));
				mvo.setId(				rs.getString(	"ID"));
				mvo.setPwd(				rs.getString(	"PWD"));
				mvo.setName(			rs.getString(	"NAME"));
				mvo.setEmail(			rs.getString(	"EMAIL"));
				mvo.setContact(			rs.getString(	"CONTACT")); 
				mvo.setBirth(			rs.getString(	"BIRTH"));
				mvo.setMembership(		rs.getString(	"MEMBERSHIP"));
				mvo.setIdentify(		rs.getInt(		"IDENTIFY"));
				mvo.setRegdate(			rs.getString(	"REGDATE"));
				mvo.setMember_delete(	rs.getString(	"MEMBER_DELETE"));

				list.add(mvo);
				
			} 
			
			if(conn != null)	conn.close(); 
			if(pstmt != null)	pstmt.close();
			
		} catch(Exception e) {
				e.printStackTrace();
		}
		
		return list;
	}
	
	//내 정보 조회
	public MemberVO getSelect(String id) {

		MemberVO mvo = new MemberVO();
		getConnection();
		String sql = "SELECT * FROM MEMBER WHERE ID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
							
				mvo.setMember_code(rs.getInt(	"MEMBER_CODE"));
				mvo.setId(rs.getString(			"ID"));
				mvo.setPwd(rs.getString(		"PWD"));
				mvo.setName(rs.getString(		"NAME"));
				mvo.setEmail(rs.getString(		"EMAIL"));
				mvo.setContact(rs.getString(	"CONTACT")); 
				mvo.setBirth(rs.getString(		"BIRTH"));
				mvo.setMembership(rs.getString(	"MEMBERSHIP"));
				mvo.setIdentify(rs.getInt(		"IDENTIFY"));
				mvo.setRegdate(rs.getString(	"REGDATE"));

			}
			
			if(conn != null)	conn.close(); 
			if(pstmt != null)	pstmt.close();	
			
		} catch(Exception e) {
			e.printStackTrace();
	}
	return mvo;	
	}

	//회원가입
	public void insert(MemberVO mvo) {

		getConnection();
		String sql = "INSERT INTO MEMBER"
				+ "(MEMBERSHIP, MEMBER_CODE, ID, PWD, NAME, EMAIL, CONTACT, BIRTH, REGDATE) "
				+ "VALUES('U', MEMBER_SEQ.NEXTVAL,?,?,?,?,?,?,SYSDATE)";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mvo.getId());
			pstmt.setString(2, mvo.getPwd());
			pstmt.setString(3, mvo.getName());
			pstmt.setString(4, mvo.getEmail());
			pstmt.setString(5, mvo.getContact());
			pstmt.setString(6, mvo.getBirth());
	
			pstmt.executeUpdate();
				
			if(conn != null)	conn.close(); 
			if(pstmt != null)	pstmt.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 내 정보 수정
	public void update(MemberVO mvo) {

		getConnection();
		String sql = "UPDATE MEMBER SET NAME = ?, CONTACT = ?, EMAIL = ? "
				+ "WHERE ID = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mvo.getName());
			pstmt.setString(2, mvo.getContact()); 
			pstmt.setString(3, mvo.getEmail()); 
			pstmt.setString(4, mvo.getId()); 
			
			pstmt.executeUpdate();
			
			if(conn != null)	conn.close(); 
			if(pstmt != null)	pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 관리자가 회원 삭제
	public void delete(String id) {

		getConnection();
		String sql = "DELETE FROM MEMBER WHERE ID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, id); 
			pstmt.executeUpdate();
			
			if(conn != null)	conn.close(); 
			if(pstmt != null)	pstmt.close();
			
		}catch(Exception e) { }
		
	}
	
	//아이디, 비밀번호 일치여부 체크
	public int checking(String id, String pwd){
		
		String pw = "";
		getConnection();
		String sql = "SELECT PWD FROM MEMBER WHERE ID = ?";
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);  
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString("PWD");
			}
			//성공:1, 실패:0
			if(pwd.equals(pw))	{
				result = 1;
			}
			
			if(conn != null)	conn.close(); 
			if(pstmt != null)	pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		return result;
	}
	
	//회원이 관리자에게 회원탈퇴 신청
	public void request_delete(String id) {

		getConnection();
		String sql = "UPDATE MEMBER SET MEMBER_DELETE = ? "
				+ "WHERE ID = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "Y");
			pstmt.setString(2, id); 
			
			pstmt.executeUpdate();
			
			if(conn != null)	conn.close(); 
			if(pstmt != null)	pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 관리자가 회원 등급 수정
	public void changeMembership(String id, String membership) {

		getConnection();
		String sql = "UPDATE MEMBER SET MEMBERSHIP = ? "
				+ "WHERE ID = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, membership);
			pstmt.setString(2, id); 
			
			pstmt.executeUpdate();
			
			if(conn != null)	conn.close(); 
			if(pstmt != null)	pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	 // 관리자 인증 managerCheck(맴버쉽 : M (관리자) , U : 패밀리(회원))
	public int managerCheck(String id) {
		
		getConnection();
		String Sql = "SELECT MEMBERSHIP FROM MEMBER WHERE ID = ?";	//seojeong : M
		int result = 0;
		
		try{
			pstmt = conn.prepareStatement(Sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			String membership = "";
			if(rs.next())	{
				membership = rs.getString("MEMBERSHIP");
			}
			
			if(membership.equals("M"))	result = 1;
			
			conn.close();
			pstmt.close();
			rs.close();
			
		}catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("관리자 인증 실패");
		}
		
		return result;
		} //close managerCheck()

}
