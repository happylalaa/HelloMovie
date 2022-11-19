<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="kr.co.ezen.DAO.BucketDAO" %>
<%@ page import="kr.co.ezen.DAO.MemberDAO" %>
<%@ page import="kr.co.ezen.DAO.MovieDAO" %>
<%@ page import="kr.co.ezen.VO.BucketVO" %>
<%@ page import="kr.co.ezen.VO.BucketViewVO" %>
<%@ page import="kr.co.ezen.VO.MemberVO" %>
<%@ page import="kr.co.ezen.VO.MovieVO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>내가 찜한 영화 조회</title>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="../../plugins/themefisher-font/style.css">
	<link rel="stylesheet" href="../../plugins/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../plugins/animate-css/animate.css">
	<link rel="stylesheet" href="../../plugins/magnific-popup/dist/magnific-popup.css">
	<link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick-theme.css">
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="../../css/style.css">
  	<link rel="stylesheet" href="../../css/notice.css">
  
</head>

<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String movie_code = request.getParameter("movie_code");
	
	MemberDAO mdao = MemberDAO.getInstance();
	MemberVO mvo = mdao.getSelect(id);
	
	MovieDAO mdao2 = MovieDAO.getInstance();
	MovieVO mvo2 = new MovieVO();
	
	BucketDAO bdao = BucketDAO.getInstance();
	BucketViewVO bvvo = new BucketViewVO ();
	
	ArrayList<BucketViewVO> bucketList = bdao.selectBucket(id);
%>
	
<jsp:include page="../../main_top_inner.jsp"/>

<!-- Srart Contact Us
=========================================== -->		
<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>내가 <span class="color">찜한 </span>영화</h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				<form id="contact-form" method="post" action="sendmail.php" role="form">
				
					<div class="notice_list">
						<table>
							<tr align="center">
								<td width="15%">구매번호</td>
								<td width="20%">영화이미지</td>
								<td>영화 제목</td>
								<!--  <td width="15%">영화 금액</td>-->
								<td width="15%">일자</td>
								<!-- <td>구매</td>  -->
								<td width="8%">삭제</td>
							</tr>
								
							<%
								for(int i = 0; i < bucketList.size(); i++){
									bvvo = bucketList.get(i);
									mvo2 = mdao2.selectMovieDetail(bvvo.getMovie_code());	
									String movieDate = bvvo.getMoviePick_date().substring(0, 11);
							%>
								<tr align="center">
									<td><%=bvvo.getBucket_code() %></td>
									<td><img src="../movie/images/<%=bvvo.getMovie_img() %>" width="100"></td>			
									<td><%=bvvo.getMovie_title() %></td>
									<!--<td>	
									 	<a href="../movie/movie_buy.jsp?movie_code=<%=bvvo.getMovie_code()%>">
						 					<input type="submit" value="구매" style="width: 80px; height: 80px">
										</a>
									</td> -->
									<!--  <td><%=bvvo.getMovie_price() %></td> -->			
									<td><%=movieDate %></td>
									<td>
					 					<button type="button" onClick="location.href='/Hello/bucket/bucket_delete.jsp?bucket_code=<%=bvvo.getBucket_code() %>'" style="background-color: #292f36; border: none;">
											<img src="images/delete_x.png" style="width: 30px;">
										</button>
									</td>			
								</tr>
						<%}%>
						</table>
						<br>
					</div>
					<div id="cf-submit" align="center">
						<input type="button" id="notice_write_btn" class="btn btn-transparent" value="메인으로"
							onclick="location.href='../../main.jsp'">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
	<!-- ./End Contact Form -->
		<jsp:include page="../../main_bottom.jsp"/>
    <!-- Main jQuery -->
		<script type="text/javascript" src="../../plugins/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap 3.1 -->
		<script type="text/javascript" src="../../plugins/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- Slick Carousel -->
		<script type="text/javascript" src="../../plugins/slick-carousel/slick/slick.min.js"></script>
		<!-- Portfolio Filtering -->
		<script type="text/javascript" src="../../plugins/filterzr/jquery.filterizr.min.js"></script>
		<!-- Smooth Scroll -->
		<script type="text/javascript" src="../../plugins/smooth-scroll/dist/js/smooth-scroll.min.js"></script>
		<!-- Magnific popup -->
		<script type="text/javascript" src="../../plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
		<!-- Google Map API -->
		<script type="text/javascript"  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu5nZKbeK-WHQ70oqOWo-_4VmwOwKP9YQ"></script>
		<!-- Sticky Nav -->
		<script type="text/javascript" src="../../plugins/Sticky/jquery.sticky.js"></script>
		<!-- Number Counter Script -->
		<script type="text/javascript" src="../../plugins/count-to/jquery.countTo.js"></script>
		<!-- wow.min Script -->
		<script type="text/javascript" src="../../plugins/wow/dist/wow.min.js"></script>
		<!-- Custom js -->
		<script type="text/javascript" src="../../js/script.js"></script>
</body>
</html>	