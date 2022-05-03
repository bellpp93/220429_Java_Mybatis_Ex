<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 필요 클래스 임포트 -->
<%@ page import="mybatis.dao.EmpDAO" %>

<%
	//폼에서 넘어오는 파라미터 받기 (empno, ename, dept, position)
	request.setCharacterEncoding("UTF-8");

	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	
	int cnt = EmpDAO.update(empno, ename, dept, position);
	
	// 클라이언트에 응답 => 포워딩 => 클라이언트에 응답
	response.sendRedirect("total.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp 페이지</title>
</head>
<body>

</body>
</html>