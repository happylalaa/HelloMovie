<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "kr.co.ezen.DAO.MemberDAO" %>
<%@ page import = "kr.co.ezen.VO.MemberVO" %>

	<%
	String id = (String) session.getAttribute("id"); 

	MemberDAO mdao = new MemberDAO();
	MemberVO mvo = mdao.getSelect(id);
	%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- Mobile Specific Meta
		================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Favicon -->
	<!-- <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" /> -->

	<!-- CSS
		================================================== -->
	<!-- Fontawesome Icon font -->
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

<title>회원정보 수정</title>

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
				<h2>회원<span class="color">정보</span></h2>
				<div class="border"></div>
			</div>
	
	<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				<div class="member_detail">
					<form action="member_update_pro.jsp" method="post">
					<table border="1">
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">회원번호</td>
							<td><%=mvo.getMember_code() %></td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">아이디</td>
							<td><%=mvo.getId() %></td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">비밀번호</td>
							<td><input type="text" placeholder="비밀번호를 입력해주세요" name="password"></td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">이름</td>
							<td><input type="text" name="name" value="<%=mvo.getName() %>"></td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">연락처</td>
							
							<td><input type="text" name="contact" value="<%=mvo.getContact() %>"></td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">이메일</td>
							<td><input type="text" name="email" value="<%=mvo.getEmail() %>"></td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">생년월일</td>
							<td><%=mvo.getBirth() %></td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">회원가입일</td>
							<td><%=mvo.getRegdate() %></td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">회원등급</td>
							<td><%=mvo.getMembership() %></td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button id="member_detail_btn" class="btn btn-transparent" onclick="location.href='../../main.jsp'">
							메인으로
						</button> 
						<input type="hidden" name="id" value="<%=id %>">
						<input type="submit" value="작성완료" id="member_detail_btn" class="btn btn-transparent">	
					</div>
					
					</form>
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