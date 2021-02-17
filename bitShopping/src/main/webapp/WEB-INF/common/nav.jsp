<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title> 상단로고 </title>
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
			height: 75px; background-color: #white; border: 1px solid #253342;
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
	 ul.menu > li { display:inline-block;  width:80px; padding:5px 10px; text-align:center; position:relative; font-size: 15px;}
	ul.menu > li.px{width: 130px;}
	.menu a{line-height: 75px; color: black; padding: 0 22px 0 10px;  display: block; }	
	ul{
   list-style:none;
   padding-left:0px;
   }
  	.mark {float: right; width: 100px;}
   	ul.menu > li ul.submenu {  display:none; position:absolute;  left:0;   }
   	ul.menu > li:hover ul.submenu { display:block; background-color: gray; height: 50px; }
    ul.menu > li ul.submenu > li { display:inline-block; width:150px;  background:white; text-align:center; border: 1px solid white; height: 50px;}
	 ul.menu > li ul.submenu > li:hover { background:gray;  }
	 ul.menu > li ul.submenu > li a {font-size: 12px;}
	
	.secondmenu{
		float: right ;
		font-size: 15px;
	}
	</style>

</head>
<body>

	<header>
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
	</header>
</body>
</html>