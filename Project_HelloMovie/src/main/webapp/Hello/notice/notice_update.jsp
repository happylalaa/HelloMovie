<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.NoticeDAO" %>
<%@ page import="kr.co.ezen.VO.NoticeVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>

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
  
</head>
<body>

    <jsp:include page="../../main_top_inner.jsp"></jsp:include>

<%
	String notice_code = request.getParameter("notice_code");
	
	NoticeDAO ndao = new NoticeDAO();
	NoticeVO nvo = ndao.selectNoticeView(notice_code);
%>


    <!-- Srart Contact Us
=========================================== -->		
<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>공지사항 <span class="color">수정</span></h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				
					<div class="notice_update"> 
					<form action="notice_update_pro.jsp" method="post">
							<table align="center">
               <tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">구분</td>
									<td>
										<select name="notice_sorting">
											<option value="0">
												공지사항
											</option>
											<option value="1">
												이벤트
											</option>
										</select>
									</td>
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">제목</td>
									<td>
										<input type="text" class="form-control" name="notice_title" value="<%=nvo.getNotice_title() %>">
									</td>
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">내용</td>
									<td>
											<textarea class="form-control" name="notice_content"><%=nvo.getNotice_content() %></textarea>
									</td>
								</tr>
								<tr>
									<td align="center" style="color : #57cbcc; font-weight: bolder;">파일업로드</td>
									<td>
										<input type="file" name="notice_event" value="<%=nvo.getNotice_event() %>">
									</td>
								</tr>
							</table>
							<input type="hidden" name="notice_code" value="<%=notice_code %>">
							<br>
							<div align="center">
								<input type="submit" id="notice_write_btn" class="btn btn-transparent" value="수정완료">
								<input type="button" id="notice_write_btn" class="btn btn-transparent" value="목록보기"
									onclick="location.href='../../notice.jsp'">
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



<form action="notice_update_pro.jsp" method="post">
	<table border="1">
		<tr>
			<td>구분</td>
			<td>
				<select name="notice_sorting">
					<option value="0">공지사항</option>
					<option value="1">이벤트</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="notice_title" value="<%=nvo.getNotice_title() %>">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="notice_content"><%=nvo.getNotice_content() %></textarea>
			</td>
		</tr>
		<tr>
			<td>파일업로드</td>
			<td>
				<input type="file" name="notice_event" value="<%=nvo.getNotice_event() %>">
			</td>
		</tr>
	</table>
	
	<input type="submit" value="수정완료">
	<input type="hidden" value="<%=nvo.getNotice_code() %>" name="notice_code"> 
</form>

</body>
</html>