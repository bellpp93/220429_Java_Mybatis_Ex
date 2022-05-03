<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 필요 클래스 임포트 -->
<%@ page import="mybatis.dao.EmpDAO" %>

<%
	request.setCharacterEncoding("UTF-8");
	String empno = request.getParameter("empno");
	int cnt = EmpDAO.delete(empno);
	response.sendRedirect("total.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp 페이지</title>
</head>
<body>

</body>
</html>