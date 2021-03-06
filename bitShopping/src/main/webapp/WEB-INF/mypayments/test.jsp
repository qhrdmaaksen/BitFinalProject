<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<%@ include file="/WEB-INF/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<title>주문 완료</title>
  
	
	<style type="text/css">
		div .container{
			background-color: #DDA0DD;
		}			
		section{
			background-color: #DDA0DD !important;
		}
		.h-100 {
		    height: 500px !important;
		}
		div .container > div{
			padding: 10px;
		}
		section > img{
			margin: 30px;
		}
		section > a{
			margin: 10px;
		}
		h2{
	    	font-family: Roboto Slab !important;
	    }
	</style>
</head>
<body>

<div class="container">

	<section>
	  <div class="jumbotron color-grey-light card-intro-preview">
	    <div class="d-flex align-items-center h-100">
	      <div class="container text-center py-5">
		<div class="page_aticle section_end">
			<h2 class="screen_out">주문완료</h2>
				<div class="order_result">
					<div class="delivery_check">
						<img src="https://res.kurly.com/mobile/service/order/1909/img_success_order_end.gif" alt="아이콘" class="ico">
							<div class="check">
								<p class="tit"><span class="name"><%-- ${loginfo.name} --%>${sessionScope.loginfo.name}(${sessionScope.loginfo.mid})님</span> <span class="name">주문이 완료되었습니다.</span></p>
									<strong>내일 아침</strong>에 만나요!
							</div>
					</div>
						<div class="amount_money ">
							<strong class="tit">결제금액 : </strong>
									<strong class="money"> 
									<td id="totalprice"><fmt:formatNumber value="${sessionScope.totalprice}"
                                                                  pattern="#,###"/>원
                            </td>
                            </strong>
											<strong class="amount"> 1,508 원 적립</strong>
											<span class="grade">(적립 15%)</span>
							<p class="desc"><h5> * 적립금은 배송당일에 적립됩니다. </h5> </p>
						
							<a class="btn btn_positive" href="/<%=contextPath%>/main.cu">홈으로 이동</a>
							<a href="/shop/mypage/mypage_orderview.php?ordno=1614307375152&amp;referrer=payment_complete"
								 class="btn btn_orderlist">주문내역 상세보기</a>
						<p class="txt_cancel">
							<strong class="emph">‘입금확인’</strong> 상태일 때는 주문내역 상세 페이지에서 직접 주문 취소가 가능합니다.
						</p>
					</div>
						<span class="bg"></span>
						<span class="bg lst"></span>
				</div>
					<a class="take_away" href="/shop/event/kurlyEvent.php?htmid=event/2020/0303/paper">
						<strong class="tit">* 종이 박스, 컬리가 회수해드려요.<br>
							<div class="desc"> 다음 주문 시, 펼쳐서 문 앞에 놓아 주세요. (최대 3개) </strong>
						<span class="link">자세히 보러가기</span>
					</a>
					<div class="inquiry_check">
							주문 / 배송 및 기타 문의가 있을 경우, 1:1문의에 남겨주시면 신속히 해결해드리겠습니다.
					</div>
				</div>
			</div>
	      </div>
	    </div>
	</section>
</div>

<%@ include file="/WEB-INF/common/footer.jsp" %>
</body>
</html>


