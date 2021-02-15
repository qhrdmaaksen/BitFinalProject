<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네트워크 프로그래밍 구현 - 권연경</title>


<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/controller"; //서블릿에 정의되어 있슴
	
	//폼 태그에서 사용할 변수
	//YesForm = contextPath + mappingName ;
	
	//폼이 아닌 곳에서 사용할 변수
	//NoForm = contextPath + mappingName + "?command=" ;
%>
<c:set var="contextPath" value="<%=contextPath%>" scope="application"/> 


</head>
<body>



<br><br><br>

		<a href="<%=contextPath%>/insert.me">회원 가입</a>

<br><br><br>


<br><br><br>

		<a href="<%=contextPath%>/list.me">회원 목록 보기</a>

<br><br><br>









</body>
</html>