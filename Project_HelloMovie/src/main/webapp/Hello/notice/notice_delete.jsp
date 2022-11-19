<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.NoticeDAO" %>
<%@ page import="kr.co.ezen.VO.NoticeVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제</title>
</head>
<body>

<%
	int notice_code = Integer.parseInt(request.getParameter("notice_code"));
	NoticeDAO ndao = new NoticeDAO();
	
	ndao.deleteNotice(notice_code);
%>

<script>
	alert("삭제되었습니다.");
	location.href="../../notice.jsp";
</script>

</body>
</html>