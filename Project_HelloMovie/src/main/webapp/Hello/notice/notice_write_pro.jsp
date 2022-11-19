<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.NoticeDAO" %>
<%@ page import="kr.co.ezen.VO.NoticeVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성 pro</title>
</head>
<body>

	<jsp:useBean id="nvo" class="kr.co.ezen.VO.NoticeVO">
		<jsp:setProperty name="nvo" property="*"/>
	</jsp:useBean>

<%
	NoticeDAO ndao = new NoticeDAO();
	ndao.insertNotice(nvo);
	
	if(nvo.getNotice_title()==null)	{
%>
	<script>
		alert("제목에 값을 입력해주세요.");
		history.go(-1);
	</script>
<%		
	} else	{
%>
	<script>
		alert("공지사항 작성이 완료되었습니다.");
		location.href='../../notice.jsp';
	</script>
<%
	}
%>

</body>
</html>