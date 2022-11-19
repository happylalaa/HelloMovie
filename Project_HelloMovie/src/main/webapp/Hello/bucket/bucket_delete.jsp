<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.BucketDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록 삭제</title>
</head>
<body>
<%
	int bucket_code = Integer.parseInt(request.getParameter("bucket_code"));
	BucketDAO bdao = BucketDAO.getInstance();
	bdao.deleteBucket(bucket_code);
%>
<script>
		alert("삭제되었습니다.");
		location.href="bucket.jsp";
</script>
</body>
</html>