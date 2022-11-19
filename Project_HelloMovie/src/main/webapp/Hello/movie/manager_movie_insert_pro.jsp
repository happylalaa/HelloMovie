<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.ezen.DAO.MovieDAO" %>
<%@ page import="kr.co.ezen.VO.MovieVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자_영화등록_처리화면</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="mvvo" class="kr.co.ezen.VO.MovieVO">
		<jsp:setProperty name="mvvo" property="*"/>
	</jsp:useBean>
	<!-- 	Top 상단화면 고정틀 첨부하기 -->
<%
	 MovieDAO mdao = MovieDAO.getInstance();
	 mdao.insertMovie(mvvo); 
	 String movie_code = request.getParameter("movie_code");  
	 
	 if(mvvo.getMovie_code()==null){
%>
		<script type="text/javascript">
			alert("다시 입력 해주세요.");
			history.back();
		</script>
 	<%}else{%>
		<script type="text/javascript">
			alert("영화 등록완료 되었습니다.");
			location.href="manager_movie_select.jsp";
		</script>
 	<%}%>
</body>
</html>