<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="kr.co.ezen.VO.MovieVO" %>
<%@ page import ="kr.co.ezen.DAO.MovieDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_영화정보_수정 </title>
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
  <link rel="stylesheet" href="../../css/notice.css">

<style>
	.movie_detail input	{
	background-color: transparent;
	color: #ffffff;
	width: 100%;
	}
	
</style>
</head>
<body>
	<jsp:include page="../../main_top_inner.jsp"></jsp:include>
<%
	 // 1. movie_code 받음
	String movie_code = request.getParameter("movie_code");
	 // 2. MovieDAO 객체 생성 
	MovieDAO mdao = MovieDAO.getInstance();
	 // 3. MovieVO 객체 = 상세정보 
	MovieVO mvvo = mdao.selectMovieDetail(movie_code);
%>

    <!-- Srart Contact Us
=========================================== -->		
<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>영화 <span class="color">수정 </span></h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				<!-- movie_write 변경 -->
				<div class="movie_write"> 
					<form action="manager_movie_update_pro.jsp" method="post">
							<table align="center">
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">영화 이미지</td>
									<td><input type="text" name="movie_img" value="<%=mvvo.getMovie_img() %>" autofocus required class="form-control"></td>			
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">영화 코드</td>
									<td><input type="text" name="movie_code" value="<%=mvvo.getMovie_code() %>" class="form-control" readonly="readonly"></td>			
								</tr>
								<tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">영화 제목</td>
									<td><input type="text" name="movie_title" value="<%=mvvo.getMovie_title() %>" required class="form-control"></td>			
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">감독</td>
									<td><input type="text" name="director" value="<%=mvvo.getDirector() %>" required class="form-control"></td>			
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">개봉일</td>
									<td><input type="date" name="d_day" value="<%=mvvo.getD_day() %>" required class="form-control"></td>			
								</tr>
								<tr>		
									<td align="center" style="color : #57cbcc; font-weight: bolder;">장르</td>
									<td>
										<select name="genre" required class="form-control">
								              <option value="action">액션</option>
								              <option value="horror">공포</option>
								              <option value="romantic">로맨스</option>
								              <option value="animation">애니메이션</option>
								              <option value="sf">SF</option>
								          </select>
							          </td>
								</tr>
								<tr>		
									<td align="center" style="color : #57cbcc; font-weight: bolder;">시청연령</td>
									<td>
							            <select name="movie_age" required class="form-control">
							                <option value="1">전체</option>
							                <option value="2">청소년 관람불가</option><!-- value 변경 -->
							            </select>
						        	</td>
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">출연진</td>
									<td><input type="text" name="actor" value="<%=mvvo.getActor() %>" required class="form-control"></td>			
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">판매개수</td>
									<td><input type="text" name="movie_sold" value="<%=mvvo.getMovie_sold() %>" required class="form-control"></td>			
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">줄거리</td>
									<td><textarea name="summary" size ="1000" required class="form-control"><%=mvvo.getSummary() %></textarea></td>
								</tr>
							</table>
							<br>
							<div align="center">
								<input type="submit" id="movie_write_btn" class="btn btn-transparent" value="수정">
								<input type="button" id="movie_write_btn" class="btn btn-transparent" value="메인화면"
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