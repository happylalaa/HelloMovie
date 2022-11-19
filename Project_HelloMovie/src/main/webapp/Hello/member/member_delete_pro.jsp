<%@page import="java.net.CacheResponse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.MemberDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원이 관리자에게 회원탈퇴 신청 처리</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String pwd = request.getParameter("pwd");
		
		MemberDAO mdao = new MemberDAO();
		
		//인증성공= 1, 실패= 0
		int result = mdao.checking(id, pwd);
		
		if(result == 1){
			mdao.request_delete(id);
	%>
			<script type="text/javascript">
				alert("관리자에게 탈퇴 요청 되었습니다."); 
				location.href="../../main.jsp"; 
			</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert("아이디 또는 비밀번호를 확인해주세요."); 
			history.go(-1); 
		</script>
	<%
		}
	%>

</body>
</html>