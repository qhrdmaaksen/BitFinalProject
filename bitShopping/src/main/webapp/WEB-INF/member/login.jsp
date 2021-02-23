<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/controller"; //서블릿에 정의되어 있슴
	
	//폼 태그에서 사용할 변수
	//YesForm = contextPath + mappingName ;
	
	//폼이 아닌 곳에서 사용할 변수
	//NoForm = contextPath + mappingName + "?command=" ;
%>
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

	

</head>
 <style type="text/css">

	#content {
    min-width: 1050px;
    padding-bottom: 120px;
	}
	#header, #container, #content {
    position: relative;
	}
	
	.section_login {
    width: 340px;
    margin: 0 auto;
    padding-top: 90px;
    letter-spacing: -.6px;
}
  .section_login .tit_login {
    font-weight: 800;
    font-size: 20px;
    line-height: 20px;
    text-align: center;
}
.section_login * {
    font-family: noto sans;
    color: #333;
}
.section_login .write_form {
    padding-top: 36px;
}


.section_login .login_view {
    text-align: center;
}

.section_login input[type=number], .section_login input[type=text], .section_login input[type=password] {
    width: 100%;
    height: 54px;
    padding: 0 19px;
    border: 1px solid #ccc;
    border-radius: 3px;
    background-color: #fff;
    font-size: 14px;
    line-height: 20px;
    outline: none;
}

.section_login .checkbox_save {
    overflow: hidden;
    padding-bottom: 28px;
}

.btn_type1 {
    border: 1px solid #5f0081;
    background-color: #5f0080;
}
.btn_type1, .btn_type2 {
    display: block;
    overflow: hidden;
    width: 100%;
    height: 54px;
    border-radius: 3px;
    font-size: 0;
    text-align: center;
}

.btn_type2 {
    border: 1px solid #5f0081;
    background-color: #fff;
}
.section_login .btn_member {
    margin-top: 10px;
}
  </style>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>


    <div id="main">
<div id="content">

<div id="qnb" class="quick-navigation">
</div>
<div class="section_login">
<h3 class="tit_login">로그인</h3>
<div class="write_form">
<div class="write_view login_view">
<form class="form-horizontal" role="form" action="<%=contextPath%>/login.me" method="post">
<input type="text" name="id" size="20" tabindex="1" value="" placeholder="아이디를 입력해주세요">
<input type="password" name="password" size="20" tabindex="" placeholder="비밀번호를 입력해주세요">
<div class="checkbox_save">
<label class="label_checkbox checked">
<input type="checkbox" id="chk_security" name="chk_security" value="y" checked="checked" onchange="if( this.checked){$(this).parent().addClass('checked')}else{$(this).parent().removeClass('checked')} ">
보안접속
</label>

<div class="login_search">
<a href="" class="link">아이디 찾기</a>
<span class="bar"></span>
<a href="" class="link">비밀번호 찾기</a>
</div>
</div>
<button type="submit" class="btn_type1"><span class="txt_type">로그인</span></button>
</form>
<a href="<%=contextPath%>/insert.me" class="btn_type2 btn_member"><span class="txt_type">회원가입</span></a>
</div>
</div>
</div>


</div>
</div>
	

</body>
</html>