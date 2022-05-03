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
<style>
	table {
		width:500px;
		border-collapse:collapse;
	}
	table, table th, table>tbody td {
		border:1px solid black;
		padding:4px;
	}
	table thead>tr:first-child>th { border:0px; }
	
	#add_win, #update_win {
		width:250px;
		border:1px solid black;
		background-color:#fff;
		position:absolute;
		top:100px;
		left:580px;
		display:none;
	}
	#add_win input[type=text] {
		width:90px;
		padding:3px;
		border:1px solid black;
		margin-bottom:5px;
	}
</style>
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
						<input type="button" value="사원추가" id="add_btn" onClick="addFun()" />
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
						<td width="60">
							<button onClick="showUpdate(${vo.empno},'${vo.ename}','${vo.dept}','${vo.position}')">수정</button>
						</td>
						<td width="60">
							<button onClick="location.href='delete.jsp?empno=${vo.empno}'">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</article>
	<div id="add_win">
		<header>
			<h2>사원 추가</h2>
		</header>
		<div id="body">
			<form name="addForm" method="POST" action="add.jsp">
				<label for="empno">사번</label>
				<input type="text" id="empno" name="empno"/>
				<br/>
				
				<label for="ename">이름</label>
				<input type="text" id="ename" name="ename"/>
				<br/>
				
				<label for="dept">부서</label>
				<input type="text" id="dept" name="dept"/>
				<br/>
				
				<label for="position">직책</label>
				<input type="text" id="position" name="position"/>
				<br/><br/>
				
				<input type="button" value="추가" id="append_btn" onClick="sendData()"/>
				<input type="button" value="취소" id="cancel_btn" onClick="closeWin()"/>
			</form>
			<br/>
		</div>
	</div>
	<!-- id를 쓰는 이유 2가지? ① 자바스크립트와 상호작용을 하기 위해	② 스타일 적용하기 위해 -->
	<div id="update_win">
		<header>
			<h1>사원 데이터 수정</h1>
		</header>
		<div id="body">
			<form id="updateForm" name="updateForm" action="update.jsp">
				<label for="empno">사번</label>
				<input type="text" id="empnoOfUpdate" name="empno" readOnly /> <!-- readOnly는 읽기 전용 -->
				<br/>
				
				<label for="ename">이름</label>
				<input type="text" id="enameOfUpdate" name="ename" />
				<br/>
				
				<label for="dept">부서</label>
				<input type="text" id="deptOfUpdate" name="dept" />
				<br/>
				
				<label for="position">직책</label>
				<input type="text" id="positionOfUpdate" name="position" />
				<br/><br/>
				
				<input type="button" value="수정" 
					   id="update_submit_btn" onClick="sendDataUpdate()"/>
				<input type="button" value="취소" 
					   id="update_cancel_btn" onClick="closeWinUpdate()"/>
			</form>
			<br/>
		</div>
	</div>
	<script>
		function addFun(){
			var addWin = document.getElementById("add_win");
			addWin.style.display = "block";
		}
	
		function showUpdate(empno, ename, dept, position){
			var updateForm = document.getElementById("updateForm");
			updateForm.empno.value = empno;
			updateForm.ename.value = ename;
			updateForm.dept.value = dept;
			updateForm.position.value = position;
			
			var updateWin = document.getElementById("update_win");
			updateWin.style.display = "block";
		}
		
		function sendData() {
			var empno = document.getElementById("empno").value;
			var ename = document.getElementById("ename").value;
			var dept = document.getElementById("dept").value;
			var position = document.getElementById("position").value;
			
			if (empno.trim().length < 1) {
				document.getElementById("empno").value == "";
				alert("사원번호를 입력하세요!!")
				document.getElementById("empno").focus();
				return;  // 현재 상태를 유지해라!!
			}
			// submit() 함수를 호출하면 'submit' 객체를 누른 경우와 똑같은 효과를 준다.
			document.addForm.submit();
		}
		
		function closeWin() {
			var addwin = document.getElementById("add_win");
			addwin.style.display = "none";
		}
		
		function sendDataUpdate() {
			var ename = document.getElementById("enameOfUpdate").value;
			var dept = document.getElementById("deptOfUpdate").value;
			var position = document.getElementById("positionOfUpdate").value;
			
			if (ename.trim().length < 1 || dept.trim().length < 1 || position.trim().length < 1) {
				alert("수정할 내용을 입력하세요!!")
				return;
			}
			document.updateForm.submit();
		}
		
		function closeWinUpdate() {
			var updatewin = document.getElementById("update_win");
			updatewin.style.display = "none";
		}
	</script>
</body>
</html>