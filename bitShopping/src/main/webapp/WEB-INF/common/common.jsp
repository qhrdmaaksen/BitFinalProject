<%@page import="org.springframework.web.context.annotation.SessionScope"%>
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
	<c:if test="${sessionScope.loginfo.mid == 'admin'}">\
		<!-- 관리자로 로그인한 경우 -->
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.mid != 'admin'}">
		<!-- 일반 사용자로 로그인한 경우 -->
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>


<!-- 네비게이션 안에 장바구니 품목 갯수 구하기 -->
<c:set var="cnt" value="0"/>
<c:if test="${not empty sessionScope.pcnt}">
	<!-- 로그인 하지 않은 경우 -->
	<c:set var="cnt" value="${sessionScope.pcnt}" />
</c:if>


<!-- 부트 스트랩 -->
<% int twelve = 12 ; %>
<c:set var="twelve" value="12" />
<%!
	String YesForm = null ;
	String NoForm = null ;
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
<title> 마켓컬리 :: 내일의 장보기, 마켓컬리 </title>

<c:set var="contextPath" value="<%=contextPath%>" scope="application"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	 <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=contextPath%>/resources/assets/img/favicon.png">
    <!-- all css here -->
   <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/bootstrap.min.css">
     <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/animate.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/chosen.min.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/fontawesome-all.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/ionicons.min.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/material-design-iconic-font.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/meanmenu.min.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/tippy.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/bundle.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/style.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/responsive.css"> 
    <script src="<%=contextPath%>/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <style type="text<%=contextPath%>/resources/assets/css">
    </style>
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
		width: 100%;
		position : relative;
		z-index : 9999;
	}
	form {
	    display: block;
	    margin-top: 0em;
	}
	a {
	    background-color: transparent;
	    text-decoration: none;
	    color: inherit;
	}
	h1{   
		position: absolute;
	    left: 50%;
	    bottom: 6px;
	    width: 200px;
	    height: 50px;
	    margin-left: -100px;
	    color: black;} 
	ol, ul {
	    list-style-type: none;
	}
	.row {
	    display: inline-block !important;
	    width: 100%
	}
	.wrapper{
		height: 120px;
	}
	.hdr_1 .container-fluid {
	    padding-left: 10px;
	    padding-right: 30px;
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
	#gnb .gnb_main .menu1 a.on .txt, #gnb .gnb_main .menu1 a:hover .txt, #gnb .gnb_main .menu1 .txt {
	    float: left;
	    font-weight: 700;
	    border-bottom: 0;
	}

	/* 추가 */
	.container #headerLogo{position:relative;width:1050px;height:63px;margin-top:0px;}
	.container #headerLogo .bnr_delivery{position:absolute;left:-1px;top:-28px;margin:auto;height:22px}
	.container #headerLogo .bnr_delivery img{width:163px;height:22px}
	.container #headerLogo .logo{position:absolute;left:50%;bottom:6px;width:200px;height:79px;margin-left:-100px}
	.container #headerLogo .logo img{display:block;width:103px;height:79px;margin:0 auto}
	.container #headerLogo .logo #gnbLogoContainer {margin:0 auto} 

	</style>
	
</head>
<body>

<header class="header">
	<div id="userMenu">
		<ul class="list_menu">
		<c:if test="${whologin == 0}">
			<li class="menu none_sub menu_join"><a href="<%=contextPath%>/insert.me" class="link_menu">회원가입</a></li> 
		</c:if>
		<c:if test="${whologin == 0 }">
			<li class="menu none_sub menu_login"><a href="<%=contextPath%>/login.me" class="link_menu">로그인</a> <!----></li> <!----> 
		</c:if>
		<c:if test="${whologin != 0 }">
			<li class="menu none_sub menu_login"><a href="<%=contextPath%>/logout.me" class="link_menu">로그아웃</a> <!----></li> <!----> 
		</c:if>
		<li class="menu lst"><a href="" class="link_menu">고객센터</a> <ul class="sub">
		</ul></li></ul>
	</div>
		
	<div class="container">
		<div id="headerLogo" class="layout-wrapper">
			<h1 class="logo">
				<a href="<%=contextPath%>/main.cu" class="link_main">
					<span id="gnbLogoContainer"></span>
					<img src="https://res.kurly.com/images/marketkurly/logo/logo_x2.png" alt="마켓컬리 로고" style="display: block;">
				</a>
			</h1>
			<a href="/shop/board/view.php?id=notice&amp;no=64" class="bnr_delivery">
				<img src="https://res.kurly.com/pc/service/common/1908/delivery_190819.gif" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송">
			</a>
		</div>
		
		<!-- <div id="gnb" class=""> -->
			 <div class="wrapper">
        <!-- header start -->
        <header>
            <div class="header_area hdr_1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10 col-xs-12">
                            <div class="main_menu_area">
                                <div class="main-menu">
									<nav>
                                            <ul>
                                                <li><a href="#">Features <i class="ion-ios-arrow-down"></i></a>
                                                    <ul class="mega-menu">
                                                        <li>
                                                            <ul>
                                                                <li class="mega-menu-title">Pages</li>
                                                                <li><a href="portfolio.html"> portfolio</a></li>
                                                                <li><a href="service.html"> service One</a></li>
                                                                <li><a href="service-2.html"> service Two</a></li>
                                                                <li><a href="<%=contextPath%>/faq.sr"> FAQ Page</a></li>
                                                                <li><a href="404.html"> 404 Error </a></li>
                                                                <li><a href="single-blog.html"> single blog</a></li>
                                                            </ul>
                                                        </li>
                                                        <!-- <li> 드롭다운 목록 일단 줄여 놓았습니다.
                                                            <ul>
                                                                <li class="mega-menu-title">special pages</li>
                                                                <li><a href="cart.html"> cart page</a></li>
                                                                <li><a href="checkout.html"> Checkout Page</a></li>
                                                                <li><a href="login-register.html"> login register</a></li>
                                                                <li><a href="my-account.html"> my account Page</a></li>
                                                                <li><a href="wishlist.html"> wishlist Page</a></li>
                                                                <li><a href="product-details.html"> product details </a></li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <ul>
                                                                <li class="mega-menu-title">products</li>
                                                                <li><a href="product-details.html">Awesome wood chair</a></li>
                                                                <li><a href="product-details.html">Good product name</a></li>
                                                                <li><a href="product-details.html">Another Product name</a></li>
                                                                <li><a href="product-details.html">test Producr name</a></li>
                                                            </ul> 
                                                        </li> -->
                                                        
                                                        <!-- <li class="mega-menu-img"> 드롭다운 하단에 사진 넣게되면 넣을 공간
                                                            <ul>
                                                                <li><a class="dot-none" href="shop.html"><img alt="" src="<%=contextPath%>/resources/assets/img/banner/17.jpg"></a></li>
                                                            </ul>
                                                        </li> -->
                                                        
                                                    </ul>
                                                </li>
												
                                                <li><a href="about-us.html">about us </a></li>
												
                                                <li><a href="<%=contextPath%>/plist.pr">Shop</a></li>
						
                                                <li><a href="contact.html">contact us</a></li>
                                            </ul>
                                        </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 col-xs-12">
                            <div class="header-site-icon">
                                <div class="header-search same-style">
                                    <div class="sidebar-trigger-search">

                                        <span class="zmdi zmdi-search"></span>
                                        <div class="search__form">
                                            <form>
                                                <div class="form-search">
                                                    <input type="search" placeholder="Enter your search..." value="" class="input-text" id="search">
                                                    <button>
                                                        <i class="zmdi zmdi-search"></i>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="header-cart same-style">
                                    <div class="sidebar-trigger">
                                        <ul>
                                            <li>
                                                <a href="<%=contextPath%>/list.mall">
                                                    <i class="zmdi zmdi-shopping-cart-plus"></i>
                                                    <span class="count-style">
	                                                  	${pcnt}
                                                    </span>
                                                </a>

                                                <%--<ul class="ht-dropdown main-cart-box">
                                                    <li>
                                                        <!-- Cart Box Start -->
                                                         <div class="single-cart-box">
                                                            <div class="cart-img">
                                                                <a href="#">
                                                                    <img alt="cart-image" src="<%=contextPath%>/resources/assets/img/products/mini1.jpg">
                                                                </a>
                                                            </div>
                                                            <div class="cart-content">
                                                                <h6>
                                                                    <a href="product.html">Alpha Block Black Polo</a>
                                                                </h6>
                                                                <span class="quantitys">Qty: 1</span>
                                                                <span>$399.00</span>
                                                            </div>
                                                            <a href="#" class="del-icone">
                                                                <i class="zmdi zmdi-close"></i>
                                                            </a>
                                                        </div>
                                                        <!-- Cart Box End -->
                                                        <!-- Cart Box Start -->
                                                        <div class="single-cart-box">
                                                            <div class="cart-img">
                                                                <a href="#">
                                                                    <img alt="cart-image" src="<%=contextPath%>/resources/assets/img/products/mini2.jpg">
                                                                </a>
                                                            </div>
                                                            <div class="cart-content">
                                                                <h6>
                                                                    <a href="product.html">Red Printed Round Neck</a>
                                                                </h6>
                                                                <span class="quantitys">Qty: 1</span>
                                                                <span>$299.00</span>
                                                            </div>
                                                            <a href="#" class="del-icone">
                                                                <i class="zmdi zmdi-close"></i>
                                                            </a>
                                                        </div>
                                                        <!-- Cart Box End -->
                                                        <!-- Cart Footer Inner Start -->
                                                        <div class="cart-footer fix">
                                                            <h5>Subtotal :
                                                                <span class="f-right">$698.00</span>
                                                            </h5>
                                                            <div class="cart-actions">
                                                                <a href="cart.html" class="checkout">View cart</a>
                                                                <a href="checkout.html" class="checkout">Checkout</a>
                                                            </div>
                                                        </div> 
                                                        <!-- Cart Footer Inner End -->
                                                    </li>
                                                </ul>--%>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
      </div>
		
 <!-- all js here -->
    <script src="<%=contextPath%>/resources/assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/popper.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/bootstrap.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/isotope.pkgd.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/jquery.counterup.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/waypoints.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/tippy.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/ajax-mail.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/owl.carousel.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/plugins.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/main.js"></script>		
		
	</div>
		
		
</header>

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