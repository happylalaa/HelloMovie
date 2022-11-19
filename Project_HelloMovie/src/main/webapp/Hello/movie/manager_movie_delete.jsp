<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.ezen.DAO.MovieDAO" %>
<%@ page import="kr.co.ezen.VO.MovieVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_영화정보 삭제</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	
<%
	String movie_code = request.getParameter("movie_code");	
	MovieDAO mdao = MovieDAO.getInstance();
	mdao.deleteMovie(movie_code);
%>

<script type="text/javascript">
	alart("삭제되었습니다.");
	location.href="manager_movie_select.jsp";
</script>
</body>
</html>