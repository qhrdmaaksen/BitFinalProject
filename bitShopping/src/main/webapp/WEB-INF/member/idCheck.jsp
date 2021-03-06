<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function meClose( isCheck ){
		//alert( isCheck ) ;
		opener.joinmyform.isCheck.value = isCheck ;
		self.close();
	}
</script>	
</head>
<body>
	<h1></h1>
	<h1></h1>
	<h1></h1>
	<div class="container">
		<p align="center">${message}</p> <%--아이디 체크에서 넘어오는 메세지가 담기는곳--%>
		<div class="row" align="center">
			<button class="btn btn-primary" type="button" 
				onclick="meClose('${isCheck}');">
				닫&nbsp;&nbsp;기
			</button>
		</div>
	</div>
</body>
</html>