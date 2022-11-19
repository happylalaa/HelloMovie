<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="../../plugins/themefisher-font/style.css">
	<link rel="stylesheet" href="../../plugins/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../plugins/animate-css/animate.css">
	<link rel="stylesheet" href="../../plugins/magnific-popup/dist/magnific-popup.css">
	<link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="../../plugins/slick-carousel/slick/slick-theme.css">
	
	<link rel="stylesheet" href="../../css/style.css">
  <link rel="stylesheet" href="../../css/member.css">
  <link rel="stylesheet" href="../../css/notice.css">

<title>회원가입</title>

<style>
	.member_detail input	{
	background-color: transparent;
	color: #ffffff;
	width: 100%;
	}
	
</style>

</head>
<body>

	<jsp:include page="../../main_top_inner.jsp"></jsp:include>
	
	<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>회원<span class="color">가입</span></h2>
				<div class="border"></div>
			</div>
	
		<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				<div class="notice_write">
					<form action="member_join_pro.jsp" method="post">
							<table align="center">
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">아이디</td>
									<td><input type="text" name="id" placeholder="영문자, 숫자 15자 이하" autofocus required class="form-control" name="notice_content"></td>			
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">이 름</td>
									<td><input type="text" name="name" class="form-control" name="notice_content" required></td>			
								</tr>
								<tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">비밀번호</td>
									<td><input type="password" name="pwd" placeholder="영문자,숫자,특수문자 포함 8자이상 15자 미만" required class="form-control" name="notice_content"></td>			
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">비밀번호 확인</td>
									<td><input type="password" name="pwd2" required class="form-control" name="notice_content"></td>			
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">이메일</td>
									<td><input type="email" name="email" required class="form-control" name="notice_content"></td>			
								</tr>
								<tr>		
									<td align="center" style="color : #57cbcc; font-weight: bolder;">연락처</td>
									<td><input type="tel" name="contact" required class="form-control" name="notice_content"></td>			
								</tr>
								<tr>		
									<td align="center" style="color : #57cbcc; font-weight: bolder;">생년월일</td>
									<td><input type="date" name="birth" required class="form-control" name="notice_content"></td>			
								</tr>
							</table>
							<br>
							<div align="center">
								
								<input type="submit" id="notice_write_btn" class="btn btn-transparent" value="작성완료">
								<input type="button" id="notice_write_btn" class="btn btn-transparent" value="메인화면"
									onclick="location.href='../../main.jsp'">
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