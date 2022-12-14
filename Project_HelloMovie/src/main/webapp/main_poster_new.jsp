<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.ezen.DAO.MovieDAO" %>
<%@ page import="kr.co.ezen.VO.MovieVO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html class="no-js">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="Meghna One page parallax responsive HTML Template ">

	<meta name="author" content="Muhammad Morshed">

	<title>HelloMovie!</title>

	<!-- Mobile Specific Meta
		================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicon -->
	<!-- <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" /> -->

	<!-- CSS
		================================================== -->
	<!-- Fontawesome Icon font -->
	<link rel="stylesheet" href="plugins/themefisher-font/style.css">
	<!-- bootstrap.min css -->
	<link rel="stylesheet" href="plugins/bootstrap/dist/css/bootstrap.min.css">
	<!-- Animate.css -->
	<link rel="stylesheet" href="plugins/animate-css/animate.css">
	<!-- Magnific popup css -->
	<link rel="stylesheet" href="plugins/magnific-popup/dist/magnific-popup.css">
	<!-- Slick Carousel -->
	<link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

</head>

<body id="body" data-spy="scroll" data-target=".navbar" data-offset="50">
	<!--
	    Start Preloader
	    ==================================== -->
	<div class="preloader">
		<div class="sk-cube-grid">
			<div class="sk-cube sk-cube1"></div>
			<div class="sk-cube sk-cube2"></div>
			<div class="sk-cube sk-cube3"></div>
			<div class="sk-cube sk-cube4"></div>
			<div class="sk-cube sk-cube5"></div>
			<div class="sk-cube sk-cube6"></div>
			<div class="sk-cube sk-cube7"></div>
			<div class="sk-cube sk-cube8"></div>
			<div class="sk-cube sk-cube9"></div>
		</div>
	</div>
	<!-- End Preloader
        ==================================== -->

<!-- ???????????? top3 -->
<section id="blog" class="section">
	<div class="container">
		<div class="row">
			<!-- section title -->
			<div class="title text-center wow fadeInDown">
				<h2>?????? <span class="color">??????</span></h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
			<div class="clearfix">
				<!-- single blog post -->
			<% 
			MovieDAO mdao = MovieDAO.getInstance();
			Vector<MovieVO> vv_rec = mdao.selectMainPoster("recent");
			
			for(int i=0; i<vv_rec.size(); i++){
				MovieVO mvvo = new MovieVO ();  
				mvvo = vv_rec.get(i);
			%>
				<article class="col-md-4 col-sm-6 col-xs-12 clearfix wow fadeInUp" data-wow-duration="500ms">
					<div class="post-block">
						<div class="media_hover">
							<div class="media-wrapper">
								<a href="Hello/movie/movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">
									<img src="Hello/movie/images/<%=mvvo.getMovie_img() %>" class="img-responsive" style="width: 100%; height: 500px;">
								</a>
							</div>
							<div class="content" style="background-color: #353b43; padding: 0;">
							<br>
								<h3 align="center">
									<a href="Hello/movie/movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">
										<%=mvvo.getMovie_title()%>
									</a>
								</h3>
							</div>
						</div>
					</div>						
				</article>
				<!-- /single blog post -->
		<%} %>	
			</div> <!-- end row -->
			<div class="all-post text-center">
				<a class="btn btn-main" href="#">View More</a>
			</div>
		</div>
	</div> <!-- end container -->
</section> <!-- end section -->

	<!-- 
	Essential Scripts
	=====================================-->
	
	<!-- Main jQuery -->
	<script type="text/javascript" src="plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script type="text/javascript" src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Slick Carousel -->
	<script type="text/javascript" src="plugins/slick-carousel/slick/slick.min.js"></script>
	<!-- Portfolio Filtering -->
	<script type="text/javascript" src="plugins/filterzr/jquery.filterizr.min.js"></script>
	<!-- Smooth Scroll -->
	<script type="text/javascript" src="plugins/smooth-scroll/dist/js/smooth-scroll.min.js"></script>
	<!-- Magnific popup -->
	<script type="text/javascript" src="plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<!-- Google Map API -->
	<script type="text/javascript"  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu5nZKbeK-WHQ70oqOWo-_4VmwOwKP9YQ"></script>
	<!-- Sticky Nav -->
	<script type="text/javascript" src="plugins/Sticky/jquery.sticky.js"></script>
	<!-- Number Counter Script -->
	<script type="text/javascript" src="plugins/count-to/jquery.countTo.js"></script>
	<!-- wow.min Script -->
	<script type="text/javascript" src="plugins/wow/dist/wow.min.js"></script>
	<!-- Custom js -->
	<script type="text/javascript" src="js/script.js"></script>
	
   </body>
</html>