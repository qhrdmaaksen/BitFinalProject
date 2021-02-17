<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- whologin 변수는 로그인 상태를 저장하고 있는 변수입니다. -->
<c:set var="whologin" value="0" />
<c:if test="${empty sessionScope.loginfo}">
	<!-- 로그인 하지 않은 경우 -->
	<c:set var="whologin" value="0" />
</c:if>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.id == 'admin'}">\
		<!-- 관리자로 로그인한 경우 -->
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.id != 'admin'}">
		<!-- 일반 사용자로 로그인한 경우 -->
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>

<!-- 부트 스트랩 -->
<% int twelve = 12 ; %>
<c:set var="twelve" value="12" />
<%!
	String YesForm = null ;
	String NoForm = null ;
%>
<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/controller"; //서블릿에 정의되어 있슴
	
	//폼 태그에서 사용할 변수
	//YesForm = contextPath + mappingName ;
	
	//폼이 아닌 곳에서 사용할 변수
	//NoForm = contextPath + mappingName + "?command=" ;
%>
<%	
	// 파일 업로드 관련
	String myurl = request.getRequestURL().toString() ;
	String uri = request.getRequestURI() ;
	int idx = myurl.indexOf( uri ) ;	
	//웹서버에 올릴 이미지의 저장 경로 
	String uploadPath = "/upload" ;//개발자가 임의 지정 가능
	String uploadedFolder 
		= myurl.substring(0, idx) + contextPath + uploadPath ;	
	String realPath = application.getRealPath( uploadPath ) ;
%>
<%
	/* out.print( "YesForm : " + YesForm + "<br>") ;
	out.print( "NoForm : " + NoForm + "<br>") ;
	out.print( "myurl : " + myurl + "<br>") ;
	out.print( "uploadedFolder : " + uploadedFolder + "<br>") ;
	out.print( "realPath : " + realPath + "<br>") ; */ 
%>
<%!
	String MakeCommand(String ... args){
		if( args.length == 0 ){
			return YesForm  ;
		}else if( args.length == 1 ){
			return YesForm + "?command=" + args[0]   ;	
		}else{
			String imsi = args[1] ;
			return YesForm + "?command=" + args[0] + "&" + imsi  ;
		}
	}
%>

<c:set var="contextPath" value="<%=contextPath%>" scope="application"/> 

<!DOCTYPE>
<html>
<head>
	<title>마켓 컬리</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		/* 유효성 검사시 보여 주는 빨간색 글자를 위한 스타일 입니다. */
		.err{ 
			font-size : 10pt;
			color:red;
			font-weight: bolder;
		}
		#myalert{ 
			font-size : 15px;
			margin-top: 7px;
			margin-right: 20px;
			color:black;
		}
	</style>
	
	<style type="text/css">
	

	*{
		margin: 0; padding: 0;
	}
	

	
	
	#userMenu {
    width: 1050px;
    margin: 0 auto;
}
#userMenu * {
    font-family: noto sans;
    font-weight: 400;
    letter-spacing: -.3px;
}
	
	#userMenu .list_menu {
    float: right;
}	

#userMenu .menu {
    position: relative;
    z-index: 400;
    float: left;
}	

#userMenu .link_menu {
    float: left;
    height: 37px;
    padding: 0 22px 0 10px;
    color: #333;
    line-height: 35px;
    white-space: nowrap;
}
#userMenu .menu_join .link_menu {
    color: #5f0080;
}
#userMenu .menu_login .link_menu {
    padding: 0 16px 0 15px;
}
#userMenu .menu.lst .link_menu {
    padding-right: 13px;
}

#userMenu a {
	font-size: 13px;
}
	.wrapper{
		width: 1170px; margin: 0 auto;}
	
	.clearfix{
		content: ''; display: block; clear: both; 
	}
	
	header{
			height: 75px; background-color: #white; 
			position: fixed; width: 100%; z-index: 9999; top: 0; left: 0px; 
		}
	h1{   position: absolute;
    left: 50%;
    bottom: 6px;
    width: 200px;
    height: 50px;
    margin-left: -100px;
    color: black;}
      ul, ol, li { list-style:none; margin:0; padding:0; }
    
	 ul.menu {}
	 ul.menu > li { display:inline-block;  width:120px; padding:5px 10px; text-align:center; position:relative; font-size: 15px;}
	ul.menu > li.px{width: 150px;}
	.menu a{line-height: 75px; color: black; padding: 0 22px 0 10px;  display: block; }	
	ul{
   	list-style:none;
   	padding-left:0px;
   }
  	.mark {float: right; width: 100px;}
	.px{float: left;}
   	ul.menu > li ul.submenu {  display:none; position:absolute;  left:0;   }
   	ul.menu > li:hover ul.submenu { display:block; background-color: gray; height: 50px; }
    ul.menu > li ul.submenu > li { display:inline-block; width:150px;  background:white; text-align:center; border: 1px solid white; height: 50px;}
	 ul.menu > li ul.submenu > li:hover { background:gray;  }
	 ul.menu > li ul.submenu > li a {font-size: 12px;}
	

	</style>
	
		
</head>
<body>
<header class="header">
			<div id="userMenu">
		<ul class="list_menu">
		<c:if test="${whologin == 0}">
		<li class="menu none_sub menu_join"><a href="" class="link_menu">회원가입</a></li> 
		</c:if>
		<c:if test="${whologin == 0 }">
		<li class="menu none_sub menu_login"><a href="" class="link_menu">로그인</a> <!----></li> <!----> 
		</c:if>
		<li class="menu lst"><a href="" class="link_menu">고객센터</a> <ul class="sub">
		</ul></li></ul></div>
		
		
		
		<div class="wrapper">
		<div class="container">
			<h1>3조로고</h1>
			<nav>
				<ul class="menu"  >
					<li class="px"><a href="">전체카테고리</a>
					<ul class="submenu">
							<li><a href="">채소</a></li>
							<li><a href="">과일/견과/쌀</a></li>
							<li><a href="">수산/해산/건어물</a></li>
							<li><a href="">정육/계란</a></li>
							<li><a href="">국/반찬/메인요리</a></li>
							<li><a href="">샐러드/간편식</a></li>
						</ul></li>
					<li class="px"><a href="">베스트</a>
					<li class="px"><a href="">신상품</a></li>
					<li class="mark"><a href=""><img width="30px" height="30px" alt="" src="/WEB-INF/image/deliveryicon.png"></a>
				</ul>
				
				
			</nav>
			</div>
		</div>	
	</header>

<%-- 	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">미니 쇼핑몰</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="<%=contextPath%>/main.jsp">Home</a></li>
					
					<li>
						<a href="#" class="dropdown-toggle"> 
							<font color='white'>
								<c:if test="${whologin == 0}">
									미로그인
								</c:if> 
								<c:if test="${whologin != 0}">
									${sessionScope.loginfo.name}(${sessionScope.loginfo.id}) 님
								</c:if>
							</font>
						</a>
					</li>
					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">회원<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><c:if test="${whologin == 0}">
									<a href="<%=contextPath%>/insert.me">회원 가입</a>
								</c:if> <c:if test="${whologin != 0}">
									<a href="<%=contextPath%>/update.me?id=${sessionScope.loginfo.id}">회원 정보 수정</a>
								</c:if></li>
							<li><c:if test="${whologin == 0}">
									<a href="<%=contextPath%>/login.me">로그인</a>
								</c:if> <c:if test="${whologin != 0}">
									<a href="<%=contextPath%>/logout.me">로그 아웃</a>
								</c:if></li>
							<li><c:if test="${whologin == 1}">
									<a href="<%=contextPath%>/delete.me?id=${sessionScope.loginfo.id}">회원 탈퇴</a>
								</c:if></li>
							<li><c:if test="${whologin == 2}">
									<a href="<%=contextPath%>/list.me">회원 목록 보기</a>
								</c:if></li>
							<li><c:if test="${whologin == 1}">
									<a href="<%=contextPath%>/detailview.me?id=${sessionScope.loginfo.id}">회원 상세 보기</a>
								</c:if></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">게시물<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><c:if test="${whologin != 0}">
									<a href="<%=contextPath%>/insert.bo">게시물 등록</a>
								</c:if></li>
							<li><c:if test="${whologin != 0}">
									<a href="<%=contextPath%>/list.bo">목록 보기</a>
								</c:if></li>
							<!-- <li><a href="#">-- 아래 항목들은 어떻게 해야 하나??</a></li>
							<li><a href="#">게시물 수정</a></li>
							<li><a href="#">게시물 삭제</a></li>
							<li><a href="#">상세 보기</a></li>
							<li><a href="#">답글 작성</a></li> -->
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">상품<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><c:if test="${whologin == 2}">
									<a href="<%=contextPath%>/insert.pr">상품 등록</a>
								</c:if></li>
							<li><a href="<%=contextPath%>/list.pr">목록 보기</a></li>
							<!-- <li><a href="#">-- 아래 항목들은 어떻게 해야 하나??</a></li>
							<li><a href="#">목록 삭제</a></li>
							<li><a href="#">정보 수정</a></li>
							<li><a href="./../example/detailViewEx01.jsp">상세 보기</a></li> -->
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">쇼핑몰<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><c:if test="${whologin != 0}">
									<a href="<%=contextPath%>/history.mall">나의 쇼핑 내역</a>
								</c:if></li>
							<li><c:if test="${whologin != 0}">
									<a href="<%=contextPath%>/list.mall">장바구니 보기</a>
								</c:if></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">데이터 보기<b class="caret"></b></a>
						<ul class="dropdown-menu">							
							<li><a href="<%=contextPath%>/exam01.vw">회원과 게시물</a></li>
							<li><a href="<%=contextPath%>/exam02.vw">회원별 게시물 건수</a></li>
							<li><a href="<%=contextPath%>/exam03.vw">주문 정보</a></li>
							<li><a href="<%=contextPath%>/exam04.vw">고객별 매출 총액</a></li>
							<li><a href="<%=contextPath%>/exam05.vw">회원별 주문 건수</a></li>
													
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><c:if test="${empty sessionScope.loginfo}">
							<a href="<%=contextPath%>/login.me"><span
								class="glyphicon glyphicon-log-in"> 로그인 </span> </a>
						</c:if> <c:if test="${not empty sessionScope.loginfo}">
							<a href="<%=contextPath%>/logout.me"><span
								class="glyphicon glyphicon-log-in"> 로그 아웃 </span> </a>
						</c:if></li>
				</ul>
			</div>
		</div> 
	</nav>--%>
	<c:if test="${not empty requestScope.errmsg}">
		<div class="alert alert-danger alert-dismissable">
    		<a href="#" id="myalert" class="close" data-dismiss="alert" aria-label="close">닫기</a>
    		<strong>${requestScope.errmsg}</strong>
		</div>
	</c:if>
	<c:if test="${not empty sessionScope.message}">
		<script type="text/javascript">
			/* alert('${sessionScope.message}') ;	 */ 
		</script>
		<% session.removeAttribute("message") ; %>
	</c:if>	
</body>
</html>