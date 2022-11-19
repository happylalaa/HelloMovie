<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" >
<head>

<title>회원이 관리자에게 탈퇴 신청</title>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="../../plugins/themefisher-font/style.css">
	<!-- bootstrap.min css -->
	<link rel="stylesheet" href="../../plugins/bootstrap/dist/css/bootstrap.min.css">
	<!-- Animate.css -->
	<link rel="stylesheet" href="../../plugins/animate-css/animate.css">
	<!-- Magnific popup css -->
	<link rel="stylesheet" href="../../plugins/magnific-popup/dist/magnific-popup.css">
	<!-- Slick Carousel -->
	<link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick-theme.css">
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="../../css/style.css">
  <link rel="stylesheet" href="../../css/member.css">

<style>
	.login_form	{
		width: 45%;
		border-radius: 5px;
		margin: 20px;
	}
</style>

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
				<h2>회원 <span class="color">탈퇴 </span>신청</h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				
					<div class="login" align="center">
					<form action="member_delete_pro.jsp" method="post">
							<div class="login_form">
								<input type="text" placeholder="비밀번호" class="form-control" name="pwd">
							</div>
							<br>
							<div align="center">
								<input type="submit" id="notice_write_btn" class="btn btn-transparent" value="탈퇴신청">
							</div>
						</form>
						<br>
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