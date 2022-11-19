<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.MemberDAO" %>
<%@ page import="kr.co.ezen.VO.MemberVO" %>
<%@ page import="java.util.Vector" %>
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
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="../../css/style.css">
  <link rel="stylesheet" href="../../css/member.css">
  <link rel="stylesheet" href="../../css/notice.css">

<title>관리자 화면 회원 전체 리스트</title>

<style>
	
#member_small_btn	{
	border: 1px solid rgba(236, 239, 241, 0.07);
  background: #afbac4;
  width: 45%;
  height: 35px;
  margin: 0;
  padding: 0;
  font-size: 16px;
}

.member_list table tr td	{
	border: 2px #afbac4 solid;
  padding: 10px;
  font-size: 16px;
  color: #ffffff;
}
	
</style>

</head>
<body>

    <jsp:include page="../../main_top_inner.jsp"/>
  
    <!-- Srart Contact Us
=========================================== -->		
<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>회원 <span class="color">목록 </span>조회</h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				<form id="contact-form" method="post" action="admin_member_update.jsp">
				
					<div class="member_list">
					<%
						MemberDAO mdao = new MemberDAO();
						Vector<MemberVO> v = mdao.getList();
					%>
						<table>
            	<tr align="center">
								<td>회원번호</td>
								<td>아이디</td>
								<td>이름</td>
								<td>연락처</td>
								<td>이메일</td>
								<td>생년월일</td>
								<td>가입일자</td>
								<td>회원등급</td>
								<td>탈퇴신청</td>
								<td>수정/삭제</td>
							</tr>
							
							<%
							for(int i=0; i < v.size(); i++)	{
								MemberVO mvo = v.get(i);
								
								String membership = "";
								if(mvo.getMembership().equals("U"))	{
									membership = "일반회원";
								} else	{
									membership = "관리자";
								}
								
								String delete = "";
								if(mvo.getMember_delete()==null)	{
									delete = "N";
								} else	{
									delete = mvo.getMember_delete();
								}
								
								String birth = mvo.getBirth().substring(0, 11);
							%>
							<tr align="center">
								<td>
									<%=mvo.getMember_code() %>
								</td>
								<td>
									<%=mvo.getId() %>
								</td>
								<td>
									<%=mvo.getName() %>
								</td>
								<td>
									<%=mvo.getContact() %>
								</td>
								<td>
									<%=mvo.getEmail() %>
								</td>
								<td>
									<%=birth %>
								</td>
								<td>
									<%=mvo.getRegdate() %>
								</td>
								<td>
									<%=membership %>
								</td>
								<td>
									<%=delete %>
								</td>
								<td>
									<input type="hidden" name="id" value="<%=mvo.getId() %>">
									<input type="submit" id="member_small_btn" class="btn btn-transparent" value="수정">
								<%
									if(delete.equals("Y"))	{
								%>
									<input type="button" id="member_small_btn" class="btn btn-transparent" value="삭제"
										onclick="location.href='admin_member_delete.jsp?id=<%=mvo.getId() %>'">
								<%
									}
								%>
								</td>
							</tr>
							<%
							}
							%>
						</table>
						<br>
					</div>
					<div id="cf-submit" align="center">
						<input type="button" id="member_detail_btn" class="btn btn-transparent" value="메인으로"
							onclick="location.href='../../main.jsp'">
					</div>
				</form>
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