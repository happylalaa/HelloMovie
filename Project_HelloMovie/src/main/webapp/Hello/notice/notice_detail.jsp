<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.NoticeDAO" %>
<%@ page import="kr.co.ezen.VO.NoticeVO" %>
<%@ page import="kr.co.ezen.DAO.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>

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
  String id = (String) session.getAttribute("id");
	
	NoticeDAO ndao = new NoticeDAO();
	NoticeVO nvo = ndao.selectNoticeView(notice_code);
	
	String content = nvo.getNotice_content();
	if(content==null)	{
		content="　";
	}
	
	int notice_sorting = nvo.getNotice_sorting();
	
	String sorting = "";
	if(notice_sorting==0)	{
		sorting = "공지사항";
	} else	{
		sorting = "이벤트";
	}
	
	MemberDAO mdao = new MemberDAO();
	int result = mdao.managerCheck(id);
	
%>
  
    <!-- Srart Contact Us
=========================================== -->		
<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>공지사항 <span class="color">상세보기</span></h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				<div class="notice_detail">
					<table border="1">
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">구분</td>
							<td>
								<%=sorting %>
							</td>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">작성일자</td>
							<td>
								<%=nvo.getNotice_date() %>
							</td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">제목</td>
							<td colspan="3">
								<%=nvo.getNotice_title() %>
							</td>
						</tr>
						<tr>
							<td style="color : #57cbcc; font-weight: bolder;" align="center">내용</td>
								<td colspan="3">
								<textarea readonly="readonly" class="form-control" style="font-size: 18px;"><%=content %></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
							<%
								if(nvo.getNotice_event()==null)	{
							%>
									
							<%
								} else	{
							%>
								<img src="images/<%=nvo.getNotice_event() %>" width="100%">
							<%
								}
							%>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button id="notice_detail_btn" class="btn btn-transparent" onclick="location.href='../../notice.jsp'">
							목록으로
						</button> 
						
					<%
						if(result==1)	{
					%>
						<input type="button" value="수정" id="notice_detail_btn" class="btn btn-transparent" onclick="location.href='notice_update.jsp?notice_code=<%=nvo.getNotice_code() %>'">
						<input type="button" value="삭제" id="notice_detail_btn" class="btn btn-transparent" onclick="location.href='notice_delete.jsp?notice_code=<%=nvo.getNotice_code() %>'">>
					<%
						}
					%>
						</div>
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


	
	
</body>
</html>