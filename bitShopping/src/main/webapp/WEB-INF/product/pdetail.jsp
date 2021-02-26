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
	$(".star_rating a").click(function() {

		$(this).parent().children("a").removeClass("on");

		$(this).addClass("on").prevAll("a").addClass("on");

		return false;

	});
</script>
<style type="text/css">
div {
	word-break: break-all;
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
	padding-left: 50px;
	text-align: left;
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
	padding-left: 20px
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
                                    <div class="tab-pane" id="pro-details2">
                                        <div class="easyzoom easyzoom--overlay">
                                            <a href="<%=contextPath%>/resources/assets/img/product-details/bl2.jpg">
                                                <img src="<%=contextPath%>/resources/assets/img/product-details/l2.jpg" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="pro-details3">
                                        <div class="easyzoom easyzoom--overlay">
                                            <a href="<%=contextPath%>/resources/assets/img/product-details/bl3.jpg">
                                                <img src="<%=contextPath%>/resources/assets/img/product-details/l3.jpg" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="pro-details4">
                                        <div class="easyzoom easyzoom--overlay">
                                            <a href="<%=contextPath%>/resources/assets/img/product-details/bl4.jpg">
                                                <img src="<%=contextPath%>/resources/assets/img/product-details/l4.jpg" alt="">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="pro-details5">
                                        <div class="easyzoom easyzoom--overlay">
                                            <a href="<%=contextPath%>/resources/assets/img/product-details/bl3.jpg">
                                                <img src="<%=contextPath%>/resources/assets/img/product-details/l3.jpg" alt="">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-details-small nav mt-12 product-dec-slider owl-carousel">
                                    <a class="active" href="#pro-details1">
                                        <img src="<%=contextPath%>/resources/assets/img/product-details/s1.jpg" alt="">
                                    </a>
                                    <a href="#pro-details2">
                                        <img src="<%=contextPath%>/resources/assets/img/product-details/s2.jpg" alt="">
                                    </a>
                                    <a href="#pro-details3">
                                        <img src="<%=contextPath%>/resources/assets/img/product-details/s3.jpg" alt="">
                                    </a>
                                    <a href="#pro-details4">
                                        <img src="<%=contextPath%>/resources/assets/img/product-details/s4.jpg" alt="">
                                    </a>
                                    <a href="#pro-details5">
                                        <img src="<%=contextPath%>/resources/assets/img/product-details/s3.jpg" alt="">
                                    </a>
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
	                                <!-- <div class="quickview-btn-wishlist">
	                                    <a class="btn-hover cr-btn" href="#">
	                                        <span>
	                                            <i class="ion-ios-heart-outline"></i>
	                                        </span>
	                                    </a>	위시 리스트 구현 안함
	                                </div> -->
                            </div></form> 
                            <div class="product-categories">
                                <h5 class="pd-sub-title">Categories</h5>
                                <ul>
                                    <li>
                                        <a href="#">${bean.pcategory}</a>
                                    </li>
                                  <!--   <li>  추후 카테고리가 늘어날 수 있으므로
                                        <a href="#">electronics ,</a>
                                    </li> -->
							</ul>
						</div>
						<div class="product-share">
							<h5 class="pd-sub-title">Share</h5>
							<ul>
								<li><a href="#"> <i class="ion-social-twitter"></i>
								</a></li>
								<li><a href="#"> <i class="ion-social-tumblr"></i>
								</a></li>
								<li><a href="#"> <i class="ion-social-facebook"></i>
								</a></li>
								<li><a href="#"> <i
										class="ion-social-instagram-outline"></i>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
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
							<li><a data-toggle="tab" href="#reviews">Reviews (${requestScope.productreviews.bno})</a></li>
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
													<!-- <div class="product-comment-content">
                                                        <div class="product-reviews">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div> -->
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
																		name="bregdate" id="bregdate" placeholder="작성 일자"
																		value="${requestScope.productreviews.bregdate}" />

																</div>
															</div>
														</span>
												</div>
									</div>
									
									<div class="review-form-wrapper">
										<div class="review-form">
											<span class="comment-reply-title"> </span>
											<p class="star_rating">

												<a href="#" class="on">★</a> 
												<a href="#" class="on">★</a> 
												<a href="#" class="on">★</a> 
												<a href="#" class="on">★</a> 
												<a href="#" class="on">★</a>
											</p>
										</div>
										<div class="input-element">
											<div class="comment-form-comment">
												<label>제목*</label> <input type="text" name="btitle"
													id="btitle" value="${requestScope.productreviews.btitle}">
											</div>
											<div class="comment-form-comment">
												<label>내용*</label>
												<textarea name="bcontent" cols="40" rows="8" id="bcontent"></textarea>
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
	<form name="frmList">
	<form:form modelAttribute="productreviews" name="myform"
									action="${contextPath}/list.prr" method="get">
		<input type="hidden" name="sort" value=""> 
		<input type="hidden" name="page_num" value=""> 
		<input type="hidden"name="goodsno" value="13677">
		<div class="title_txt">
			<h2>PRODUCT REVIEW LIST</h2>
			<div class="sort-wrap">
				<ul class="list_type1 old">
					<li><span class="ico"></span>
					<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이
							담당 게시판으로 이동될 수 있습니다.</p></li>
					<li><span class="ico"></span>
					<p class="txt">
							배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 
							<a href="#none" onclick="window.parent.location.href = '/shop/mypage/mypage_qna.php'" class="emph">1:1 문의</a>에 남겨주세요.
						</p></li>
				</ul>
				<div class="sort" style="bottom: -9px">
					<select
						onchange="this.form.sort.value=this.value;this.form.submit()">
						<option value="1">최근등록순</option>
						<option value="2">좋아요많은순</option>
						<option value="3">조회많은순</option>
					</select>
				</div>
			</div>
		</div>
		<table class="xans-board-listheader" width="100%" border="0"
			cellpadding="0" cellspacing="0">
			<caption style="display: none">구매후기 제목</caption>
			<colgroup>
				<col style="width: 70px;">
				<col style="width: auto;">
				<col style="width: 51px;">
				<col style="width: 77px;">
				<col style="width: 100px;">
				<col style="width: 40px;">
				<col style="width: 80px;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="col" class="input_txt">번호</th>
					<th scope="col" class="input_txt">제목</th>
					<th scope="col" class="input_txt">작성자</th>
					<th scope="col" class="input_txt">작성일</th>
					<th scope="col" class="input_txt">조회</th>
				</tr>
			</tbody>
		</table>
		<div class="tr_line on">
			<table class="xans-board-listheaderd tbl_newtype1" width="100%"
				cellpadding="0" cellspacing="0"
				onclick="view_content(this,event,'notice')">
				<caption style="display: none">구매후기 내용</caption>
				<colgroup>
					<col style="width: 70px;">
					<col style="width: auto;">
					<col style="width: 51px;">
					<col style="width: 77px;">
					<col style="width: 100px;">
					<col style="width: 40px;">
					<col style="width: 80px;">
				</colgroup>
				<tbody>
					<tr>

						<td align="center">공지</td>
						<td class="btitle">
							<div>금주의 Best 후기 안내</div>
						</td>
						<td class="user_grade grade_comm"></td>
						<td class="bwirter">Marketkurly</td>
						<td class="bregdate">2019-11-01</td>
						<td><span class="breview" data-sno="6412655">275635</span></td>
					</tr>
				</tbody>
			</table>
			<div data-sno="6412655" class="review_view review_notice"
				style="display: none;">
				<div class="inner_review">
					<div class="name_purchase">
						<strong class="name"></strong>
						<p class="package"></p>
					</div>

					<div class="goods-review-grp-btn"></div>
				</div>
			</div>
			<div class="tr_line">
				<table class="xans-board-listheaderd tbl_newtype1" width="100%"
					cellpadding="0" cellspacing="0"
					onclick="view_content(this,event,'notice')">
					<caption style="display: none">구매후기 내용</caption>
					<colgroup>
						<col style="width: 70px;">
						<col style="width: auto;">
						<col style="width: 51px;">
						<col style="width: 77px;">
						<col style="width: 100px;">
						<col style="width: 40px;">
						<col style="width: 80px;">
					</colgroup>
					<tbody>
						<tr>
					<tbody>
						<tr>

							<td align="center">공지</td>
							<td class="btitle">
								<div>금주의 Best 후기 안내</div>
							</td>
							<td class="user_grade grade_comm"></td>
							<td class="bwirter">Marketkurly</td>
							<td class="bregdate">2019-11-01</td>
							<td><span class="breview" data-sno="6412655">275635</span></td>
						</tr>
					</tbody>
					
		<c:forEach var="bean" items="${requestScope.productreviews.lists}">
		<td align="center">${requestScope.productreviews.bno}</td>
		<td class="btitle">
		<div>${requestScope.productreviews.btitle}</div>
		<td><details>
				<summary>내용 자세히 보기</summary>
				<p>${requestScope.productreviews.bcontent}</p>
			</details></td>
		</td>
		<td class="user_grade grade_comm"></td>
		<td class="bwirter">${requestScope.productreviews.bwriter}</td>
		<td class="bregdate">$requestScope.productreviews.bregdate}</td>
		<td><span class="breview">$requestScope.productreviews.breview}</span></td>
		</tr>
	</c:forEach>
	
	</tbody>
	
</table>
</div>
</div>
</form:form>

<%-- <div id="foot">
	<a href="<%=contextPath%>/insert.prr">상품 후기 작성</a>
</div> --%>
<%-- <div align="center">
	<footer>${requestScope.pagingHtml}</footer>
</div> --%>


<br>
<br>
<br>
<br>



<!----------------------------------------------------- 상품 후기 리스트  ------------------------------------------------------------------------------------>
		</div>
	</div>
	
	
<!----------------------------------------------------- 상품 후기 게시판 ------------------------------------------------------------------------------------>



	<!--Product Description Review Area Start-->
	<!-- may also like product start -->
	<div class="product-area pb-65   product-padding">
		<div class="container">
			<div class="section-title-2 text-center mb-25">
				<h2 class="m-0">You may also like…</h2>
				<p>The most prominent product in the store, which was bought
					with the highest number - upsell</p>
			</div>

			<div class="row">
				<div class="product-slider-active owl-carousel">
					<div class="col-lg-4 col-md-6 col-12">
						<div class="product-wrapper mb-35">
							<div class="product-img">
								<a href="product-details.html"> <span class="onsale">Sale!</span>
									<img alt=""
									src="<%=contextPath%>/resources/assets/img/products/1.jpg">
								</a>
								<div class="product-action-2">
									<a href="#" title="Add to Compare"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-refresh"></i>
									</a> <a href="#" title="Add to Wishlist"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-favorite-outline"></i>
									</a> <a href="#" title="Quick View" data-target="#exampleModal"
										data-toggle="modal" class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-search"></i>
									</a> <a href="#" title="Add To Cart" class="action-plus-2 tooltip">
										<i class="zmdi zmdi-shopping-cart-plus"></i>
									</a>
								</div>
								<div class="rating-box">
									<a href="#" title="1 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="2 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="3 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="4 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="5 star"> <i class="far fa-star"></i>
									</a>
								</div>
							</div>
							<div class="product-content text-center">
								<h4>
									<a href="product-details.html">Commodo dolor</a>
								</h4>
								<div class="product-price-2">
									<div class="price-box">
										<del>
											<span class="amount"> <span
												class="Price-currencySymbol">$</span>80.00
											</span>
										</del>
										<ins>
											<span class="amount"> <span
												class="Price-currencySymbol">$</span>75.00
											</span>
										</ins>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-12">
						<div class="product-wrapper mb-35">
							<div class="product-img">
								<a href="product-details.html"> <img alt=""
									src="<%=contextPath%>/resources/assets/img/products/2.jpg">
								</a>
								<div class="product-action-2">
									<a href="#" title="Add to Compare"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-refresh"></i>
									</a> <a href="#" title="Add to Wishlist"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-favorite-outline"></i>
									</a> <a href="#" title="Quick View" data-target="#exampleModal"
										data-toggle="modal" class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-search"></i>
									</a> <a href="#" title="Add To Cart" class="action-plus-2 tooltip">
										<i class="zmdi zmdi-shopping-cart-plus"></i>
									</a>
								</div>
								<div class="rating-box">
									<a href="#" class="rated" title="1 star"> <i
										class="far fa-star"></i>
									</a> <a href="#" class="rated" title="2 star"> <i
										class="far fa-star"></i>
									</a> <a href="#" class="rated" title="3 star"> <i
										class="far fa-star"></i>
									</a> <a href="#" title="4 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="5 star"> <i class="far fa-star"></i>
									</a>
								</div>
							</div>
							<div class="product-content text-center">
								<h4>
									<a href="product-details.html">Auctor sem</a>
								</h4>
								<div class="product-price-2">
									<div class="price-box">
										<ins>
											<span class="amount"> <span
												class="Price-currencySymbol">$</span>195.00
											</span>
										</ins>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-12">
						<div class="product-wrapper mb-35">
							<div class="product-img">
								<a href="product-details.html"> <img alt=""
									src="<%=contextPath%>/resources/assets/img/products/5.jpg">
								</a>
								<div class="product-action-2">
									<a href="#" title="Add to Compare"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-refresh"></i>
									</a> <a href="#" title="Add to Wishlist"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-favorite-outline"></i>
									</a> <a href="#" title="Quick View" data-target="#exampleModal"
										data-toggle="modal" class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-search"></i>
									</a> <a href="#" title="Add To Cart" class="action-plus-2 tooltip">
										<i class="zmdi zmdi-shopping-cart-plus"></i>
									</a>
								</div>
								<div class="rating-box">
									<a href="#" class="rated" title="1 star"> <i
										class="far fa-star"></i>
									</a> <a href="#" title="2 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="3 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="4 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="5 star"> <i class="far fa-star"></i>
									</a>
								</div>
							</div>
							<div class="product-content text-center">
								<h4>
									<a href="product-details.html">Endwerst goodst</a>
								</h4>
								<div class="product-price-2">
									<div class="price-box">
										<ins>
											<span class="amount"> <span
												class="Price-currencySymbol">$</span>85.00
											</span>
										</ins>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-12">
						<div class="product-wrapper mb-35">
							<div class="product-img">
								<a href="product-details.html"> <img alt=""
									src="<%=contextPath%>/resources/assets/img/products/11.jpg">
								</a>
								<div class="product-action-2">
									<a href="#" title="Add to Compare"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-refresh"></i>
									</a> <a href="#" title="Add to Wishlist"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-favorite-outline"></i>
									</a> <a href="#" title="Quick View" data-target="#exampleModal"
										data-toggle="modal" class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-search"></i>
									</a> <a href="#" title="Add To Cart" class="action-plus-2 tooltip">
										<i class="zmdi zmdi-shopping-cart-plus"></i>
									</a>
								</div>
								<div class="rating-box">
									<a href="#" class="rated" title="1 star"> <i
										class="far fa-star"></i>
									</a> <a href="#" class="rated" title="2 star"> <i
										class="far fa-star"></i>
									</a> <a href="#" class="rated"> <i class="far fa-star"></i>
									</a> <a href="#" title="4 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="5 star"> <i class="far fa-star"></i>
									</a>
								</div>
							</div>
							<div class="product-content text-center">
								<h4>
									<a href="product-details.html">Commodo dolor</a>
								</h4>
								<div class="product-price-2">
									<div class="price-box">
										<ins>
											<span class="amount"> <span
												class="Price-currencySymbol">$</span>55.00
											</span>
										</ins>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-12">
						<div class="product-wrapper mb-35">
							<div class="product-img">
								<a href="product-details.html"> <img alt=""
									src="<%=contextPath%>/resources/assets/img/products/10.jpg">
								</a>
								<div class="product-action-2">
									<a href="#" title="Add to Compare"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-refresh"></i>
									</a> <a href="#" title="Add to Wishlist"
										class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-favorite-outline"></i>
									</a> <a href="#" title="Quick View" data-target="#exampleModal"
										data-toggle="modal" class="action-plus-2 tooltip"> <i
										class="zmdi zmdi-search"></i>
									</a> <a href="#" title="Add To Cart" class="action-plus-2 tooltip">
										<i class="zmdi zmdi-shopping-cart-plus"></i>
									</a>
								</div>
								<div class="rating-box">
									<a href="#" class="rated" title="1 star"> <i
										class="far fa-star"></i>
									</a> <a href="#" class="rated" title="2 star"> <i
										class="far fa-star"></i>
									</a> <a href="#" class="rated"> <i class="far fa-star"></i>
									</a> <a href="#" title="4 star"> <i class="far fa-star"></i>
									</a> <a href="#" title="5 star"> <i class="far fa-star"></i>
									</a>
								</div>
							</div>
							<div class="product-content text-center">
								<h4>
									<a href="product-details.html">Auctor sem</a>
								</h4>
								<div class="product-price-2">
									<div class="price-box">
										<ins>
											<span class="amount"> <span
												class="Price-currencySymbol">$</span>60.00
											</span>
										</ins>
									</div>
								</div>
							</div>
						</div>
					</div>
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






