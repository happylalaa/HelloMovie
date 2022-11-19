<%@page import="java.net.CacheResponse"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.MemberDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자가 회원정보 DB에서 삭제</title>
</head>
<body>

	<%
		String id = request.getParameter("id");

		MemberDAO mdao = new MemberDAO();
		mdao.delete(id);
	%>
			<script type="text/javascript">
				alert("회원이 삭제되었습니다."); 
				location.href="admin_member_list.jsp"; 
			</script>

</body>
</html>