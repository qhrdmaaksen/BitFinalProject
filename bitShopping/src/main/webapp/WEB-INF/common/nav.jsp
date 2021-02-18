<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title> 상단로고 </title>


	<style type="text/css">
		/* 유효성 검사시 보여 주는 빨간색 글자를 위한 스타일 입니다. */
		/*여기 스타일에는 회원가입에 필요한 css 스타일 공간, 유효성 검사 css 및 필수 입력 사항 * red css 사용등등  */
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
		.redPrefix{
			color: red ; 
		}
	</style>	
	<style type="text/css">
	
	body .header{
		margin-top: 50px;
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
	
	.header{
			height: 75px; background-color: #white; position: static;
			width: 100%; z-index: 9999; left: 0px; margin-top: 50px;
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
	.px{float: left; border: 1px; }
   	ul.menu > li ul.submenu {  display:none; position:absolute;  left:0;   }
   	ul.menu > li:hover ul.submenu { display:block; background-color: gray; height: 50px; }
    ul.menu > li ul.submenu > li { display:inline-block; width:150px;  background:white; text-align:center; border: 1px solid white; height: 50px;}
	 ul.menu > li ul.submenu > li:hover { background:gray;  }
	 ul.menu > li ul.submenu > li a {font-size: 12px;}
	

	/* 추가 */
	 .container #headerLogo{position:relative;width:1050px;height:63px;margin-top:0px;}
	  .container #headerLogo .bnr_delivery{position:absolute;left:-1px;top:-28px;margin:auto;height:22px}
	  .container #headerLogo .bnr_delivery img{width:163px;height:22px}
	  .container #headerLogo .logo{position:absolute;left:50%;bottom:6px;width:200px;height:79px;margin-left:-100px}
	  .container #headerLogo .logo img{display:block;width:103px;height:79px;margin:0 auto}
	  .container #headerLogo .logo #gnbLogoContainer {margin:0 auto} 
	


	</style>
<c:set var="contextPath" value="<%=contextPath%>" scope="application"/> 
</head>
<body>

<header class="header">
	<div id="userMenu">
		<ul class="list_menu">
		<c:if test="${whologin == 0}">
		<li class="menu none_sub menu_join"><a href="<%=contextPath%>/insert.me" class="link_menu">회원가입</a></li> 
		</c:if>
		<c:if test="${whologin == 0 }">
		<li class="menu none_sub menu_login"><a href="" class="link_menu">로그인</a> <!----></li> <!----> 
		</c:if>
		<li class="menu lst"><a href="" class="link_menu">고객센터</a> <ul class="sub">
		</ul></li></ul>
	</div>
		
		
	<div class="container">
		<div id="headerLogo" class="layout-wrapper">
			<h1 class="logo">
				<a href="https://www.kurly.com/shop/main/index.php" class="link_main">
					<span id="gnbLogoContainer"></span>
					<img src="https://res.kurly.com/images/marketkurly/logo/logo_x2.png" alt="마켓컬리 로고" style="display: block;">
				</a>
			</h1>
			<a href="/shop/board/view.php?id=notice&amp;no=64" class="bnr_delivery">
				<img src="https://res.kurly.com/pc/service/common/1908/delivery_190819.gif" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송">
			</a>
		</div>
			<nav class="navi">
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
					<li class="mark"><a href=""><img width="20px" height="30px" alt="" src="/WEB-INF/image/deliveryicon.png"></a>
				</ul>
			</nav>
		</div>
		
</header>

<%-- 	<header>
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
					<li><a href="">베스트</a>
					<li ><a href="">신상품</a></li>
					<li class="mark"><a href=""><img width="50px" height="30px" alt="" src="/WEB-INF/image/shoppingcartoutline_110834.png"></a>
				</ul>
				
				
			</nav>
			</div>
		</div>	
	</header> --%>
</body>
</html>