<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="kr.co.ezen.VO.MovieVO" %>
<%@ page import ="kr.co.ezen.DAO.MovieDAO" %>
<%@ page import ="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>영화 목록</title>
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
	
	<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>영화<span class="color">목록</span></h2>
				<div class="border"></div>
			</div>
	
	<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				<form id="contact-form" method="post" action="manager_movie_detail.jsp" role="form">
				<!-- movie_list 변경 -->
				<div class="movie_list"> 
				<%
					MovieDAO mdao = MovieDAO.getInstance();
					Vector<MovieVO> vv = mdao.selectAllMovieList(); 
					MovieVO mvvo = new MovieVO();
				%>
					<table>
						<tr align="center">
							<td width="5%" style="color : #57cbcc; font-weight: bolder;">영화 코드</td>
							<td width="10%" style="color : #57cbcc; font-weight: bolder;">영화 제목</td>
							<td width="5%" style="color : #57cbcc; font-weight: bolder;">개봉일</td>
							<td width="5%" style="color : #57cbcc; font-weight: bolder;">장르</td>
							<td width="5%" style="color : #57cbcc; font-weight: bolder;">시청연령</td>
							<!-- <td width="5%" style="color : #57cbcc; font-weight: bolder;">영화금액</td>  -->
							<td width="5%" style="color : #57cbcc; font-weight: bolder;">판매개수</td>
							<td width="5%" style="color : #57cbcc; font-weight: bolder;">삭제 / 수정</td>
							<%
								for(int i=0; i< vv.size();i++){	//Vector<MovieVO>
									mvvo = vv.get(i);	// MovieVO = Vector<MovieVO>
								 //select option 값 받아오기
								 // 장르 (String)
									String text_genre = "";
							    String genre = mvvo.getGenre();
							    
									if (genre.equals("action")){
										text_genre = "액션";
									}else if (genre.equals("horror")){
										text_genre = "공포";
									}else if (genre.equals("romantic")){
										text_genre = "로맨스";
									}else if (genre.equals("animation")){
										text_genre = "애니메이션";
									}else {
										text_genre = "SF";
									}
							 	 // 시청연령 (String)
							 	String text_age="";
									if(mvvo.getMovie_age()==1){
										text_age="전체";
									}else { 
										text_age="청소년 관람불가";
									}
							%>
								<!-- 영화 리스트 반복 조회 -->
	      	<tr align="center">	 
			  		<td>
			  			<a href="movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">
			  				<%=mvvo.getMovie_code() %>
			  			</a>
			  		</td>
			  		<td>
		  			<a href="movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">
	        			<%=mvvo.getMovie_title() %>
	        		</a>
	        	</td>
	        	<td>
	        		<a href="movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">	
	        			<%=mvvo.getD_day() %>
	        		</a>
	        	</td>
	        	<td>
	        		<a href="movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">
		  					<%=text_genre %>
		  				</a>
			  		</td>
			  		<td>
			  			<a href="movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">
		        		<%=text_age%>
		        	</a>
	        	</td>
<!-- 		    <td> 
		    			<a href="movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>"> 
	       				<%=mvvo.getMovie_price() %> 
 	        		</a> 
 	        	</td> -->
	        	<td>
	        		<a href="movie_detail.jsp?movie_code=<%=mvvo.getMovie_code() %>">
	        			<%=mvvo.getMovie_sold() %>
	        		</a>
	        	</td>
	        	<td>
	        		<button type="button" onclick="location.href='manager_movie_delete.jsp?movie_code=<%=mvvo.getMovie_code() %>'" style="background-color: #292f36; border: none;">
								<img src="../bucket/images/delete_x.png" style="width: 20px;">
							</button>
							<button type="button" onclick="location.href='manager_movie_update.jsp?movie_code=<%=mvvo.getMovie_code() %>'" style="background-color: #292f36; border: none;">
								<img src="../bucket/images/movie_update_icon.png" style="width: 20px;">
							</button>
	        	</td>
      		</tr>
					<%
						}	
					%>
			</table>
		<br>
		<div align="center">
			<input type="button" id="member_detail_btn" class="btn btn-transparent" value="메인화면"
				onclick="location.href='../../main.jsp'">
			<input type="button" id="member_detail_btn" class="btn btn-transparent" value="영화등록"
				onclick="location.href='manager_movie_insert.jsp'">
		</div>
		</div>
	</form>
	<br>
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