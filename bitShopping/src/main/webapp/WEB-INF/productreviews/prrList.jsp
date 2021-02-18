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
		 		<h3>상품 후기 리스트</h3>
		 		<table>
		 			<thead>
		 				<tr>
		 					<th>번호</th>
		 					<th>제목</th>
		 					<th>작성자</th>
		 					<th>내용</th>
		 					<th>조회수</th>
		 					<th>작성일자</th>
		 				</tr>
		 			</thead>
		 	
		 		
		 		<tr>
		 			<td colspan="12" align="center">
		 				<form action="<%=contextPath%>/list.prr" method="get">
		 				
		 				</form>
		 			
		 		</td>
		 		</tr>
		 		
			</table>
		</div>
		</div>
		</div>

</body>
</html>