<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.NoticeDAO" %>
<%@ page import="kr.co.ezen.DAO.MemberDAO" %>
<%@ page import="kr.co.ezen.VO.NoticeVO" %>
<%@ page import="java.util.Vector" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="plugins/themefisher-font/style.css">
	<link rel="stylesheet" href="plugins/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="plugins/animate-css/animate.css">
	<link rel="stylesheet" href="plugins/magnific-popup/dist/magnific-popup.css">
	<link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/notice.css">

</head>
<body>

    <jsp:include page="main_top.jsp"/>
  
    <!-- Srart Contact Us
=========================================== -->		
<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>공지<span class="color">사항</span></h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				<form id="contact-form" method="post" action="sendmail.php" role="form">
				
					<div class="notice_list">
					<%
						NoticeDAO ndao = new NoticeDAO();
						Vector<NoticeVO> v = ndao.selectNoticeList();
						NoticeVO nvo = new NoticeVO();
					%>
					
						<table>
               <tr align="center">
									<td width="8%">글번호</td>
									<td width="12%">구분</td>
									<td>제목</td>
									<td width="20%">작성일자</td>
							</tr>
							<%
							for(int i=0; i < v.size(); i++)	{
								nvo = v.get(i);
								
								int notice_sorting = nvo.getNotice_sorting();
								String sorting = "";
								if(notice_sorting==0)	{
									sorting = "공지사항";
								} else	{
									sorting = "이벤트";
								}
							%>
							<tr align="center">
								<td>
									<a href="/Hello/notice/notice_detail.jsp?notice_code=<%=nvo.getNotice_code() %>">
										<%=nvo.getNotice_code() %>
									</a>
								</td>
								<td>
									<a href="/Hello/notice/notice_detail.jsp?notice_code=<%=nvo.getNotice_code() %>">
										<%=sorting %>
									</a>
								</td>
								<td>
									<a href="/Hello/notice/notice_detail.jsp?notice_code=<%=nvo.getNotice_code() %>">
										<%=nvo.getNotice_title() %>
									</a>
								</td>
								<td>
									<a href="/Hello/notice/notice_detail.jsp?notice_code=<%=nvo.getNotice_code() %>">
										<%=nvo.getNotice_date() %>
									</a>
								</td>
							</tr>
							<%
							}
							%>
						</table>
						<br>
					</div>
					<div id="cf-submit" align="center">
					<%
						String id = (String) session.getAttribute("id");
						MemberDAO mdao = new MemberDAO();
            int result = mdao.managerCheck(id); //M:1, U:0
            
            if(result==1)	{
					%>
						<input type="button" id="notice_write_btn" class="btn btn-transparent" value="글쓰기"
							onclick="location.href='/Hello/notice/notice_write.jsp'">
					<%
            }
					%>
						<input type="button" id="notice_write_btn" class="btn btn-transparent" value="메인으로"
							onclick="location.href='main.jsp'">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
			<!-- ./End Contact Form -->
		<jsp:include page="main_bottom.jsp"/>
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