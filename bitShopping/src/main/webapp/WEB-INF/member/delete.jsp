<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../member/mypagenav.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#tablebody{
			margin-left: 400 ; 
		}
		#delfooter{
			margin-right: 100;
			margin-top: 150;
		}
	</style>
</head>
<body>
	<table id="tablebody" border="1">
	<form:form action="${contextPath}/userdelete.me" method="get">
		<br><br><br><br><br>
		<tr>
			<td>마켓컬리 회원을 탈퇴하시겠습니까 ?</td>
		</tr>
		<tr>
			<td>마켓컬리 회원을 탈퇴하시겠습니까 ?</td>
		</tr>
		<tr>
			<td>마켓컬리 회원을 탈퇴하시겠습니까 ?</td>
		</tr>
		<tr>
			<td>마켓컬리 회원을 탈퇴하시겠습니까 ?</td>
		</tr>
		<tr>
			<td>마켓컬리 회원을 탈퇴하시겠습니까 ?</td>
		</tr>
		<tr>
			<td>마켓컬리 회원을 탈퇴하시겠습니까 ?</td>
		</tr>
		<tr>
			<td>마켓컬리 회원을 탈퇴하시겠습니까 ?</td>
		</tr>
		<tr>
			<td>마켓컬리 회원을 탈퇴하시겠습니까 ?</td>
		</tr>
		<tr>
			<td>마켓컬리 회원을 탈퇴하시겠습니까 ?</td>
		</tr>
		<tr>
			<td>탈퇴하신다면 다시 복구하실수 없으시며</td>
		</tr>
		<tr>
			<td>탈퇴하신다면 다시 복구하실수 없으시며</td>
		</tr>
		<tr>
			<td>탈퇴하신다면 다시 복구하실수 없으시며</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					<input type="hidden" name="mid" value="${loginfo.mid}">
					<button type="submit"class="w3-button w3-red"><span>회원 탈퇴하기</span></button>	
				</div>
			</td>
		</tr>
		</form:form>
	</table>
<div id="delfooter">
	<%@ include file="./../common/footer.jsp" %> 
</div>
</body>
</html>