<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.ezen.DAO.MovieDAO" %>
<%@ page import="kr.co.ezen.VO.MovieVO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 검색_회원_화면처리 </title>
<style type="text/css">
	.movie	{
		float :left;
		width:30%;
		padding: 10px;
	}
</style>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:include page="../../main_top.jsp"></jsp:include>

	<!-- 	Top 상단화면 고정틀 첨부하기 -->
	<form action="movie_select_search_list.jsp" method="post">
		<select name="keyword"> <!-- 검색할 컬럼(value값) 지정-->
			<option value="movie_title" selected="selected">제 목 </option>
			<option value="director">감 독 </option>
			<option value="genre">장 르 </option>
			<option value="actor">출연진 </option>
		</select>
			<input type="text" name="searchWord" placeholder="검색어를 입력하세요">
			<input type="submit" value="검색">
	</form>	
</body>
</html>