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


<title>마켓 컬리</title>
  
  <style>
  /* Make the image fully responsive */
	.carousel-inner img {
	   width: 100%;
	   height: 370px;
	}
	.carousel-control-prev{
		margin-top: 100px;
	}
	.carousel-control-next{
		margin-top: 100px;
	}  
    .logo{
    	align-items: center;
    }
	.carousel-control-prev{
 		  background: url(https://res.kurly.com/pc/service/main/1908/ico_prev1_x2.png) no-repeat 50% 50%;
  		  background-size: 52px 52px;
	}
	.product-img img{
		width: 250px !important;
		height: 320px !important;
	}
	h4{
    	font-family: Roboto Slab !important;
    }

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
 </style>
	
	
</head>
<body>

<!-- 사진 슬라이드 시작 -->
<div id="demo" class="carousel slide" data-ride="carousel">

<!--   <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="4"></li>
    <li data-target="#demo" data-slide-to="5"></li>
  </ul> -->
  
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1602809211.jpg" alt="배너1" width="960" height="350">
    </div>
    
    <div class="carousel-item">
      <img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1577869708.jpeg" alt="배너2" width="960" height="350">
    </div>
    
    <div class="carousel-item">
      <img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1612949959.jpg" alt="배너3" width="960" height="350">
    </div>
    
    <div class="carousel-item">
      <img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1614318530.jpg" alt="배너4" width="960" height="350">
    </div>
    
    <div class="carousel-item">
      <img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1614317517.jpg" alt="배너5" width="960" height="350">
    </div>
  </div>
  
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<br><br><br>




 <!-- may also like product start -->
        <div class="product-area pb-65   product-padding">
            <div class="container">
                <div class="section-title-2 text-center mb-25">
                    <h2 class="m-0">간식 추천</h2>
                    <p>컬리가 추천하는 지루한 오후를 위한 간식 추천</p>
                </div>

                <div class="row">
                    <div class="product-slider-active owl-carousel">
	                    <c:forEach var="bean" items="${requestScope.lists3}">
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
	                                        <a href="#" title="Add To Cart"  class="action-plus-2 tooltip">
	                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
	                                        </a>
	                                    </div>
	                                    <div class="rating-box">
	                                        <a href="#" title="1 star">
	                                            <i class="far fa-star"></i>
	                                        </a>
	                                        <a href="#" title="2 star">
	                                            <i class="far fa-star"></i>
	                                        </a>
	                                        <a href="#" title="3 star">
	                                            <i class="far fa-star"></i>
	                                        </a>
	                                        <a href="#" title="4 star">
	                                            <i class="far fa-star"></i>
	                                        </a>
	                                        <a href="#" title="5 star">
	                                            <i class="far fa-star"></i>
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




 <!-- may also like product start -->
        <div class="product-area pb-65   product-padding">
            <div class="container">
                <div class="section-title-2 text-center mb-25">
                    <h2 class="m-0">신선식품 추천</h2>
                    <p>컬리가 추천하는 건강을 위한 신선식품 추천</p>
                </div>

                <div class="row">
                    <div class="product-slider-active owl-carousel">
	                    <c:forEach var="bean" items="${requestScope.lists2}">
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
	                                        <a href="#" title="Add To Cart"  class="action-plus-2 tooltip">
	                                            <i class="zmdi zmdi-shopping-cart-plus"></i>
	                                        </a>
	                                    </div>
	                                    <div class="rating-box">
	                                        <a href="#" title="1 star">
	                                            <i class="far fa-star"></i>
	                                        </a>
	                                        <a href="#" title="2 star">
	                                            <i class="far fa-star"></i>
	                                        </a>
	                                        <a href="#" title="3 star">
	                                            <i class="far fa-star"></i>
	                                        </a>
	                                        <a href="#" title="4 star">
	                                            <i class="far fa-star"></i>
	                                        </a>
	                                        <a href="#" title="5 star">
	                                            <i class="far fa-star"></i>
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





<%@ include file="/WEB-INF/common/footer.jsp" %>


<br><br><br>
<br><br><br>
		<a href="<%=contextPath%>/list.me">회원 목록 보기</a>
<br><br><br>

		<a href="<%=contextPath%>/list.prr">상품 후기 게시판</a>
<br><br><br>

	<a href="<%=contextPath%>/payment.pm">결제하기</a>

<br><br><br>
<br><br><br>
<a href="<%=contextPath%>/delete.me?mid=">회원 탈퇴하기</a>
<br><br><br>
<br><br><br>
<a href="<%=contextPath%>/address.ad">배송지 관리 페이지 보기</a>
<br><br><br>
<a href="<%=contextPath%>/service.sr"> 1:1문의 Page</a>

    <!-- all js here -->
    <script src="<%=contextPath%>/resources/assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/popper.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/bootstrap.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/isotope.pkgd.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/jquery.counterup.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/waypoints.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/ajax-mail.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/owl.carousel.min.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/plugins.js"></script>
    <script src="<%=contextPath%>/resources/assets/js/main.js"></script>

</body>
</html>


