<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "kr.co.ezen.DAO.MemberDAO" %>
<%@ page import = "kr.co.ezen.VO.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>

	<jsp:useBean id="mvo" class="kr.co.ezen.VO.MemberVO">
		<jsp:setProperty name="mvo" property="*"/>
	</jsp:useBean>
	
	<%

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO mdao = new MemberDAO();
	int pass = mdao.checking(id, password);

	if(pass == 1){
		mdao.update(mvo);
	%>
		<script>
			alert("수정이 완료되었습니다.");
			location.href="member_detail.jsp?id=<%=id %>";
		</script>
	<%
			}else{
	%>
		<script>
			alert("패스워드가 틀립니다. 확인해 주세요.")
			history.go(-1);	
		</script>
<%
	}
%>	
</body>
</html>