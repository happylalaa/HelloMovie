<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.QnaDAO" %>
<%@ page import="kr.co.ezen.VO.QnaVO" %>
<%@ page import = "java.util.Date" %>    
<%@ page import = "java.text.SimpleDateFormat" %>    
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역 처리 qnaPro.jsp</title>
</head>
<body>
	<jsp:useBean id="qvo" class="kr.co.ezen.VO.QnaVO">
		<jsp:setProperty name="qvo" property="*"/>		
	</jsp:useBean>
<% 
	String id = (String) session.getAttribute("id");
	qvo.setId(id);
	//번호, 작성자 id, 작성일자, 제목, 내용, 답변(null)
	
	QnaDAO mdao = new QnaDAO();
	mdao.insertQna(qvo);
%>

<script>
	alert("문의가 접수되었습니다. ");
	location.href="qnaListId.jsp";
</script>

</body>
</html>