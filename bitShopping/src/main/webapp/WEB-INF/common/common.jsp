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
	
	
/* 	
	.wrapper{
		width: 1170px; margin: 0 auto;}
	
	.clearfix{
		content: ''; display: block; clear: both; 
	}
	
	.header{
		height: 75px; background-color: #white; position: static;
		width: 100%; z-index: 9999; left: 0px; margin-top: 50px;
	}*/
	
	body .header{
		margin-top: 50px;
		width: 100%;
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


	<!--===========================================================-->
	
	.screen_out {
    display: block;
    overflow: hidden;
    position: absolute;
    left: -9999px;
    width: 1px;
    height: 1px;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
	}
	#gnb .gnb_kurly {
	    position: relative;
	    z-index: 300;
	    min-width: 1050px;
	    background-color: #fff;
	    font-family: 'Noto Sans';
	    letter-spacing: -0.3px;
	}
	#gnb .inner_gnb kurly {
	    position: relative;
	    width: 1050px;
	    height: 56px;
	    margin: 0 auto;
	}
	#gnb .gnb_main {
	    overflow: hidden;
	    width: 1050px;
	    margin: 0 auto;
	}
	#gnb .gnb_main .gnb {
	    float: left;
	    width: 100%;
	}

	#gnb .gnb_main .gnb li {
	    float: left;
	}
	
	#gnb .gnb_main .gnb a {
	    overflow: hidden;
	    float: left;
	    width: 124px;
	    height: 55px;
	    padding: 16px 0 0;
	    font-size: 16px;
	    color: #333;
	    line-height: 20px;
	    text-align: center;
	    text-decoration: none;
	}
	#gnb .gnb_main .menu1 a {
	    width: 168px;
	}
	/* @media only screen and (-webkit-min-device-pixel-ratio: 1.5), not all, only screen and (min-resolution: 1.5dppx) */
	
	#gnb .gnb_main .menu1 .ico {
	    background: url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off_x2.png) no-repeat 0 0;
	    background-size: 16px 14px;
	}
	#gnb .gnb_main .menu1 .ico {
	    float: left;
	    width: 16px;
	    height: 14px;
	    margin: 5px 14px 0 0;
	    background: url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off.png) no-repeat;
	}
	#gnb .gnb_main .gnb a .txt {
	    font-weight: 700;
	}
	#gnb .gnb_main .gnb .lst {
	    background: none;
	}
	#gnb .gnb_main .lst a {
	    width: 116px;
	}
	#gnb .gnb_search {
	    position: absolute;
	    right: 108px;
	    top: 10px;
	    width: 242px;
	}
	.gnb_search .init .btn_delete {
	    overflow: hidden;
	    position: absolute;
	    left: 170px;
	    top: -36px;
	    width: 36px;
	    height: 36px;
	    border: 0 none;
	    background: url(https://res.kurly.com/pc/ico/2010/ico_search_del.svg) no-repeat 50% 50%;
	    background-size: 12px 12px;
	    font-size: 0;
	    line-height: 0;
	    text-indent: -9999px;
	    opacity: 0;
	}
	button {
	    outline: none;
	}
	#gnb .cart_count {
	    position: absolute;
	    right: -5px;
	    top: 10px;
	}
	#gnb .cart_count .inner_cartcount {
	    text-align: center;
	    font-weight: 400;
	}
	#gnb .cart_count .msg_cart {
	    display: none;
	    position: absolute;
	    right: -7px;
	    top: 61px;
	    width: 348px;
	    border: 1px solid #ddd;
	    background-color: #fff;
	    /* opacity: 0; */
	}
	#gnb .btn_location.on {
	    background-image: url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting.svg?ver=1);
	}
	
	#gnb .btn_location {
	    overflow: hidden;
	    position: absolute;
	    right: 51px;
	    top: 10px;
	    width: 36px;
	    height: 36px;
	    border: 0 none;
	    background: url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting_done.svg) no-repeat 50% 50%;
	    font-size: 0;
	    text-indent: -9999px;
	}
	#gnb .layer_location * {
	    font-weight: 700;
	    font-size: 16px;
	    color: #333;
	    line-height: 24px;
	    letter-spacing: -0.3px;
	}
	#gnb .layer_location .star {
	    color: #5f0080;
	}
	#gnb .gnb_sub {
	    display: none;
	    overflow: hidden;
	    position: absolute;
	    z-index: 301;
	    left: 0;
	    top: 55px;
	    width: 213px;
	    padding-top: 1px;
	}
	#gnb .cart_count .num {
	    display: none;
	    position: absolute;
	    left: 19px;
	    top: -1px;
	    min-width: 20px;
	    height: 20px;
	    padding: 0 5px;
	    border: 2px solid #fff;
	    border-radius: 10px;
	    background-color: #5f0080;
	    font-size: 9px;
	    color: #fff;
	    line-height: 15px;
	    text-align: center;
	    white-space: nowrap;
	}
	#gnb .cart_count .btn_cart {
	    display: block;
	    width: 36px;
	    height: 36px;
	    background: url(https://res.kurly.com/pc/service/common/2011/ico_cart.svg) no-repeat 50% 50%;
	}
	#gnb .gnb_search .inp_search {
	    width: 242px;
	    height: 36px;
	    padding: 0 60px 0 14px;
	    border: 1px solid #f7f7f6;
	    border-radius: 18px;
	    background-color: #f7f7f7;
	    font-family: 'Noto Sans';
	    font-weight: 400;
	    font-size: 12px;
	    color: #666;
	    line-height: 16px;
	    outline: none;
	}
	#gnb .gnb_search .btn_search {
	    position: absolute;
	    right: 5px;
	    top: 3px;
	    width: 30px;
	    height: 30px;
	}
	#gnb .gnb_sub .gnb_menu {
	    width: 219px;
	}
	#gnb .gnb_sub .inner_sub {
	    width: 100%;
	    border: 1px solid #ddd;
	    background: url(https://res.kurly.com/pc/service/common/1908/bg_gnb_sub_v3.png) repeat-y 0 0;
	}
	header .container a{
		text-decoration: none;
	}




	
	    
	    
	    
	<!--===========================================================-->    
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
	
	<script src="/common_js/gnb_v1.js?ver=1.26.6"></script>
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
		
		<div id="gnb" class="">
			<!-- <h2 class="screen_out">메뉴</h2> -->
				<div id="gnbMenu" class="gnb_kurly"><div class="inner_gnbkurly">
					<div class="gnb_main">
						<ul class="gnb">
							<li class="menu1">
								<a href="#none"><span class="ico"></span>
								<span class="txt">전체 카테고리</span></a></li> 
							<li class="menu2">
								<a href="/shop/goods/goods_list.php?category=038" class="link new ">
								<span class="txt">신상품</span></a></li> 
							<li class="menu3">
								<a href="/shop/goods/goods_list.php?category=029" class="link best ">
								<span class="txt">베스트</span></a></li> 
							<li class="menu4">
								<a href="/shop/goods/goods_list.php?list=sale" class="link bargain ">
								<span class="txt">알뜰쇼핑</span></a></li> 
							<li class="lst">
								<a href="/shop/goods/event.php?&amp;" class="link event ">
								<span class="txt">금주혜택</span></a></li>
						</ul> 
					<div id="side_search" class="gnb_search">
						<form action="/shop/goods/goods_search.php?&amp;" onsubmit="return searchTracking(this)">
							<input type="hidden" name="searched" value="Y"> 
							<input type="hidden" name="log" value="1"> 
							<input type="hidden" name="skey" value="all"> 
							<input type="hidden" name="hid_pr_text" value=""> 
							<input type="hidden" name="hid_link_url" value=""> 
							<input type="hidden" id="edit" name="edit" value=""> 
							<input name="sword" type="text" id="" value="" required="required" label="검색어" class="inp_search"> 
							<input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search"> 
								<div class="init">
									<button type="button" id="searchInit" class="btn_delete">검색어 삭제하기</button>
								</div>
						</form>
					</div> 
						<div class="cart_count">
							<div class="inner_cartcount">
								<a href="/shop/goods/goods_cart.php" class="btn_cart">
									<!-- <span class="screen_out">장바구니</span>  -->
									<span id="cart_item_count" class="num realtime_cartcount ten" style="display: inline;">51</span>
								</a>
							</div> 
								<div id="addMsgCart" class="msg_cart">
									<span class="point"></span> 
									<div class="inner_msgcart">
									<img src="https://res.kurly.com/images/common/bg_1_1.gif" alt="" class="thumb"> 
										<p id="msgReaddedItem" class="desc">
											<span class="tit"></span> 
												<span class="txt">장바구니에 상품을 담았습니다.
													<span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span>
												</span>
										</p>
									</div>
								</div>
							</div>
					
					
			<!--  <div class="location_set">
			 	<button type="button" class="btn_location on">배송지 설정하기</button> 
			 		<div class="layer_location">
			 			<div class="address">        
			 				<div class="address">        
			 					<p class="addr">경기 광명시 신촌로 49 (신촌휴먼시아1단지아파트) 108동 502호</p>        
			 						<span class="delivery star">샛별배송</span>        
			 						<a href="#none" class="btn default modifyAddress">배송지 변경</a>        
			 				</div>      
			 			</div>
			 		</div>
			 </div> -->
		 </div>
			 
			 
			 
		  <div class="gnb_sub">
		  	<div class="inner_sub">
		  		<ul data-default="219" data-min="219" data-max="731" class="gnb_menu" style="height: auto;">
		  			<li><a class="menu">
		  				<span class="ico">
		  					<img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt="카테고리 아이콘" class="ico_off"> 
		  					<img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt="카테고리 아이콘" class="ico_on"></span> 
		  						<span class="tit"><span class="txt">채소</span><!----></span>
		  				</a> 
						<ul class="sub_menu">
							<li><a class="sub"><span class="name">고구마·감자·당근</span></a> <!----></li>
							<li><a class="sub"><span class="name">시금치·쌈채소·나물</span></a> <!----></li>
							<li><a class="sub"><span class="name">브로콜리·파프리카·양배추</span></a> <!----></li>
							<li><a class="sub"><span class="name">양파·대파·마늘·배추</span></a> <!----></li>
							<li><a class="sub"><span class="name">오이·호박·고추</span></a> <!----></li>
							<li><a class="sub"><span class="name">냉동·이색·간편채소</span></a> <!----></li>
							<li><a class="sub"><span class="name">콩나물·버섯</span></a> <!----></li>
						</ul>
					</li>
					<li><a class="menu">
						<span class="ico">
						<img src="https://img-cf.kurly.com/shop/data/category/icon_fruit_inactive_pc@2x.1568684150.png" alt="카테고리 아이콘" class="ico_off"> 
						<img src="https://img-cf.kurly.com/shop/data/category/icon_fruit_active_pc@2x.1568684150.png" alt="카테고리 아이콘" class="ico_on"></span>
							<span class="tit"><span class="txt">과일·견과·쌀</span> <!----></span>
					   </a> 
					   <ul class="sub_menu">
					   		<li><a class="sub"><span class="name">제철과일</span></a> <!----></li>
					   		<li><a class="sub"><span class="name">국산과일</span></a> <!----></li>
					   		<li><a class="sub"><span class="name">수입과일</span></a> <!----></li>
					   		<li><a class="sub"><span class="name">간편과일</span></a> <!----></li>
					   		<li><a class="sub"><span class="name">냉동·건과일</span></a> <!----></li>
					   		<li><a class="sub"><span class="name">견과류</span></a> <!----></li>
					   		<li><a class="sub"><span class="name">쌀·잡곡</span></a> <!----></li>
					   	</ul>
					</li>
					<li><a class="menu">
						<span class="ico">
						<img src="https://img-cf.kurly.com/shop/data/category/icon_seafood_inactive_pc@2x.1568684352.png" alt="카테고리 아이콘" class="ico_off"> 
						<img src="https://img-cf.kurly.com/shop/data/category/icon_seafood_active_pc@2x.1568684353.png" alt="카테고리 아이콘" class="ico_on"></span> 
							<span class="tit"><span class="txt">수산·해산·건어물</span> <!----></span>
						</a> 
						<ul class="sub_menu">
							<li><a class="sub"><span class="name">제철수산</span></a> <!----></li>
							<li><a class="sub"><span class="name">생선류</span></a> <!----></li>
							<li><a class="sub"><span class="name">굴비·반건류</span></a> <!----></li>
							<li><a class="sub"><span class="name">오징어·낙지·문어</span></a> <!----></li>
							<li><a class="sub"><span class="name">새우·게·랍스터</span></a> <!----></li>
							<li><a class="sub"><span class="name">해산물·조개류</span></a> <!----></li>
							<li><a class="sub"><span class="name">수산가공품</span></a> <!----></li>
							<li><a class="sub"><span class="name">김·미역·해조류</span></a> <!----></li>
							<li><a class="sub"><span class="name">건어물·다시팩</span></a> <!----></li>
						</ul>
					</li>
					<li><a class="menu">
						<span class="ico">
						<img src="https://img-cf.kurly.com/shop/data/category/icon_meat_inactive_pc@2x.1568684452.png" alt="카테고리 아이콘" class="ico_off"> 
						<img src="https://img-cf.kurly.com/shop/data/category/icon_meat_active_pc@2x.1568684452.png" alt="카테고리 아이콘" class="ico_on"></span> 
							<span class="tit"><span class="txt">정육·계란</span> <!----></span>
						</a> 
						<ul class="sub_menu">
							<li><a class="sub"><span class="name">국내산 소고기</span></a> <!----></li>
							<li><a class="sub"><span class="name">수입산 소고기</span></a> <!----></li>
							<li><a class="sub"><span class="name">돼지고기</span></a> <!----></li>
							<li><a class="sub"><span class="name">계란류</span></a> <!----></li>
							<li><a class="sub"><span class="name">닭·오리고기</span></a> <!----></li>
							<li><a class="sub"><span class="name">양념육·돈까스</span></a> <!----></li>
							<li><a class="sub"><span class="name">양고기</span></a> <!----></li>
						</ul>
					</li>
					<li><a class="menu">
						<span class="ico">
						<img src="https://img-cf.kurly.com/shop/data/category/icon_side_inactive_pc@2x.1572243579.png" alt="카테고리 아이콘" class="ico_off"> 
						<img src="https://img-cf.kurly.com/shop/data/category/icon_side_active_pc@2x.1572243579.png" alt="카테고리 아이콘" class="ico_on"></span> 
							<span class="tit"><span class="txt">국·반찬·메인요리</span> <!----></span>
						</a> 
						<ul class="sub_menu">
							<li><a class="sub"><span class="name">국·탕·찌개</span></a> <!----></li>
							<li><a class="sub"><span class="name">밀키트·메인요리</span></a> <!----></li>
							<li><a class="sub"><span class="name">밑반찬</span></a> <!----></li>
							<li><a class="sub"><span class="name">김치·젓갈·장류</span></a> <!----></li>
							<li><a class="sub"><span class="name">두부·어묵·부침개</span></a> <!----></li>
							<li><a class="sub"><span class="name">베이컨·햄·통조림</span></a> <!----></li>
						</ul>
					</li>
					<li><a class="menu">
						<span class="ico">
						<img src="https://img-cf.kurly.com/shop/data/category/icon_convenient_inactive_pc@2x.1572243542.png" alt="카테고리 아이콘" class="ico_off"> 
						<img src="https://img-cf.kurly.com/shop/data/category/icon_convenient_active_pc@2x.1572243543.png" alt="카테고리 아이콘" class="ico_on"></span> 
							<span class="tit"><span class="txt">샐러드·간편식</span> <!----></span>
						</a> 
						<ul class="sub_menu">
							<li><a class="sub"><span class="name">샐러드·닭가슴살</span></a> <!----></li>
							<li><a class="sub"><span class="name">도시락·밥류</span></a> <!----></li>
							<li><a class="sub"><span class="name">파스타·면류</span></a> <!----></li>
							<li><a class="sub"><span class="name">떡볶이·튀김·순대</span></a> <!----></li>
							<li><a class="sub"><span class="name">피자·핫도그·만두</span></a> <!----></li>
							<li><a class="sub"><span class="name">폭립·떡갈비·안주</span></a> <!----></li>
							<li><a class="sub"><span class="name">죽·스프·카레</span></a> <!----></li>
							<li><a class="sub"><span class="name">선식·시리얼</span></a> <!----></li>
						</ul>
					</li>
					<li><a class="menu">
						<span class="ico">
							<img src="https://img-cf.kurly.com/shop/data/category/icon_sauce_inactive_pc@2x.1572243594.png" alt="카테고리 아이콘" class="ico_off"> 
							<img src="https://img-cf.kurly.com/shop/data/category/icon_sauce_active_pc@2x.1572243594.png" alt="카테고리 아이콘" class="ico_on"></span> 
							<span class="tit"><span class="txt">면·양념·오일</span> <!----></span>
						</a> 
						<ul class="sub_menu">
							<li><a class="sub"><span class="name">파스타·면류</span></a> <!----></li>
							<li><a class="sub"><span class="name">식초·소스·드레싱</span></a> <!----></li>
							<li><a class="sub"><span class="name">양념·액젓·장류</span></a> <!----></li>
							<li><a class="sub"><span class="name">식용유·참기름·오일</span></a> <!----></li>
							<li><a class="sub"><span class="name">소금·설탕·향신료</span></a> <!----></li>
							<li><a class="sub"><span class="name">밀가루·가루·믹스</span></a> <!----></li>
						</ul>넹~~
					</li>
					<li><a class="menu">
							<span class="ico">
							<img src="https://img-cf.kurly.com/shop/data/category/icon_snacks_inactive_pc@2x.1572243615.png" alt="카테고리 아이콘" class="ico_off"> 
							<img src="https://img-cf.kurly.com/shop/data/category/icon_snacks_active_pc@2x.1572243616.png" alt="카테고리 아이콘" class="ico_on"></span> 
							<span class="tit"><span class="txt">생수·음료·우유·커피</span> <!----></span>
						</a> 
						<ul class="sub_menu">
							<li><a class="sub"><span class="name">생수·탄산수</span></a> <!----></li>
							<li><a class="sub"><span class="name">음료·주스</span></a> <!----></li>
							<li><a class="sub"><span class="name">우유·두유·요거트</span></a> <!----></li>
							<li><a class="sub"><span class="name">커피</span></a> <!----></li>
							<li><a class="sub"><span class="name">차</span></a> <!----></li>
						</ul>
					</li>
					
					<!-- <li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_cookie_inactive_pc.1610074008.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_cookie_active_pc.1610074008.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">간식·과자·떡</span></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">과자·스낵·쿠키</span></a></li><li><a class="sub"><span class="name">초콜릿·젤리·캔디</span></a></li><li><a class="sub"><span class="name">떡·한과</span></a></li><li><a class="sub"><span class="name">아이스크림</span></a></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_deli_inactive_pc@2x.1568687352.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_deli_active_pc@2x.1568687352.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">베이커리·치즈·델리</span></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">식빵·빵류</span></a></li><li><a class="sub"><span class="name">잼·버터·스프레드</span></a></li><li><a class="sub"><span class="name">케이크·파이·디저트</span></a></li><li><a class="sub"><span class="name">치즈</span></a></li><li><a class="sub"><span class="name">델리</span></a></li><li><a class="sub"><span class="name">올리브·피클</span></a></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_health_inactive_pc@2x.1574645922.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_health_active_pc@2x.1574645923.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">건강식품</span></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">영양제</span></a></li><li><a class="sub"><span class="name">유산균</span></a></li><li><a class="sub"><span class="name">홍삼·인삼·꿀</span></a></li><li><a class="sub"><span class="name">건강즙·건강음료</span></a></li><li><a class="sub"><span class="name">건강분말·건강환</span></a></li><li><a class="sub"><span class="name">다이어트·이너뷰티</span></a></li><li><a class="sub"><span class="name">유아동</span></a></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_living_inactive_pc@2x.1588814089.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_living_active_pc@2x.1588814090.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">생활용품·리빙</span></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">휴지·티슈</span></a></li><li><a class="sub"><span class="name">여성·위생용품</span></a></li><li><a class="sub"><span class="name">세제·청소용품</span></a></li><li><a class="sub"><span class="name">화훼·인테리어소품</span></a></li><li><a class="sub"><span class="name">의약외품·마스크</span></a></li><li><a class="sub"><span class="name">생활잡화·문구</span></a></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_beauty_inactive_pc@2x.1588750188.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_beauty_active_pc@2x.1588750188.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">뷰티·바디케어</span></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">스킨케어</span></a></li><li><a class="sub"><span class="name">구강·면도</span></a></li><li><a class="sub"><span class="name">바디·제모</span></a></li><li><a class="sub"><span class="name">헤어케어</span></a></li><li><a class="sub"><span class="name">미용기기·소품</span></a></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_kitchen_inactive_pc@2x.1574646457.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_kitchen_active_pc@2x.1574646458.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">주방용품</span></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">주방소모품·잡화</span></a></li><li><a class="sub"><span class="name">주방·조리도구</span></a></li><li><a class="sub"><span class="name">냄비·팬·솥</span></a></li><li><a class="sub"><span class="name">보관용기·텀블러</span></a></li><li><a class="sub"><span class="name">식기·테이블웨어</span></a></li><li><a class="sub"><span class="name">컵·잔·커피도구</span></a></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_electronic__inactive_pc@2x.1574417978.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_electronic__active_pc@2x.1574417978.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">가전제품</span></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">주방가전</span></a></li><li><a class="sub"><span class="name">생활가전</span></a></li><li><a class="sub"><span class="name">계절가전</span></a></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_kids_inactive_pc@2x.1568687537.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_kids_active_pc@2x.1568687537.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">베이비·키즈</span></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">분유·간편 이유식</span></a></li><li><a class="sub"><span class="name">이유식 재료</span></a></li><li><a class="sub"><span class="name">간식·음식·음료</span></a></li><li><a class="sub"><span class="name">건강식품</span></a></li><li><a class="sub"><span class="name">이유·수유용품</span></a></li><li><a class="sub"><span class="name">기저귀·물티슈</span></a></li><li><a class="sub"><span class="name">세제·위생용품</span></a></li><li><a class="sub"><span class="name">스킨·구강케어</span></a></li><li><a class="sub"><span class="name">완구·잡화류</span></a></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_pet_inactive_pc@2x.1587442293.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_pet_active_pc@2x.1587442294.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">반려동물</span></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">강아지 간식</span></a></li><li><a class="sub"><span class="name">강아지 주식</span></a></li><li><a class="sub"><span class="name">고양이 간식</span></a></li><li><a class="sub"><span class="name">고양이 주식</span></a></li><li><a class="sub"><span class="name">반려동물 용품</span></a></li><li><a class="sub"><span class="name">배변·위생</span></a></li><li><a class="sub"><span class="name">소용량·샘플</span></a></li></ul></li><li><a class="menu"><span class="ico"><img src="https://res.kurly.com/pc/service/common/1908/ico_recommend_v2.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://res.kurly.com/pc/service/common/1908/ico_recommend_on_v2.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">컬리의 추천</span></span></a> <ul class="sub_menu recommend"><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_diet.1585551225.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">식단관리</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_breakfast.1585549149.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">간편한 아침식사</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kp_best_201207.1607408493.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">재구매 BEST</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kp_3000_201207.1607408565.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">3천원의 행복</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kp_210108_4.1610088265.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">컬리마트</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_single.1594026881.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">1인 가구</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/category_kurly_s-pick_thumbnail_shrimp.1589797274.png&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">뚝딱! 간편식</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumb_kp_bakery_201217.1608624742.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">베이커리 맛집</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail.1598235634.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">반찬가게</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/Thum_Cytogenic.1592469678.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">키토제닉</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/Thum_vegan.1592469659.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">비건</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/Thum_sustainable.1589875827.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">지속가능한 상품</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/pb.1594027365.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">컬리가 만든 상품</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kp_only_201207.1607408395.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">Kurly Only</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/kf3651016.1602814588.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">KF365</span></a></li><li> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumb_kp_1PT_201222.1608611417.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">1% Table</span></a></li></ul></li>-->
					
						</ul>
					</div> 
				</div>
			</div>
		</div>
	</div>
		
		
		
		
			<!-- <div class="navigation">
				<nav class="navi">
					<ul class="menu"  >
						<li class="px"><a href="">전체 카테고리</a>
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
			</div> -->
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