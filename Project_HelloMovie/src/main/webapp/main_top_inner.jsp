<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.MemberDAO" %>
<!DOCTYPE html>
<html class="no-js">

<head>
	<title>HelloMovie!</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="Meghna One page parallax responsive HTML Template ">
	<meta name="author" content="Muhammad Morshed">
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

	<style type="text/css">
		#movie_menu ul	{
			font-size: 16px;
			display: none;
			background: #1d2024;
			color : #ffffff;
		}
		
		#movie_menu:hover ul	{
			font-size: 16px;
			display: block;
			background: #1d2024;
			color : #ffffff;
		}
		
		select,
		select option	{
			padding:0; 
			width: 100%; 
			font-size: 16px;
			border: #57cbcc 1px solid;
			background-color: #242930;
			color: #737f8a;
			height: 35px;
			border-radius: 5px;
			margin: 0px;
		}
	</style>
</head>

<body id="body" data-spy="scroll" data-target=".navbar" data-offset="50">

<%
	String id = (String)session.getAttribute("id");
%>
	<!--
	    Start Preloader
	    ==================================== -->
	<div class="preloader">
		<div class="sk-cube-grid">
			<div class="sk-cube sk-cube1"></div>
			<div class="sk-cube sk-cube2"></div>
			<div class="sk-cube sk-cube3"></div>
			<div class="sk-cube sk-cube4"></div>
			<div class="sk-cube sk-cube5"></div>
			<div class="sk-cube sk-cube6"></div>
			<div class="sk-cube sk-cube7"></div>
			<div class="sk-cube sk-cube8"></div>
			<div class="sk-cube sk-cube9"></div>
		</div>
	</div>
	<!-- End Preloader
        ==================================== -->

 <!-- 
  Fixed Navigation
  ==================================== -->
  <header id="navigation" class="navbar navigation">
      <div class="container">
          <div class="navbar-header">
            <!-- responsive nav button -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
              <!-- /responsive nav button -->
              <!-- logo -->
              <a class="navbar-brand logo" href="../../main.jsp">
                  <!-- 직접 로고 만든 것 ,<img src="images/logo.png" alt="Website Logo" /> -->
								<h2><b>HelloMovie
                  <svg width="40px" height="40px" viewBox="0 0 45 44" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                      <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                          <g id="Group" transform="translate(2.000000, 2.000000)" stroke="#57CBCC" stroke-width="3">
                              <ellipse id="Oval" cx="20.5" cy="20" rx="20.5" ry="20"></ellipse>
                              <path d="M6,7 L33.5,34.5" id="Line-2" stroke-linecap="square"></path>
                              <path d="M21,20 L34,7" id="Line-3" stroke-linecap="square"></path>
                          </g>
                      </g>
                  </svg>
                  </b></h2>
              </a>
          <!-- /logo -->
      </div>
	
	    <!-- main nav -->
	    <nav class="collapse navbar-collapse navbar-right" role="Navigation" style="width: 80%;">
       
       	<form action="../movie/movie_select_search_list.jsp" method="post">
        	
					<ul id="nav" class="nav navbar-nav navigation-menu" style="width:100%;">
						<li style="padding:10px; width: 15%;">
							<!-- 검색할 컬럼(value값) 지정-->
							<select name="keyword"> 
								<option value="movie_title" selected="selected">제 목</option>
								<option value="director">감 독</option>
								<option value="actor">출연진</option>
							</select>
							
						</li>
						<li>
							<input type="text" name="searchWord" placeholder="검색어를 입력하세요" size="45%" 
								style="border-radius: 5px; height: 35px; margin: 9px 2px; border: #57cbcc 1px solid;">
						</li>
						<li>
							<button type="submit" 
								style="background-color: transparent; border:none; padding: 0;">
								<img src="../../images/main_icons/search_icon.png" width="30px" height="30px"
									style="padding: 0; margin: 10px 0px;"/>
							</button>
						</li>		
            <li id="movie_menu"><a href="#">영화</a>
            	<ul>
            		<li align="center"><a href="../movie/movie_select_popular.jsp">인기영화</a></li>
            		<li align="center"><a href="../movie/movie_select_new.jsp">최신영화</a></li>
            		<li align="center"><a href="../movie/movie_select_genre.jsp">장르별영화</a></li>
            		<li align="center"><a href="../movie/movie_select_age.jsp">연령별영화</a></li>
            	</ul>
            </li>
            <li><a href="../../notice.jsp">공지사항</a></li>
            <%
            	if(id != null)	{
            		MemberDAO mdao = new MemberDAO();
            		int result = mdao.managerCheck(id); //M:1, U:0
            %>
             <li id="movie_menu"><a href="#">마이페이지</a>
             	<ul>
             		<li align="center"><a href="../../logout.jsp">로그아웃</a></li>
             		<li align="center"><a href="../bucket/bucket.jsp">찜한영화목록</a></li>
             		<li align="center"><a href="../movie/movie_review.jsp">내가 작성한 리뷰</a></li>
             <%
             		if(result==1)	{
             %>
             		<li align="center"><a href="Hello/qna/qnaList.jsp">1:1 문의</a></li>
             <%
             		} else {
             %>			
             		<li align="center"><a href="Hello/qna/qnaListId.jsp">1:1 문의</a></li>
             <%	
             		}
             %>
             		<li align="center"><a href="../member/member_detail.jsp">회원정보</a></li>
             	<%
             		if(result==1)	{
             %>
             		<li align="center"><a href="../member/admin_member_list.jsp">회원관리</a></li>
             		<li align="center"><a href="../movie/manager_movie_select.jsp">영화관리</a></li>
             	<%
             		}
             	%>
             </li>
            <%
            } else	{
            %>
             <li><a href="../../login.jsp">로그인</a></li>
            <%
            }
            %>
            </ul>
            </form>
        </nav>
        <!-- /main nav -->
        
    </div>
  </header>
  <!--
  End Fixed Navigation
  ==================================== -->

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