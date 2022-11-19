<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.co.ezen.DAO.ReviewDAO" %>
<%@ page import="kr.co.ezen.VO.ReviewVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 등록 처리</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<%
		
		int review_star = Integer.parseInt(request.getParameter("rating")); 
		String review_content = request.getParameter("review_content");
		String id = (String) session.getAttribute("id"); 
		String movie_code = request.getParameter("movie_code");
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewVO rvo = new ReviewVO();
		
		rvo.setReview_star(review_star);
		rvo.setReview_content(review_content);
		rvo.setId(id);
		rvo.setMovie_code(movie_code);
		
		rdao.insertReview(rvo);
		
		
	%>
	    <script type="text/javascript">
				alert("리뷰가 작성되었습니다"); 
				location.href="movie_detail.jsp?movie_code=<%=movie_code %>"; 
			</script>
				
	
</body>
</html>