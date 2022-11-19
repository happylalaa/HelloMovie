<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.ezen.DAO.NoticeDAO" %>
<%@ page import="kr.co.ezen.VO.NoticeVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 pro</title>
</head>
<body>
<%


   String notice_title = request.getParameter("notice_title");
   String notice_content = request.getParameter("notice_content");
   String notice_event = request.getParameter("notice_event");
   int notice_sorting = Integer.parseInt(request.getParameter("notice_sorting"));
   int notice_code = Integer.parseInt(request.getParameter("notice_code"));
   
   
   NoticeDAO ndao = new NoticeDAO();
   NoticeVO nvo = new NoticeVO();
   nvo.setNotice_code(notice_code);
   nvo.setNotice_title(notice_title);
   nvo.setNotice_content(notice_content);
   nvo.setNotice_event(notice_event);
   nvo.setNotice_sorting(notice_sorting);
   
   ndao.updateNotice(nvo);
   
   if(nvo.getNotice_title()==null)   {
%>
   <script>
      alert("제목에 값을 입력해주세요.");
      history.go(-1);
   </script>
<%      
   } else   {
%>
   <script>
      alert("공지사항 수정이 완료되었습니다.");
      location.href='../../notice.jsp';
   </script>
<%
   }
%>
</body>
</html>