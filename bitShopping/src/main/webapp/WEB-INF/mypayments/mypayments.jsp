<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<%@ include file="./../common/common.jsp"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
word-break:break-all;
box-sizing:border-box;
margin: 0;
padding:0;
font-weight:800;
font-family:noto
sans;
font-size: 
30px;
color:#333;
line-height:50px;
text-align:center;
letter-spacing:-.5px;
</style>
</head>
<body>

	<div class="tit_page">
		<h2 class="tit">주문서</h2>
	</div>
	<h2 class="tit_section fst">주문상품</h2>
	<div id="itemList" class="page_aticle order_goodslist">
		<div class="info_product">
			<a class="btn" href="#none"><span class="screen_out">펼침 /
					닫힘</span></a>
			<div class="short_info">[선물세트] 안동 사과빵 8개입상품을 주문합니다.</div>
		</div>
		<ul class="list_product">
			<li>
				<div class="thumb">
					<img
						src="https://img-cf.kurly.com/shop/data/goods/1611050353942i0.jpg"
						alt="상품이미지">
				</div>
				<div class="name">
					<div class="inner_name">[선물세트] 안동 사과빵 8개입</div>
				</div>
				<div class="ea">1개</div>
				<div class="info_price">
					<span class="num"><span class="price">12,000원</span></span>
				</div>
			</li>
		</ul>
	</div>

	<h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
	<div class="order_section data_orderer">
		<table class="goodsinfo_table ">
			<tbody>
				<tr class="fst">
					<th>보내는 분</th>
					<td>홍경희 <input type="hidden" name="orderer_name" value="홍경희">
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>01088788660 <input type="hidden" name="orderer_phone"
						value="01088788660">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="hidden" id="email" name="orderer_email"
						value="ghdrudgml90@naver.com" option="regEmail">
						ghdrudgml90@naver.com
						<p class="txt_guide">
							<span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다.</span> <span
								class="txt txt_case2">정보 변경은 <span class="txt_desc">마이컬리
									&gt; 개인정보 수정</span> 메뉴에서 가능합니다.
							</span>
						</p></td>
				</tr>
			</tbody>
		</table>
	</div>

	<h2 class="tit_section" id="divAddressWrapper">
		배송 정보 <span class="desc">배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span>
	</h2>

	<div class="address_info">
		<a href="#none" id="btnLayerInfo" class="desc">배송지 변경 안내</a>
		<div class="layer_info" id="layerInfo">
			<strong class="emph">장바구니, 홈</strong>에서 <br> 배송지를 변경할 수 있어요.
		</div>
	</div>

	<div class="order_section order_address" id="dataDelivery">
		<h3 href="#none" class="section_crux">배송지</h3>
		<div class="section_full">
			<span class="address" id="divDestination" style=""> <span
				class="default on" id="addrDefault" data-text="기본배송지">기본배송지</span> <span
				class="addr" id="addrInfo">서울 양천구 신정동 998-10 건향피크빌 302호</span> <span
				class="tag" id="addrTags"> <span class="badge star"
					id="addrBadge">샛별배송</span>
			</span>
			</span>
		</div>
	</div>
		<div class="order_section order_reception" id="divReception" style="">
			<h3 class="section_crux">
					상세 정보
			</h3>
	<div class="section_full">

		<div class="receiving" id="receiverInfo">홍경희, 010-8878-8660</div>
			<div class="way" id="wayPlace">
				<span class="place" id="areaInfo">문 앞</span>

				<span class="txt" id="meanType">공동현관 비밀번호</span>

				<div class="message" id="deliveryMessage" style="">
			<span class="place" id="deliveryMessageTitle">배송완료 메시지</span>
		<span class="txt" id="deliveryMessageDetail">오전 7시</span>
		</div>
		</div>
		<button type="button" id="btnUpdateSubAddress" data-address-no="" class="btn default">수정</button>

	</div>
	</div>
	
	<div class="data_method">
<h2 class="tit_section" id="titFocusMethod">결제수단</h2>

<input type="hidden" name="escrow" value="N">
<table class="goodsinfo_table tbl_left">
<tbody><tr>
<th>일반결제</th>
<td class="noline" style="position:relative">
<label class="label_radio checked" id="settlekindCard" onclick="option_pay_standard('');" style="padding-bottom:4px;">
<input type="radio" name="settlekind" value="c" onclick="input_escrow(this,'N');" checked="checked">
신용카드
</label>
</td>
</tr>

<tr class="card_detail">
<th></th>
<td>
<div id="cardSelect"><div><div class="card_select"><div class="select_box"><!----> <strong class="tit">우리</strong> <select name="lguplus_card_code" class="list"><option disabled="disabled" value="">카드를 선택해주세요</option> <option value="61">현대 (무이자)</option><option value="41">신한</option><option value="31">비씨</option><option value="11">KB국민</option><option value="51">삼성</option><option value="36">씨티</option><option value="71">롯데</option><option value="21">하나(외환)</option><option value="91">NH채움</option><option value="33">우리</option><option value="34">수협</option><option value="46">광주</option><option value="35">전북</option><option value="42">제주</option><option value="62">신협체크</option><option value="38">MG새마을체크</option><option value="39">저축은행체크</option><option value="37">우체국카드</option><option value="30">KDB산업은행</option><option value="15">카카오뱅크</option></select></div> <div class="select_box"><!----> <strong class="tit">일시불</strong> <select name="lguplus_card_installment_month" class="list"><option disabled="disabled" value="">할부기간을 선택해주세요</option> <option value="0">일시불</option> </select></div></div> <!----> <div class="card_event"><div></div> <div class="inner_card"><div><strong class="emph">· 무이자할부 유의사항</strong> 은행계열/체크/기프트/선불/법인/개인사업자 기업카드는 제외</div><div><strong class="emph">· 우리카드</strong> 6만원 이상 결제 시 3천원 즉시할인, 2/18 0시 ~ 2/28 24시, 기간 내 1회, 선착순</div></div></div></div></div>
</td>
</tr>

<tr>
<th> CHAI 결제</th>
<td>
<label class="label_radio" id="cardBenefitChai">
<input type="radio" name="settlekind" value="chai" onclick="input_escrow(this,'N')">
<img src="https://res.kurly.com/pc/service/order/2001/logo_chi_x2.png" height="18" alt="Chai 결제">
<img class="img_benefit" src="https://res.kurly.com/pc/service/order/2101/bubble_chai_0215.png" height="20">
<div class="info_benefit"><span class="info">·2/1 0시 ~ 2/28 24시, 차이 ID당 1회<br>·매 결제 1.5% 차이머니 적립</span></div>
</label>
</td>
</tr>
<tr>
<th> 토스 결제</th>
<td>
<label class="label_radio" id="cardBenefitToss">
<input type="radio" name="settlekind" value="toss" onclick="input_escrow(this,'N')">
<img src="https://res.kurly.com/pc/service/order/1912/toss-logo-signature.svg" height="18" alt="토스 결제">
<img class="img_benefit" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII=" height="20">
<div class="info_benefit"></div>
</label>
</td>
</tr>
<tr>
<th>네이버페이 결제</th>
<td class="noline">
<label class="label_radio" id="cardBenefitNaverpay">
<input type="radio" name="settlekind" value="n" onclick="input_escrow(this,'N');">
<img src="//res.kurly.com/pc/service/order/1710/ico_naverpay_v3.png" height="20" alt="네이버 페이 로고">
<img class="img_benefit" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII=" height="20">
<div class="info_benefit"></div>
</label>
</td>
</tr>
<tr>
<th>PAYCO 결제</th>
<td>
<label class="label_radio" id="cardBenefitPayco">
<input type="radio" name="settlekind" value="t" onclick="input_escrow(this,'N');check_naverNcashUseAble();">



<img src="https://static-bill.nhnent.com/payco/checkout/img/v2/btn_checkout2.png" alt="PAYCO 간편결제" height="18">
<img class="img_benefit" src="https://res.kurly.com/pc/service/order/2011/bubble_payco_1221.png" height="20">
<div class="info_benefit"><span class="info">·12/21 0시 ~ 02/28 24시<br>·기본 2% + 추가 1.5% 페이코 포인트 적립</span></div>
</label>
</td>
</tr>
<tr>
<th>스마일페이 결제</th>
<td>
<label class="label_radio" id="cardBenefitSmilepay">
<input type="radio" name="settlekind" value="s" onclick="input_escrow(this,'N')">
<img src="//res.kurly.com/pc/service/order/1712/ico_smilepay_v2.png" alt="스마일페이" height="18">
<img class="img_benefit" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII=" height="20">
<div class="info_benefit"></div>
</label>
</td>
</tr>
<tr>
<th>휴대폰 결제</th>
<td>
<label class="label_radio">
<input type="radio" name="settlekind" value="h" onclick="input_escrow(this,'N')">
휴대폰
</label>
</td>
</tr>

<div id="paymentMethodResult">
<input type="hidden" name="payment_method" value="">
</div>
<input type="submit" value="결제하기" class="btn_payment">
</form>

</body>
</html>