<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.ReviewDAO" %>
<%@ page import="kr.co.ezen.VO.ReviewVO" %>
<%@ page import="kr.co.ezen.DAO.MovieDAO" %>
<%@ page import="kr.co.ezen.VO.MovieVO" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: #bbbbbb;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 .star-test {
  -webkit-text-fill-color: gold;
}
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: gold;
}
</style>

<title>영화 상세조회 화면</title>
<%
	String movie_code = request.getParameter("movie_code"); 
	
	MovieDAO mdao = MovieDAO.getInstance();
	MovieVO mvo = mdao.selectMovieDetail(movie_code);
	ReviewVO rvo = new ReviewVO();
	ReviewDAO rdao = new ReviewDAO();
	
	String genre="";
	switch(mvo.getGenre()){
	
		case "action": 
			genre="액션"; 
			break;
			
		case "horror": 
			genre="호러"; 
			break;
			
		case "romantic": 
			genre="로멘스"; 
			break;
			
		case "animation": 
			genre="애니메이션"; 
			break;
			
		default: 
			genre="미분류";
	}
	
	String age="전체"; 
	if(mvo.getMovie_age() == 2)
		age="성인";
						
						
	
	 Vector<ReviewVO> v = rdao.allReviewList(movie_code);
						
	
%>
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
  <link rel="stylesheet" href="../../css/movie.css">
  <link rel="stylesheet" href="../../css/member.css">


</head>
<body>
<jsp:include page="../../main_top_inner.jsp"/>
<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>영화 <span class="color">상세 </span>보기</h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				
					<div class="notice_write">
						<div calss="video-container"><iframe src='https://tv.naver.com/embed/<%=movie_code %>?autoPlay=false' frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='100%' height="600" allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></div>
						<div class="overview">
						<br>
							<div class="title" align="center"><span><%=mvo.getMovie_title() %></span>
								<button type="button" onClick="location.href='/Hello/bucket/bucket_insertPro.jsp?movie_code=<%=movie_code%>'" style="background-color: #292f36; border: none;">
									<img src="../../images/main_icons/shop_icon.png" style="width: 30px;">
								</button>
							</div>				
							
						</div>
						<div class="overview">
							<div class="title">
								<div class="title text-center wow fadeIn" data-wow-duration="500ms" style="padding: 0px;">
									<h2>감독 및 출연진</h2>
									<div class="border"></div>
								</div>
							</div>
							<div style="display: flex;">
								<!-- 감독 -->
								<div style="flex: 1; width: 15%;">
									<div align="center">
										<img src="../../images/main_icons/profile.png" style="width: 80px;">
									</div>
									<br>
									<div align="center">
										<%=mvo.getDirector() %> 감독
									</div>
								</div>
								<!-- 출연진 -->
	               <%   
	               	String actorList = mvo.getActor();
	                String[] actor = actorList.split(",");
	                  for(int i=0; i<actor.length;i++){ %>
                    	<div style="flex: 1; width: 15%;">
                      	<div align="center">
                          <img src="../../images/main_icons/profile.png" style="width: 80px;">
                       	</div>
                       	<br>
	                      <div align="center">
	                          <%=actor[i] %>
	                      </div>
                     </div>
	                     <%}%>
	                  </div>
	                  <!-- /.overview -->
							
							<br><br><br><br>
						<div class="overview">
							<div class="title">
								<div class="title text-center wow fadeIn" data-wow-duration="500ms" style="padding: 0px;">
									<h2>줄거리 및 개요</h2>
									<div class="border"></div>
								</div>
							</div>
							<div class="flex">
								<div class="thum"><img width="262px" height="374px" alt="thumb" src="images/<%=mvo.getMovie_img() %>"></div>
								<div class="item">
									<ul class="info01">
										<li>
											<div class="type">방영/개봉일</div>
											<div class="value"><%=mvo.getD_day() %></div></li>
										<li>
											<div class="type">장르</div>
											<div class="value"><%=genre %></div>
										</li>
										<li>
											<div class="type">시청등급</div>
											<div class="value"><%=age %></div>
										</li>
									</ul>
									<div class="info-detail">
										<div class="tip"></div>
										<div class="summary">
											<textarea name="summary" class="form-control" readonly="readonly"
												style="width: 80%; height: 200px;"><%=mvo.getSummary() %></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

  
    <!-- Srart Contact Us
=========================================== -->		
<section id="contact-us" class="contact-us section-bg">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="title text-center wow fadeIn" data-wow-duration="500ms">
				<h2>리뷰 <span class="color">작성 </span></h2>
				<div class="border"></div>
			</div>
			<!-- /section title -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
				
				<div>
					<form action="movie_detail_reviewPro.jsp" method="post">
							<table border="">
               					<tr>
									<td>
										<div class="star-rating space-x-4 mx-auto">
											<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
											<label for="5-stars" class="star pr-4">★</label>
											<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
											<label for="4-stars" class="star">★</label>
											<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
											<label for="3-stars" class="star">★</label>
											<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
											<label for="2-stars" class="star">★</label>
											<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
											<label for="1-star" class="star">★</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>
											<textarea placeholder="내용을 입력해주세요" class="form-control" name="review_content"></textarea>
									</td>

								</tr>
								
							</table>
							<input type="hidden" name="movie_code" value="<%=movie_code %>" />
							<br>
							<div align="center">
											<input type="submit" id="member_detail_btn" class="btn btn-transparent" value="작성완료"
												onclick="location.href='movie_detail_reviewPro.jsp'">
							</div>
							<br>
							
						</form>
						<hr>
		
						<%
							for(int i=0; i < v.size(); i++)	{
								rvo = v.get(i);
								
							%>
						
						<form action="*" method="post">
							
									<div ><font color="white"><%=rvo.getId() %></font></div>
										<div class="star-test">
											<% 
												int k=rvo.getReview_star();
												while(k>0){%>
													<span>★</span>
											<% 
												k--; }
											%>
											
										</div>
									<div><font color="white"><%=rvo.getReview_content() %></font></div>
							<br>
							
						</form>
						<%
							}
						%>
					</div>
			</div>
		</div>
	</div>
	<br>
</section>

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
