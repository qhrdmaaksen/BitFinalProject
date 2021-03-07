<%@page import="bean.Productreviews"%>
<%@page import="bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<%
int myoffset = 2;
int mywidth = 12 - 2 * myoffset;
int formleft = 3;
int formright = 12 - formleft;
%>


<%!Member member = new Member();

	Productreviews reviews = new Productreviews();%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<script type="text/javascript">
	<script>
	$('#star_grade a').click(function(){
	    $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
	    $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
	    return false;
	});
	</script>
		
	<style type="text/css">
	<style>
	     #star_grade a{
	        text-decoration: none;
	        color: gray;
	    }
	    #star_grade a.on{
	        color: red;
	    }
	
	div {
		/* word-break: break-all; */
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
	summary {
		cursor: pointer;
		padding-left: 10px;
	}
	/*삼각형 없애기*/
	summary {
		list-style: none;
	}
	summary::-webkit-details-marker {
		display: none;
	}
	tr {
		display: table-row;
		vertical-align: inherit;
		border-color: inherit;
	}
	form {
		display: block;
		margin-top: 0em;
	}
	body, input, select, textarea, button {
		line-height: 1;
		color: #4c4c4c;
		font-size: 12px;
		max-width: 100%;
	}
	
	.xans-board-listheader {
		border-top: 2px solid #522772;
	}
	.btitle {
		padding: 15px;
		margin: 15px;
		/* text-align: left; */
	}
	#foot {
		position: fixed;
		clear: right;
		float: right;
		width: 300px;
		height: 50px;
		left: 20;
		bottom: 0px;
	}
	.input_txt {
		padding: 20px;
		margin: 20px;
		
	}
	</style>
	<style>
	.star_rating {
		font-size: 0;
		letter-spacing: -4px;
	}
	.star_rating a {
		font-size: 22px;
		letter-spacing: 0;
		display: inline-block;
		margin-left: 5px;
		color: #ccc;
		text-decoration: none;
	}
	.star_rating a:first-child {
		margin-left: 0;
	}
	.star_rating a.on {
		color: #777;
	}
	.input-element .comment-form-comment {
		font-weight: bolder;
	}
	.main-menu ul li a {
	    font-size: 17px !important;
	}
		
	.product-details-content{
		padding-left: 100px;
		padding-top: 50px;
	}    	
	img{
		width: 100%;
	}

</style>

</head>
<body>


<c:set var="discountprice" value="${bean.price*0.85}" scope="application"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Product Detail</title>
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
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/jquery-ui.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/material-design-iconic-font.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/meanmenu.min.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/tippy.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/bundle.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/easyzoom.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/style.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/responsive.css">
    <script src="<%=contextPath%>/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>

</head>

<body>

        <!-- breadcrumbs area start -->
        <div class="title-breadcrumbs">
            <div class="title-breadcrumbs-inner">
                <div class="container">
                     <nav class="woocommerce-breadcrumb">
                        <a href="#">Home</a>
                        <span class="separator">/</span> <a href="shop.html">Shop</a>  <span class="separator"> /</span>
                        ${bean.pcategory} <span class="separator"> /</span> ${bean.productname}
                    </nav>
                </div>
            </div>
        </div>
        <!-- breadcrumbs area End -->
       <!-- product details area start -->
        <div class="product-details-area hm-3-padding ptb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product-details-img-content">
                            <div class="product-details-tab">
                                <div class="product-details-large tab-content">
                                    <div class="tab-pane active" id="pro-details1">
                                        <div class="easyzoom easyzoom--overlay">
                                            <a href="<%=contextPath%>/resources/assets/img/products/${bean.pimg1}">
                                                <img src="<%=contextPath%>/resources/assets/img/products/${bean.pimg1}" alt="">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product-details-content">
                            <h2>${bean.productname}</h2>
                            <div class="product-rating">
                                <!-- <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>-->
                               		 <span>재고 : ${bean.pqty}</span>
                            </div> 
                         
                            <div class="product-price">
                                <span class="old">${bean.price} 원</span>
                                <span><fmt:formatNumber value="${discountprice}" pattern="#,##0" /> 원</span>
                            </div>
                            <div class="product-overview">
                                <h5 class="pd-sub-title">Product Overview</h5>
                                <p>상품 설명 : ${bean.pcontents}<br></p>
                            </div>
						<form class="form-inline" role="form" method="post" action="<%=contextPath%>/insert.mall">
							<input type="hidden" name="pqty" value="${bean.pqty}">
							<input type="hidden" name="pno" value="${bean.pno}">
							<!-- <input type="hidden" name="qty" value="1"> -->
                            <div class="quickview-plus-minus">
                                <div class="cart-plus-minus">
                                    <input type="text" value="1" name="qty" class="cart-plus-minus-box">
                                </div>
	                                <div class="quickview-btn-cart">
	                                	<button type="submit" class="btn-style cr-btn">
	                                	  <span>add to cart</span>
	                                	</button>
	                                </div>
                            </div>
                          </form> 
                            <div class="product-categories">
                                <h5 class="pd-sub-title">Categories</h5>
                                <ul>
                                    <li>
                                        <a href="#">${bean.pcategory}</a>
                                    </li>
                                </ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="container">
		<c:if test="${not empty bean.pimg2}">
			<img src="<%=contextPath%>/resources/assets/img/products/${bean.pimg2}" alt="">
		</c:if>
		<br>
		<c:if test="${not empty bean.pimg3}">
			<img src="<%=contextPath%>/resources/assets/img/products/${bean.pimg3}" alt="">
		</c:if>
	<br>
	</div>
	<!-- product details area End -->
	<!--Product Description Review Area Start-->
	<div class="product-description-review-area pb-55">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-review-tab">
						<!--Review And Description Tab Menu Start-->
						<ul class="nav dec-and-review-menu">
							<li><a class="active" data-toggle="tab" href="#description">Description</a>
							</li>
							<li><a data-toggle="tab" href="#reviews">Reviews (<%=1 %>)</a></li>
						</ul>
						<!--Review And Description Tab Menu End-->
						<!--Review And Description Tab Content Start-->
						<div class="tab-content product-review-content-tab"
							id="myTabContent-4">
							<div class="tab-pane fade active show" id="description">
								<div class="single-product-description">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Nam fringilla augue nec est tristique auctor. Donec non est at
										libero vulputate rutrum. Morbi ornare lectus quis justo
										gravida semper. Nulla tellus mi, vulputate adipiscing cursus
										eu, suscipit id nulla.</p>
									<p>Pellentesque aliquet, sem eget laoreet ultrices, ipsum
										metus feugiat sem, quis fermentum turpis eros eget velit.
										Donec ac tempus ante. Fusce ultricies massa massa. Fusce
										aliquam, purus eget sagittis vulputate, sapien libero
										hendrerit est, sed commodo augue nisi non neque. Lorem ipsum
										dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem
										et placerat vestibulum, metus nisi posuere nisl, in accumsan
										elit odio quis mi. Cras neque metus, consequat et blandit et,
										luctus a nunc. Etiam gravida vehicula tellus, in imperdiet
										ligula euismod eget.</p>
								</div>
							</div>
							
<!---------------------------------------------------------------------- 상품 후기 게시판  --------------------------------------------------------------->

							<div class="tab-pane fade" id="reviews">
								<form:form modelAttribute="productreviews" name="myform"
									action="${contextPath}/insert.prr" method="post">
									<div class="review-page-comment">
										<h2>상품 후기 작성</h2>
												<div class="product-comment">
													<img src="<%=contextPath%>/resources/assets/img/author.png"
														alt="">
													<p class="meta">
														<input name="pno" id="pno" type="hidden" value="${bean.pno}">
														<strong>
															<div>
																<input type="text" class="form-control"
																	name="fakebwriter" id="fakebwriter" placeholder="작성자"
																	value="${sessionScope.loginfo.name}(${sessionScope.loginfo.mid})/님"
																	disabled="disabled"> <input type="hidden"
																	name="bwriter" id="bwriter"
																	value="${sessionScope.loginfo.mid}">
															</div>

														</strong> 
														<span>
															<div class="form-group">
																<label for="bregdate">작성 일자</label>
																<div>
																	<input type="datetime" class="form-control"
																		name="bregdate" id="bregdate" placeholder="yyyy/MM/dd 형식으로 작성해 주세요" 
																		value="${requestScope.productreviews.bregdate}" />

																</div>
															</div>
														</span>
												</div>
									</div>
									
									<div class="review-form-wrapper">
										<!-- <div class="review-form">
											<span class="comment-reply-title"> </span>
											<p id="star_grade">

												<a href="#" class="on">★</a> 
												<a href="#" class="on">★</a> 
												<a href="#" class="on">★</a> 
												<a href="#" class="on">★</a> 
												<a href="#" class="">★</a>
											</p>
										</div> -->
										<div class="input-element">
											<div class="comment-form-comment">
												<label>제목*</label> <input type="text" name="btitle" placeholder="4글자 이상 작성해 주세요"
													id="btitle" value="${requestScope.productreviews.btitle}">
											</div>
											<div class="comment-form-comment">
												<label>내용*</label>
												<textarea name="bcontent" cols="40" rows="8" id="bcontent" placeholder="5글자 이상 작성해 주세요"></textarea>
											</div>
											<%--  <div class="review-comment-form-author">
                                                            <label>작성자* </label>
                                                            <input id="bwriter" name="bwriter" type="text" value="${requestScope.productreviews.bwriter}">
                                                        </div> --%>
											<div class="comment-img">
												<input type="file" class="bimg" id="bimg">
											</div>
											<div class="comment-submit">
												<input type="submit" class="submit" id="submit">
											</div>
										</div>
								</form:form>
								<!--  </form> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Review And Description Tab Content End-->
			<!----------------------------------------------------- 상품 후기 리스트  ------------------------------------------------------------------------------------>
	<!-- <form name="frmList"> -->
	<form:form modelAttribute="productreviews" name="myform"
									action="${contextPath}/list.prr" method="get">
		<input name="pno" id="pno" type="hidden" value="${bean.pno}">
		<input type="hidden" name="sort" value=""> 
		<input type="hidden" name="page_num" value=""> 
		<input type="hidden"name="goodsno" value="13677">
		<div class="title_txt">
			<h2>PRODUCT REVIEW LIST</h2></div>
			<div class="sort-wrap">
				<ul class="list_type1 old">
					<li><span class="ico"></span>
					<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이
							담당 게시판으로 이동될 수 있습니다.</p></li>
					<li><span class="ico"></span>
						<p class="txt">
								배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 
								<a href="#none" onclick="window.parent.location.href = '/shop/mypage/mypage_qna.php'" class="emph">1:1 문의</a>에 남겨주세요.
						</p>
					</li>
				</ul>
	</form:form>
			</div>
		</div>
		
		
		<table class="xans-board-listheader" width="100%" border="0"
			cellpadding="0" cellspacing="0">
			<caption style="display: none">구매후기 제목</caption>
			<colgroup>
				<col style="width: 100px;">
				<col style="width: 150px;">
				<col style="width: 300px;">
				<col style="width: 500px;">
				<col style="width: 100px;">
				<col style="width: 100px;">
			</colgroup>
			<tbody>
				<tr>
					<td scope="col" class="input_txt">번호</td>
					<td scope="col" class="input_txt">작성자</td>
					<td scope="col" class="input_txt">제목</td>
					<td scope="col" class="input_txt">내용</td>
					<td scope="col" class="input_txt">작성일</td>
					<td scope="col" class="input_txt">조회</td>
				</tr>
			<tr>
				<c:forEach var="bean" items="${requestScope.lists}" >
					<td align="center">${bean.bno}</td>
					<td class="bwirter">${bean.bwriter}</td>
					<td class="btitle">
						<div>${bean.btitle}</div>
					<td>
						<details>
						<summary>내용 자세히 보기</summary>
						<p>${bean.bcontent}</p>
						</details>
					</td>
					<td class="bregdate">${bean.bregdate}</td>
					<td><span class="breview">${bean.breview}</span></td>
				</c:forEach>
			</tr>				
			</tbody>
		</table>
		</div>
	</div>		
		


<br>
<br>
<br>
<br>



<!----------------------------------------------------- 상품 후기 리스트  ------------------------------------------------------------------------------------>

	
	
<!----------------------------------------------------- 상품 후기 게시판 ------------------------------------------------------------------------------------>



 <!-- may also like product start -->
        <div class="product-area pb-65   product-padding">
            <div class="container">
                <div class="section-title-2 text-center mb-25">
                    <h2 class="m-0"> 이런 상품은 어떠세요? </h2>
                    <p> 지금 보고계신 상품과 비슷한 상품을 추천 해 드립니다. </p>
                </div>

                <div class="row">
                    <div class="product-slider-active owl-carousel">
	                    <c:forEach var="bean" items="${requestScope.lists1}">
	                        <div class="col-lg-4 col-md-6 col-12">
	                            <div class="product-wrapper mb-35">
	                                <div class="product-img">
	                                    <a href="<%=contextPath%>/pdetail.pr?pno=${bean.pno}">
	                                        <span class="onsale">Sale!</span>
	                                        <img alt="" src="<%=contextPath%>/resources/assets/img/products/${bean.pimg1}">
	                                    </a>
	                                    <div class="product-action-2">
	                                        <a href="#" title="Add to Compare" class="action-plus-2 tooltip">
	                                            <i class="zmdi zmdi-refresh"></i>
	                                        </a>
	                                        <a href="#" title="Add to Wishlist" class="action-plus-2 tooltip">
	                                            <i class="zmdi zmdi-favorite-outline"></i>
	                                        </a>
	                                        <a href="#" title="Quick View" data-target="#exampleModal" data-toggle="modal" class="action-plus-2 tooltip">
	                                            <i class="zmdi zmdi-search"></i>
	                                        </a>
	                                        <a href="<%=contextPath%>/insert.mall?pno=${bean.pno}&pqty=${bean.pqty}&qty=1" title="Add To Cart"  class="action-plus-2 tooltip">
	                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
	                                        </a>
	                                    </div>
	                                </div>
	                                <div class="product-content text-center">
	                                    <h4>
	                                        <a href="<%=contextPath%>/pdetail.pr?pno=${bean.pno}">${bean.productname}</a>
	                                    </h4>
	                                    <div class="product-price-2">
	                                        <div class="price-box">
	                                            <del>
	                                                <span class="amount">
	                                                    <span class="Price-currencySymbol"></span><fmt:formatNumber value="${bean.price}" pattern="#,##0" /> 원</span>
	                                            </del>
	                                            <ins>
	                                                <span class="amount">
	                                                    <span class="Price-currencySymbol"></span><fmt:formatNumber value="${bean.price*0.85}" pattern="#,##0" /> 원</span>
	                                            </ins>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                      </c:forEach>
                    </div>
                </div>
            </div>
        </div>



	<%@ include file="/WEB-INF/common/footer.jsp"%>
	<!-- all js here -->
	<script
		src="<%=contextPath%>/resources/assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="<%=contextPath%>/resources/assets/js/popper.js"></script>
	<script src="<%=contextPath%>/resources/assets/js/bootstrap.min.js"></script>
	<script src="<%=contextPath%>/resources/assets/js/isotope.pkgd.min.js"></script>
	<script
		src="<%=contextPath%>/resources/assets/js/imagesloaded.pkgd.min.js"></script>
	<script
		src="<%=contextPath%>/resources/assets/js/jquery.counterup.min.js"></script>
	<script src="<%=contextPath%>/resources/assets/js/waypoints.min.js"></script>
	<script src="<%=contextPath%>/resources/assets/js/ajax-mail.js"></script>
	<script src="<%=contextPath%>/resources/assets/js/owl.carousel.min.js"></script>
	<script src="<%=contextPath%>/resources/assets/js/plugins.js"></script>
	<script src="<%=contextPath%>/resources/assets/js/main.js"></script>
</body>

</html>






