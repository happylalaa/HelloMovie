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
	<title> 인기 영화 조회 </title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../../plugins/themefisher-font/style.css">
	<link rel="stylesheet" href="../../plugins/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../plugins/animate-css/animate.css">
	<link rel="stylesheet" href="../../plugins/magnific-popup/dist/magnific-popup.css">
	<link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick-theme.css">
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="../../css/style.css">
	<link rel="stylesheet" href="../../css/movie.css">
</head>
<body>

	<jsp:include page="../../main_top_inner.jsp"></jsp:include>
	<!-- Srart Contact Us
=========================================== -->
	<section id="contact-us" class="contact-us section-bg">
		<div class="container">
			<div class="row">
			
			<!-- section title -->
				<div class="title text-center wow fadeIn" data-wow-duration="500ms">
					<h2>최신 영화 <span class="color">조회</span></h2>
					<div class="border"></div>
				</div>
	
				<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
					<div class="movie_write"> 
					<%
						MovieDAO mdao = MovieDAO.getInstance();
						Vector<MovieVO> vv = mdao.selectMainPoster();
						
						for(int i=0;i<vv.size();i++){
							MovieVO mvvo = new MovieVO ();  
							mvvo = vv.get(i);
					%>
							<!-- single blog post -->
							<article class="col-md-4 col-sm-6 col-xs-12 clearfix wow fadeInUp" data-wow-duration="500ms" style="width: 33%">
								<div class="post-block">
									<div class="media_hover">
										<div class="media-wrapper">
											<a href="movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">
												<img src="images/<%=mvvo.getMovie_img() %>" class="img-responsive" style="width: 360px; height: 500px;">
											</a>
										</div>
										<div class="content" style="background-color: transparent; padding: 0; height: 100px;">
										<br>
											<h3 align="center">
												<a href="movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">
													<%=mvvo.getMovie_title()%>
												</a>
											</h3>
										</div>
									</div>
								</div>						
							</article>
							<!-- /single blog post -->
					<%
						}
					%>			
					</div>
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
