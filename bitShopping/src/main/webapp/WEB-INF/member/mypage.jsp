<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ include file="./../member/mypagenav.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	/* 	#snb .tit_snb {
    padding: 10px 20 33px 25px;
    }
    #snb {
		margin-right: 30px;
	} */
	.container #body{
		padding-top: 150px;
		padding-left: 50px;
	}
	
</style>	

</head>
<body>
	<div class="container">
		<div id="body">

			<li><a href="<%=contextPath%>/shop.li?mid=${sessionScope.loginfo.mid}"> 주문 내역 </a></li>

			
			<br><br><br><br><br><br><br><br><br><br><br>







		</div>
	</div>
</body>
<%@ include file="./../common/footer.jsp" %> 
</html>