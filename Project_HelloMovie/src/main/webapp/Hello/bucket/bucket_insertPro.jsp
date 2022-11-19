<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.BucketDAO" %>
<%@ page import="kr.co.ezen.VO.BucketViewVO" %>

<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 찜한 영화 등록 처리</title>
</head>
<body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String movie_code = request.getParameter("movie_code");
	
	BucketDAO bdao = BucketDAO.getInstance();
	bdao.insertBucket(id, movie_code);
%>
	<script>
		alert("장바구니에 추가되었습니다. ");
		location.href="../movie/movie_detail.jsp?movie_code=<%=movie_code %>"
	</script>
    
</body>
</html>