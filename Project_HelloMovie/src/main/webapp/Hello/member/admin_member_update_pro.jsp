<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "kr.co.ezen.DAO.MemberDAO" %>
<%@ page import = "kr.co.ezen.VO.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자가 회원의 회원등급 수정</title>
</head>
<body>

	<%
	String id = request.getParameter("id");
	String membership = request.getParameter("membership");
	
	MemberDAO mdao = new MemberDAO();
	mdao.changeMembership(id, membership);
	%>
	
	<script>
		alert("회원 등급 수정이 완료되었습니다. ");
		location.href="admin_member_list.jsp";
	</script>
	
</body>
</html>