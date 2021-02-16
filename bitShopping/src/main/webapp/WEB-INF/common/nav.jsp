<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	#userMenu {
    width: 1050px;
    margin: 0 auto;
	}
	
	#userMenu .list_menu {
    float: right;
	}
	#userMenu * {
    font-family: noto sans;
    font-weight: 400;
    letter-spacing: -.3px;
}
	#userMenu .menu {
    position: relative;
    z-index: 400;
    float: left;
}


ol, ul {
    list-style-type: none;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
	
	#headerLogo {
    position: relative;
    width: 1050px;
    height: 63px;
    margin: 0 auto;
	}
	
	#headerLogo .logo {
    position: absolute;
    left: 50%;
    bottom: 6px;
    width: 200px;
    height: 79px;
    margin-left: -100px;
	}
	</style>


</head>
<body>
	<div>
	<div id="userMenu">
		<ul class="list_menu">
			<li class="menu none_sub menu_join">
			<a href="/shop/member/join.php" class="link_menu">
			회원가입
			</a>
			</li> 
			<li class="menu none_sub menu_login"><!----> 
			<a href="" class="link_menu">
			로그인
			</a>
			</li> <!----> 
			<li class="menu lst">
			<a href="/shop/board/list.php?id=notice" class="link_menu">
			고객센터
			</a> 
			<ul class="sub">
			<li>
			<a href="/shop/board/list.php?id=notice">
			공지사항
			</a>
			</li> 
			<li>
			<a href="/shop/service/faq.php">
			자주하는 질문
			</a>
			</li> 
			<li>
			<a href="/shop/mypage/mypage_qna.php">
			1:1 문의
			</a>
			</li> <!----> 
			<li>
			<a href="/shop/mypage/offer.php">
			상품 제안
			</a>
			</li> 
			<li>
			<a href="/shop/mypage/echo_packing.php">
			에코포장 피드백
			</a>
			</li>
			</ul>
			</li>
			</ul>
			</div>
			
			
	
	
	<div id="headerLogo" class="layout-wrapper">
	<h1 class="logo"> <a href="/" class="link_main">
	<span id="gnbLogoContainer"></span>
	<img src="" alt="팀 로고">
	</a>
	</h1>
		<a href="" onclick="" class="bnr_delivery">
		<img src="" alt="">
		</a>
	</div>
	
	<div id="gnb" class="">
	<h2 class="screen_out">메뉴</h2>
	<div id="gnbMenu" class="gnb_kurly">
		<div class="inner_gnbkurly">
			<div class="gnb_main"><ul class="gnb">
			<li class="menu1"><a href="#none" class=""><span class="ico"></span><span class="txt">전체 카테고리</span></a></li> 
			<li class="menu2"><a href="/shop/goods/goods_list.php?category=038" class="link new "><span class="txt">신상품</span></a></li> 
			<li class="menu3"><a href="/shop/goods/goods_list.php?category=029" class="link best "><span class="txt">베스트</span></a></li> 
			<li class="menu4"><a href="/shop/goods/goods_list.php?list=sale" class="link bargain "><span class="txt">알뜰쇼핑</span></a></li> 
			<li class="lst"><a href="/shop/goods/event.php?&amp;" class="link event "><span class="txt">금주혜택</span></a></li></ul> 
			<div id="side_search" class="gnb_search"><form action="/shop/goods/goods_search.php?&amp;" onsubmit="return searchTracking(this)">
			<input type="hidden" name="searched" value="Y"> 
			<input type="hidden" name="log" value="1"> 
			<input type="hidden" name="skey" value="all">
			 <input type="hidden" name="hid_pr_text" value=""> 
			 <input type="hidden" name="hid_link_url" value=""> 
			 <input type="hidden" id="edit" name="edit" value="Y"> 
			 <input name="sword" type="text" id="" value="" required="required" label="검색어" class="inp_search">
			  <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search"> 
			  <div class="init">
			  <button type="button" id="searchInit" class="btn_delete">검색어 삭제하기</button>
			  </div>
			  </form>
			  </div> 
			  <div class="cart_count">
			  <div class="inner_cartcount"><a href="/shop/goods/goods_cart.php" class="btn_cart"><span class="screen_out">장바구니</span> 
			  <span id="cart_item_count" class="num realtime_cartcount" style="display: none;"></span></a>
			  </div>
			   <div id="addMsgCart" class="msg_cart"><span class="point"></span> 
			   <div class="inner_msgcart"><img src="https://res.kurly.com/images/common/bg_1_1.gif" alt="" class="thumb">
			    <p id="msgReaddedItem" class="desc"><span class="tit"></span> <span class="txt">	
			장바구니에 상품을 담았습니다.
<span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span></span></p></div></div></div> <div class="location_set">
<button type="button" class="btn_location on">배송지 설정하기</button> <div class="layer_location"><div class="no_address">  
      <span class="emph">배송지를 등록</span>하고<br>        구매 가능한 상품을 확인하세요!        
      <div class="group_button double">          <button type="button" class="btn default login">로그인</button>      
        <button type="button" class="btn active searchAddress"><span class="ico"></span>주소검색</button>        </div>    
          </div></div></div></div> 
          <div class="gnb_sub" style="display: none; width: 219px;">
          <div class="inner_sub"><ul data-default="219" data-min="219" data-max="731" class="gnb_menu" style="height: auto;">
          <li class="">
          <a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt="카테고리 아이콘" class="ico_off"> 
          <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt="카테고리 아이콘" class="ico_on"></span> 
          <span class="tit">
          <span class="txt">채소</span> 
          </span>
          </a> 
          <ul class="sub_menu">
          <li><a class="sub"><span class="name">고구마·감자·당근</span></a>    <!----></li>
          <li><a class="sub"><span class="name">시금치·쌈채소·나물</span></a> <!----></li>
          <li><a class="sub"><span class="name">브로콜리·파프리카·양배추</span></a> <!----></li>
          <li><a class="sub"><span class="name">양파·대파·마늘·배추</span></a> <!----></li>
          <li><a class="sub"><span class="name">오이·호박·고추</span></a> <!----></li>
          <li><a class="sub"><span class="name">냉동·이색·간편채소</span></a> <!----></li>
          <li><a class="sub"><span class="name">콩나물·버섯</span></a> <!----></li>
          </ul>
          </li>
          
          <li class="">
          <a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_fruit_inactive_pc@2x.1568684150.png" alt="카테고리 아이콘" class="ico_off"> 
          <img src="https://img-cf.kurly.com/shop/data/category/icon_fruit_active_pc@2x.1568684150.png" alt="카테고리 아이콘" class="ico_on"></span>
           <span class="tit"><span class="txt">과일·견과·쌀</span> <!----></span>
           </a> 
           <ul class="sub_menu"><li><a class="sub"><span class="name">제철과일</span></a> <!----></li>
           <li><a class="sub"><span class="name">국산과일</span></a> <!----></li><li><a class="sub"><span class="name">수입과일</span></a> <!----></li>
           <li><a class="sub"><span class="name">간편과일</span></a> <!----></li><li><a class="sub"><span class="name">냉동·건과일</span></a> <!----></li>
           <li><a class="sub"><span class="name">견과류</span></a> <!----></li><li><a class="sub"><span class="name">쌀·잡곡</span></a> <!----></li>
           </ul>
           </li>
           <li class="">
           <a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_seafood_inactive_pc@2x.1568684352.png" alt="카테고리 아이콘" class="ico_off"> 
           <img src="https://img-cf.kurly.com/shop/data/category/icon_seafood_active_pc@2x.1568684353.png" alt="카테고리 아이콘" class="ico_on"></span> 
           <span class="tit"><span class="txt">수산·해산·건어물</span> <!----></span></a> 
           
           <ul class="sub_menu"><li>
           <a class="sub"><span class="name">제철수산</span></a> <!----></li><li><a class="sub"><span class="name">생선류</span></a> <!----></li>
           <li><a class="sub"><span class="name">굴비·반건류</span></a> <!----></li><li><a class="sub"><span class="name">오징어·낙지·문어</span></a> <!----></li>
           <li><a class="sub"><span class="name">새우·게·랍스터</span></a> <!----></li><li><a class="sub"><span class="name">해산물·조개류</span></a> <!----></li>
           <li><a class="sub"><span class="name">수산가공품</span></a> <!----></li><li><a class="sub"><span class="name">김·미역·해조류</span></a> <!----></li>
           <li><a class="sub"><span class="name">건어물·다시팩</span></a> <!----></li>
           </ul>
           </li>
           <li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_meat_inactive_pc@2x.1568684452.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_meat_active_pc@2x.1568684452.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">정육·계란</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">국내산 소고기</span></a> <!----></li><li><a class="sub"><span class="name">수입산 소고기</span></a> <!----></li><li><a class="sub"><span class="name">돼지고기</span></a> <!----></li><li><a class="sub"><span class="name">계란류</span></a> <!----></li><li><a class="sub"><span class="name">닭·오리고기</span></a> <!----></li><li><a class="sub"><span class="name">양념육·돈까스</span></a> <!----></li><li><a class="sub"><span class="name">양고기</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_side_inactive_pc@2x.1572243579.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_side_active_pc@2x.1572243579.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">국·반찬·메인요리</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">국·탕·찌개</span></a> <!----></li><li><a class="sub"><span class="name">밀키트·메인요리</span></a> <!----></li><li><a class="sub"><span class="name">밑반찬</span></a> <!----></li><li><a class="sub"><span class="name">김치·젓갈·장류</span></a> <!----></li><li><a class="sub"><span class="name">두부·어묵·부침개</span></a> <!----></li><li><a class="sub"><span class="name">베이컨·햄·통조림</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_convenient_inactive_pc@2x.1572243542.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_convenient_active_pc@2x.1572243543.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">샐러드·간편식</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">샐러드·닭가슴살</span></a> <!----></li><li><a class="sub"><span class="name">도시락·밥류</span></a> <!----></li><li><a class="sub"><span class="name">파스타·면류</span></a> <!----></li><li><a class="sub"><span class="name">떡볶이·튀김·순대</span></a> <!----></li><li><a class="sub"><span class="name">피자·핫도그·만두</span></a> <!----></li><li><a class="sub"><span class="name">폭립·떡갈비·안주</span></a> <!----></li><li><a class="sub"><span class="name">죽·스프·카레</span></a> <!----></li><li><a class="sub"><span class="name">선식·시리얼</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_sauce_inactive_pc@2x.1572243594.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_sauce_active_pc@2x.1572243594.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">면·양념·오일</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">파스타·면류</span></a> <!----></li><li><a class="sub"><span class="name">식초·소스·드레싱</span></a> <!----></li><li><a class="sub"><span class="name">양념·액젓·장류</span></a> <!----></li><li><a class="sub"><span class="name">식용유·참기름·오일</span></a> <!----></li><li><a class="sub"><span class="name">소금·설탕·향신료</span></a> <!----></li><li><a class="sub"><span class="name">밀가루·가루·믹스</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_snacks_inactive_pc@2x.1572243615.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_snacks_active_pc@2x.1572243616.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">생수·음료·우유·커피</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">생수·탄산수</span></a> <!----></li><li><a class="sub"><span class="name">음료·주스</span></a> <!----></li><li><a class="sub"><span class="name">우유·두유·요거트</span></a> <!----></li><li><a class="sub"><span class="name">커피</span></a> <!----></li><li><a class="sub"><span class="name">차</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_cookie_inactive_pc.1610074008.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_cookie_active_pc.1610074008.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">간식·과자·떡</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">과자·스낵·쿠키</span></a> <!----></li><li><a class="sub"><span class="name">초콜릿·젤리·캔디</span></a> <!----></li><li><a class="sub"><span class="name">떡·한과</span></a> <!----></li><li><a class="sub"><span class="name">아이스크림</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_deli_inactive_pc@2x.1568687352.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_deli_active_pc@2x.1568687352.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">베이커리·치즈·델리</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">식빵·빵류</span></a> <!----></li><li><a class="sub"><span class="name">잼·버터·스프레드</span></a> <!----></li><li><a class="sub"><span class="name">케이크·파이·디저트</span></a> <!----></li><li><a class="sub"><span class="name">치즈</span></a> <!----></li><li><a class="sub"><span class="name">델리</span></a> <!----></li><li><a class="sub"><span class="name">올리브·피클</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_health_inactive_pc@2x.1574645922.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_health_active_pc@2x.1574645923.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">건강식품</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">영양제</span></a> <!----></li><li><a class="sub"><span class="name">유산균</span></a> <!----></li><li><a class="sub"><span class="name">홍삼·인삼·꿀</span></a> <!----></li><li><a class="sub"><span class="name">건강즙·건강음료</span></a> <!----></li><li><a class="sub"><span class="name">건강분말·건강환</span></a> <!----></li><li><a class="sub"><span class="name">다이어트·이너뷰티</span></a> <!----></li><li><a class="sub"><span class="name">유아동</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_living_inactive_pc@2x.1588814089.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_living_active_pc@2x.1588814090.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">생활용품·리빙</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">휴지·티슈</span></a> <!----></li><li><a class="sub"><span class="name">여성·위생용품</span></a> <!----></li><li><a class="sub"><span class="name">세제·청소용품</span></a> <!----></li><li><a class="sub"><span class="name">화훼·인테리어소품</span></a> <!----></li><li><a class="sub"><span class="name">의약외품·마스크</span></a> <!----></li><li><a class="sub"><span class="name">생활잡화·문구</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_beauty_inactive_pc@2x.1588750188.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_beauty_active_pc@2x.1588750188.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">뷰티·바디케어</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">스킨케어</span></a> <!----></li><li><a class="sub"><span class="name">구강·면도</span></a> <!----></li><li><a class="sub"><span class="name">바디·제모</span></a> <!----></li><li><a class="sub"><span class="name">헤어케어</span></a> <!----></li><li><a class="sub"><span class="name">미용기기·소품</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_kitchen_inactive_pc@2x.1574646457.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_kitchen_active_pc@2x.1574646458.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">주방용품</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">주방소모품·잡화</span></a> <!----></li><li><a class="sub"><span class="name">주방·조리도구</span></a> <!----></li><li><a class="sub"><span class="name">냄비·팬·솥</span></a> <!----></li><li><a class="sub"><span class="name">보관용기·텀블러</span></a> <!----></li><li><a class="sub"><span class="name">식기·테이블웨어</span></a> <!----></li><li><a class="sub"><span class="name">컵·잔·커피도구</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_electronic__inactive_pc@2x.1574417978.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_electronic__active_pc@2x.1574417978.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">가전제품</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">주방가전</span></a> <!----></li><li><a class="sub"><span class="name">생활가전</span></a> <!----></li><li><a class="sub"><span class="name">계절가전</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_kids_inactive_pc@2x.1568687537.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_kids_active_pc@2x.1568687537.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">베이비·키즈</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">분유·간편 이유식</span></a> <!----></li><li><a class="sub"><span class="name">이유식 재료</span></a> <!----></li><li><a class="sub"><span class="name">간식·음식·음료</span></a> <!----></li><li><a class="sub"><span class="name">건강식품</span></a> <!----></li><li><a class="sub"><span class="name">이유·수유용품</span></a> <!----></li><li><a class="sub"><span class="name">기저귀·물티슈</span></a> <!----></li><li><a class="sub"><span class="name">세제·위생용품</span></a> <!----></li><li><a class="sub"><span class="name">스킨·구강케어</span></a> <!----></li><li><a class="sub"><span class="name">완구·잡화류</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_pet_inactive_pc@2x.1587442293.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_pet_active_pc@2x.1587442294.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">반려동물</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">강아지 간식</span></a> <!----></li><li><a class="sub"><span class="name">강아지 주식</span></a> <!----></li><li><a class="sub"><span class="name">고양이 간식</span></a> <!----></li><li><a class="sub"><span class="name">고양이 주식</span></a> <!----></li><li><a class="sub"><span class="name">반려동물 용품</span></a> <!----></li><li><a class="sub"><span class="name">배변·위생</span></a> <!----></li><li><a class="sub"><span class="name">소용량·샘플</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://res.kurly.com/pc/service/common/1908/ico_recommend_v2.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://res.kurly.com/pc/service/common/1908/ico_recommend_on_v2.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">컬리의 추천</span> <!----></span></a> <ul class="sub_menu recommend"><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_diet.1585551225.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">식단관리</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_breakfast.1585549149.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">간편한 아침식사</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kp_best_201207.1607408493.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">재구매 BEST</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kp_3000_201207.1607408565.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">3천원의 행복</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kp_210108_4.1610088265.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">컬리마트</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_single.1594026881.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">1인 가구</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/category_kurly_s-pick_thumbnail_shrimp.1589797274.png&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">뚝딱! 간편식</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumb_kp_bakery_201217.1608624742.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">베이커리 맛집</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail.1598235634.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">반찬가게</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/Thum_Cytogenic.1592469678.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">키토제닉</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/Thum_vegan.1592469659.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">비건</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/Thum_sustainable.1589875827.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">지속가능한 상품</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/pb.1594027365.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">컬리가 만든 상품</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kp_only_201207.1607408395.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">Kurly Only</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/kf3651016.1602814588.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">KF365</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumb_kp_1PT_201222.1608611417.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">1% Table</span></a></li></ul></li></ul></div></div></div></div>
</div>
	
	
	</div>	
	
	
</body>
</html>