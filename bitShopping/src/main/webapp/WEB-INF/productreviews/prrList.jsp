<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="./../common/common.jsp" %>
<%
	int myoffset = 2;
	int mywidth = 12 - 2 * myoffset;
	int formleft = 3;
	int formright = 12 - formleft;
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
div {
    word-break: break-all;
}
h3{
    display: block;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
   
}

</style>
<title>Productreviews List | 상품 후기 게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>" >
		<div class="panel panel-default"> 
		 	<!-- <div class="col-md-offset-3 col-md-7 col-md-offset-2 reviews"> -->
		 		<div class="panel-heading" align="left">
		 		<h3>PRODUCT REVIEW</h3>
		 		</div> 
		 		<table class="talbe talbe-condensed table-hover">
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
		 				<form class="form-inline" role="form" name="myform" action="<%=contextPath%>/list.prr" method="get">
		 				<input type="hidden" name="command" value="list.prr">
		 			
		 			<div class="form-group">
		 				<c:if test="${whologin == 2}">
		 					<button class="btn btn-default btn-info" type="button" onclick="writeForm();">상품 후기 쓰기</button>
		 				</c:if>
		 			</div>
		 				</form>
		 		</td>
		 		</tr>
		 		<c:forEach var="bean" items="${requestScope.lists}">
		 		<tr>
		 			<td>${bean.bno}</td> 
		 			<td>${bean.btitle}</td>
		 			<td>${bean.bwriter}</td>
		 			<td class="subject">
		 				<div>${bean.bcontent}</div>
		 			</td>
		 			<td>${bean.breview}</td>
		 			<td>${bean.bregdate}</td>
		 			
		 		</tr>	
		 		</c:forEach>
			</table>
			
			
			<br>
			&nbsp;&nbsp;
			<a href="<%=contextPath%>/insert.prr">상품 후기 쓰기</a>
			
		</div>
		</div>
		</div>	

</body>


</html>