<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="./../common/common.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Productreviews List | 상품 후기 게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row"> 
		 	<div class="col-md-offset-3 col-md-7 col-md-offset-2 reviews">
		 		<h4>상품 후기 리스트</h4>
		 		<table>
		 			<thead>
		 				<tr>
		 					<th>번호&nbsp;&nbsp;</th> 
		 					<th>제목&nbsp;&nbsp;</th>
		 					<th>작성자&nbsp;&nbsp;</th>
		 					<th>내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		 					<th>조회수&nbsp;&nbsp;</th>
		 					<th>작성일자&nbsp;&nbsp;</th>
		 				</tr>
		 			</thead>
		 	
		 		
		 		<tr>
		 			<td colspan="12" align="center">
		 				<form action="<%=contextPath%>/list.prr" method="get">
		 				</form>
		 		</td>
		 		</tr>
		 		
		 		<c:forEach var="bean" items="${requestScope.lists}">
		 		<tr>
		 			<td>${bean.bno}</td> 
		 			<td>${bean.btitle}</td>
		 			<td>${bean.bwriter}</td>
		 			<td>${bean.bcontent}</td>
		 			<td>${bean.breview}</td>
		 			<td>${bean.bregdate}</td>
		 		</tr>	
		 		</c:forEach>
			</table>
			
			<br>
			&nbsp;&nbsp;
			<a href="<%=contextPath%>/insert.prr">상품평 쓰기</a>
			
		</div>
		</div>
		</div>

</body>
</html>