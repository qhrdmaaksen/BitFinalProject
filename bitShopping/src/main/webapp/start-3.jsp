<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String imsi = request.getContextPath() + "/main.cu" ; // 컬리에 cu
	//out.print(imsi);
	response.sendRedirect(imsi) ;
%>
</body>
</html>