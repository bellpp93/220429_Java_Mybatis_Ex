<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 자바 클래스 import -->
<%@ page import="java.util.List" %>
<%@ page import="mybatis.vo.EmpVO" %>
<%@ page import="mybatis.dao.EmpDAO" %>

<!-- JSTL 적용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>total.jsp 페이지 => emp_tab 테이블에 있는 모든 레코드를 select 하여 보여주는 페이지</title>
</head>
<body>
	<header>
		<h1>사원 목록</h1>
	</header>
	<article>
		<table>
			<caption>사원들의 목록을 위한 테이블</caption>
			<thead>
				<tr>
					<th colspan="6" style="text-align:right;">
						<input type="button" value="사원추가" 
							   id="add_btn" onclick="addFun()" />
					</th>
				</tr>
				<tr>
					<th bgcolor="orange">사번</th>
					<th bgcolor="orange">사원명</th>
					<th bgcolor="orange">근무부서</th>
					<th bgcolor="orange">직책</th>
					<th bgcolor="orange"></th>
					<th bgcolor="orange"></th>
				</tr>
			</thead>
			<tbody>
				<% 
					List<EmpVO> list = EmpDAO.getTotal();
					request.setAttribute("list", list);
				%>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.empno}</td>
						<td>${vo.ename}</td>
						<td>${vo.dept}</td>
						<td>${vo.position}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</article>
</body>
</html>