<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* footer 스타일 시작*/
	#footer {
	    width: 1050px;
	    margin: 0 auto;
	    padding-bottom: 60px;
	    font-weight: 400;
	    letter-spacing: -.2px;
	}
	#footer {
    font-family: noto sans;
    letter-spacing: 0;
	}
	
	#footer {
    opacity: 0;
	}
	div, th, td, li, dt, dd, p {
	    word-break: break-all;
	}
  	#footer .inner_footer {
    overflow: hidden;
    padding-bottom: 20px;
	}
	*, *:after, *:before {
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	}
	
	#footer .footer_cc {
    float: left;
    width: 534px;
	}
	  #footer .tit_cc {
	    padding: 29px 0 2px;
	    font-weight: 700;
	    font-size: 20px;
	    color: #333;
	    line-height: 24px;
	}
	*, *:after, *:before {
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	}
	h2 {
	    display: block;
	    font-size: 1.5em;
	    margin-block-start: 0.83em;
	    margin-block-end: 0.83em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    font-weight: bold;
	}
	
	#footer .cc_call {
    padding-top: 20px;
	}
	#footer .cc_view {
	    overflow: hidden;
	    padding-top: 16px;
	}
	
	h3 {
	    display: block;
	    font-size: 1.17em;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    font-weight: bold;
	}
	
	#footer .cc_call .tit {
	    padding-top: 4px;
	    font-weight: 800;
	    font-size: 28px;
	    color: #333;
	    line-height: 36px;
	    letter-spacing: -.5px;
	    white-space: nowrap;
	}
	#footer .cc_view .tit {
	    float: left;
	    width: 140px;
	    margin-right: 16px;
	}
	
	#footer .footer_cc .list {
	    font-size: 14px;
	    color: #333;
	    line-height: 22px;
	    letter-spacing: -.2px;
	}
	
	#footer .company {
	    float: left;
	    padding-top: 29px;
	    font-size: 12px;
	    color: #999;
	    line-height: 20px;
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
	
	li {
	    display: list-item;
	    text-align: -webkit-match-parent;
	}
	
	#footer .authentication {
	    float: left;
	    padding-top: 3px;
	}
	
	#footer .footer_link {
	    overflow: hidden;
	    padding-top: 19px;
	    border-top: 1px solid #eee;
	    letter-spacing: 0;
	}
	
	iframe {
	    border-width: 2px;
	    border-style: inset;
	    border-color: initial;
	    border-image: initial;
	}

	div, th, td, li, dt, dd, p {
	    word-break: break-all;
	}
	ol, ul {
	    list-style-type: none;
	}
	
	
	/* 컬리소개, 컬리 소개영상 등 */
	#footer .company .list {
	    overflow: hidden;
	    width: 100%;
	    padding-bottom: 29px;
	}
	#footer .company .list .link {
    font-size: 14px;
    color: #333;
    line-height: 18px;
	}
	a:active, a:hover {
	    outline: 0;
	}
	a {
    background-color: transparent;
    text-decoration: none;
    color: inherit;
	}
	
	#footer .company .link {
	    color: #5f0080;
	}
	#footer .company .list li {
	    float: left;
	    padding-right: 16px;
	}
	
	



	#footer .list_sns li {
	    float: left;
	}
/* 	#footer .list_sns .link_sns {
	    display: block;
	    width: 30px;
	    height: 30px;
	    margin-right: 10px;
	    vertical-align: top;
	} */


</style>





</head>
<body>



<div id="footer" style="opacity: 1;">
<div class="inner_footer">
<div class="footer_cc">
<h2 class="tit_cc">고객행복센터</h2>
<div class="cc_view cc_call">
<h3><span class="tit">1644-1107</span></h3>
<dl class="list">
<dt>365고객센터</dt>
<dd>오전 7시 - 오후 7시</dd>
</dl>
</div>
<div class="cc_view cc_kakao">
<h3><a class="tit" href="#none">카카오톡 문의</a></h3>
<script type="text/javascript">
							$('.cc_kakao .tit').on('click',function(e){
								e.preventDefault();
								$.ajax({
									type: "GET",
									url: apiDomain+'/v1/mypage/asks/confirm/kakao',
									dataType: 'json',
									success: function(data) {
										if(data.data.ok_button_action_url.indexOf('https://api.happytalk.io/') > -1){
											if(confirm('['+data.data.title+'] '+data.data.message)) window.open(data.data.ok_button_action_url,'_blank');
										}else{
											alert(data.data.title+'\n'+data.data.message);
										}
									}
								})
							});
						</script>
<dl class="list">
<dt>365고객센터</dt>
<dd>오전 7시 - 오후 7시</dd>
</dl>
</div>
<div class="cc_view cc_qna">
<h3><a href="/shop/mypage/mypage_qna_register.php?mode=add_qna" class="tit">1:1 문의</a></h3>
<dl class="list">
<dt>24시간 접수 가능</dt>
<dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
</dl>
</div>
</div>
<div class="company">
<ul class="list">
<li><a class="link" href="/shop/introduce/about_kurly.php">컬리소개</a></li>
<li><a class="link" href="https://www.youtube.com/embed/WEep7BcboMQ?rel=0&amp;showinfo=0&amp;wmode=opaque&amp;enablejsapi=1" onclick="window.open(this.href, 'pop', 'width=1330,height=660,scrollbars=yes');return false;">컬리소개영상</a></li>
<li><a class="link" href="https://marketkurly.recruiter.co.kr/appsite/company/index" target="_blank">인재채용</a></li>
<li><a class="link" href="/shop/service/agreement.php">이용약관</a></li>
<li><a class="link emph" href="/shop/service/private.php">개인정보처리방침</a></li>
<li><a class="link" href="/shop/service/guide.php">이용안내</a></li>
</ul>
법인명 (상호) : 주식회사 컬리 <span class="bar">I</span> 사업자등록번호 : 261-81-23567 <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2618123567&amp;apv_perm_no=" target="_blank" class="link">사업자정보 확인</a>
<br>
통신판매업 : 제 2018-서울강남-01646 호 <span class="bar">I</span> 개인정보보호책임자 : 이원준
<br>
주소 : 서울시 도산대로 16길 20, 이래빌딩 B1 ~ 4F <span class="bar">I</span> 대표이사 : 김슬아
<br>
입점문의 : <a href="https://forms.gle/oKMAe1SaicqMX3SC9" target="_blank" class="link">입점문의하기</a> <span class="bar">I</span> 제휴문의 : <a href="mailto:business@kurlycorp.com" class="link">business@kurlycorp.com</a>
<br>
채용문의 : <a href="mailto:recruit@kurlycorp.com" class="link">recruit@kurlycorp.com</a>
<br>
팩스: 070 - 7500 - 6098 <span class="bar">I</span> 이메일 : <a href="mailto:help@kurlycorp.com" class="link">help@kurlycorp.com</a>
<em class="copy">© KURLY CORP. ALL RIGHTS RESERVED</em>
<ul class="list_sns">
<li>
<a href="https://instagram.com/marketkurly" class="link_sns" target="_blank">
<img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="마켓컬리 인스타그램 바로가기">
</a>
</li>
<li>
<a href="https://www.facebook.com/marketkurly" class="link_sns" target="_blank">
<img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="마켓컬리 페이스북 바로가기">
</a>
</li>
<li>
<a href="http://blog.naver.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt="마켓컬리 네이버블로그 바로가기"></a>
</li>
<li>
<a href="https://m.post.naver.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="마켓컬리 유튜브 바로가기"></a>
</li>
<li>
<a href="https://www.youtube.com/channel/UCfpdjL5pl-1qKT7Xp4UQzQg" class="link_sns lst" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="마켓컬리 유튜브 바로가기"></a>
</li>
</ul>
</div>
</div>


<!-- <div class="footer_link">
<div class="authentication">
<a href="#none" onclick="popup('https://res.kurly.com/pc/img/1909/img_isms.jpg',550,700);return false;" class="mark" target="_blank">
<img src="https://res.kurly.com/pc/ico/2001/logo_isms.png" alt="isms 로고" class="logo">
<p class="txt">
[인증범위] 마켓컬리 쇼핑몰 서비스 개발 · 운영<br>
[유효기간] 2019.04.01 ~ 2022.03.31
</p>
</a>
<a href="#none" onclick="popup('https://www.eprivacy.or.kr/front/certifiedSiteMark/certifiedSiteMarkPopup.do?certCmd=EP&amp;certNum=2020-EP-N001',527,720);return false;" class="mark" target="_blank">
<img src="https://res.kurly.com/pc/ico/2001/logo_eprivacyplus.png" alt="eprivacy plus 로고" class="logo">
<p class="txt">
개인정보보호 우수 웹사이트 ·<br>
개인정보처리시스템 인증 (ePRIVACY PLUS)
</p>
</a>
<a href="#none" onclick="popup('http://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid=go_thefarmers',460,550);return false;" class="mark lguplus" target="_blank">
<img src="https://res.kurly.com/pc/service/main/2009/logo_payments.png" alt="payments 로고" class="logo">
<p class="txt">
고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>
토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
</p>
</a>
</div>
</div> -->


</div>







</body>
</html>