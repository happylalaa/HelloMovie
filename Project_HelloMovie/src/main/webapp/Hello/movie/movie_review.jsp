<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.ReviewDAO" %>
<%@ page import="kr.co.ezen.VO.ReviewVO" %>
<%@ page import="kr.co.ezen.DAO.MovieDAO" %>
<%@ page import="kr.co.ezen.VO.MovieVO" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: #bbbbbb;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 .star-test {
  -webkit-text-fill-color: gold;
}
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: gold;
}
</style>

<title>내가 작성한 리뷰</title>
<%
	String id = (String) session.getAttribute("id");
	
	MovieDAO mdao = MovieDAO.getInstance();
	ReviewVO rvo = new ReviewVO();
	ReviewDAO rdao = new ReviewDAO();
	
	Vector<ReviewVO> v = rdao.myReviewList(id);
	
%>
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
  <link rel="stylesheet" href="../../css/movie.css">
  <link rel="stylesheet" href="../../css/member.css">

</head>
<body>

<jsp:include page="../../main_top_inner.jsp"/>

<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>내가 <span class="color">작성한 </span>리뷰</h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				
				<div>
				<%
					for(int i=0; i < v.size(); i++)	{
						rvo = v.get(i);
						MovieVO mvo = mdao.selectMovieDetail(rvo.getMovie_code());
				%>
					<table style="border: gray 1px solid; width: 60%;" align="center">
						<tr align="center" style="color: white; font-size: 18px">
							<td colspan="3" style="border: gray 1px solid;">
								<%=mvo.getMovie_title() %>
							</td>
						</tr>
						<tr align="center">
							<td style="border: none;">
								<font color="white">
									<%=rvo.getId() %>
								</font>
							</td>
							<td style="border: none;">
								<div class="star-test">
								<% 
									int k=rvo.getReview_star();
									while(k>0){%>
										<span>★</span>
								<% 
									k--; }
								%>
								</div>
							</td>
							<td style="border: none;">	
								<div>
									<font color="white">
										<%=rvo.getReview_content() %>
									</font>
								</div>
							</td>
						</tr>
					</table>
					<br>
						<%
							}
						%>
					</div>
			</div>
		</div>
	</div>
</section>

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
		