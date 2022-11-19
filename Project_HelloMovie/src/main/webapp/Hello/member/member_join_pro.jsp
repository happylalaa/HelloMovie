<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.ezen.VO.MemberVO" %>
<%@page import="kr.co.ezen.DAO.MemberDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>

	<jsp:useBean id="mvo" class="kr.co.ezen.VO.MemberVO">
		<jsp:setProperty name="mvo" property="*"/>
	</jsp:useBean>

<%
	String password = request.getParameter("pwd");
	String password2 = request.getParameter("pwd2");

	MemberDAO mdao = new MemberDAO();
	
	if(password.equals(password2))	{
		
		mdao.insert(mvo);
%>
		<script>
			alert("회원등록이 완료되었습니다. ");
			location.href="../../main.jsp";
		</script>
<%		
	} else	{
%>
		<script>
			alert("비밀번호가 일치하지 않습니다. 다시 작성해주세요.");
			history.go(-1);
		</script>
<%
	}
%>

</body>
</html>