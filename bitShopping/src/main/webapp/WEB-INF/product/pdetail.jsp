<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%@ include file="/WEB-INF/common/common.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<script type="text/javascript">
</script>
<style>
</style>

</head>
<body>

<%--
 <br><br><br><br><br><br>
상품 상세 페이지 입니다.
<br><br><br>
	상품 이름 : ${bean.productname}
<br><br><br>
	상품 가격 : ${bean.price}
<br><br><br>
	상품 재고 : ${bean.pqty}
<br><br><br>
	상품 카테고리 : ${bean.pcategory}
<br><br><br>
<br><br><br>
 --%>


<c:set var="discount" value="0.15" scope="application"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Single Product - Benco</title>
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
                           <!-- <div class="product-rating">
                                 <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                                <i class="ion-ios-star"></i>
                               		 <span>별점</span>
                            </div> -->
                            <div class="product-price">
                                <span class="old">${bean.price} 원</span>
                                <span class="discountprice"><fmt:formatNumber value="${bean.price*0.85}" pattern="#,##0" /> 원</span>
                            </div>
                            <div class="product-overview">
                                <h5 class="pd-sub-title">Product Overview</h5>
                                <p>상품 설명 : ${bean.pcontents}<br>Lorem ipsum dolor sit amet, consectetur adipic it, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
                                enim ad minim veniam, quisnostrud orbit asom exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat consectetur.</p>
                            </div>
                       

                            <div class="quickview-plus-minus">
                                <div class="cart-plus-minus">
                                    <input type="text" value="02" name="qtybutton" class="cart-plus-minus-box">
                                </div>
                                <div class="quickview-btn-cart">
                                    <a class="btn-style cr-btn" href="<%-- <%ContextPath%>/insert.mall --%>">
                                        <span>add to cart</span>
                                    </a>
                                </div>
                                <div class="quickview-btn-wishlist">
                                    <a class="btn-hover cr-btn" href="#">
                                        <span>
                                            <i class="ion-ios-heart-outline"></i>
                                        </span>
                                    </a>
                                </div>
                            </div>
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
                                    <li>
                                        <a href="#">
                                            <i class="ion-social-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ion-social-tumblr"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ion-social-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ion-social-instagram-outline"></i>
                                        </a>
                                    </li>
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
                                <li>
                                    <a class="active" data-toggle="tab" href="#description">Description</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#reviews">Reviews (1)</a>
                                </li>
                            </ul>
                            <!--Review And Description Tab Menu End-->
                            <!--Review And Description Tab Content Start-->
                            <div class="tab-content product-review-content-tab" id="myTabContent-4">
                                <div class="tab-pane fade active show" id="description">
                                    <div class="single-product-description">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique
                                            auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida
                                            semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.</p>
                                        <p>Pellentesque aliquet, sem eget laoreet ultrices, ipsum metus feugiat sem, quis fermentum
                                            turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam,
                                            purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non
                                            neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et
                                            placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque
                                            metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet
                                            ligula euismod eget.</p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="reviews">
                                    <div class="review-page-comment">
                                        <h2>1 review for Sit voluptatem</h2>
                                        <ul>
                                            <li>
                                                <div class="product-comment">
                                                    <img src="<%=contextPath%>/resources/assets/img/author.png" alt="">
                                                    <div class="product-comment-content">
                                                        <div class="product-reviews">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <p class="meta">
                                                            <strong>admin</strong> -
                                                            <span>November 22, 2016</span>
                                                            <div class="description">
                                                                <p>Good Product</p>
                                                            </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="review-form-wrapper">
                                            <div class="review-form">
                                                <span class="comment-reply-title">Add a review </span>
                                                <form action="#">
                                                    <p class="comment-notes">
                                                        <span id="email-notes">Your email address will not be published.</span>
                                                        Required fields are marked
                                                        <span class="required">*</span>
                                                    </p>
                                                    <div class="comment-form-rating">
                                                        <label>Your rating</label>
                                                        <div class="rating">
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>
                                                            <i class="far fa-star"></i>                                   
                                                        </div>
                                                    </div>
                                                    <div class="input-element">
                                                        <div class="comment-form-comment">
                                                            <label>Comment</label>
                                                            <textarea name="message" cols="40" rows="8"></textarea>
                                                        </div>
                                                        <div class="review-comment-form-author">
                                                            <label>Name* </label>
                                                            <input required="required" type="text">
                                                        </div>
                                                        <div class="review-comment-form-email">
                                                            <label>Email* </label>
                                                            <input required="required" type="text">
                                                        </div>
                                                        <div class="comment-submit">
                                                            <input type="submit"  class="submit" id="submit">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Review And Description Tab Content End-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Product Description Review Area Start-->
        <!-- may also like product start -->
        <div class="product-area pb-65   product-padding">
            <div class="container">
                <div class="section-title-2 text-center mb-25">
                    <h2 class="m-0">You may also like…</h2>
                    <p>The most prominent product in the store, which was bought with the highest number - upsell</p>
                </div>

                <div class="row">
                    <div class="product-slider-active owl-carousel">
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <span class="onsale">Sale!</span>
                                        <img alt="" src="<%=contextPath%>/resources/assets/img/products/1.jpg">
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
                                        <a href="product-details.html">Commodo dolor</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <del>
                                                <span class="amount">
                                                    <span class="Price-currencySymbol">$</span>80.00</span>
                                            </del>
                                            <ins>
                                                <span class="amount">
                                                    <span class="Price-currencySymbol">$</span>75.00</span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img alt="" src="<%=contextPath%>/resources/assets/img/products/2.jpg">
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
                                        <a href="#" class="rated" title="1 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" class="rated" title="2 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" class="rated" title="3 star">
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
                                        <a href="product-details.html">Auctor sem</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    <span class="Price-currencySymbol">$</span>195.00</span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img alt="" src="<%=contextPath%>/resources/assets/img/products/5.jpg">
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
                                        <a href="#" class="rated" title="1 star">
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
                                        <a href="product-details.html">Endwerst goodst</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    <span class="Price-currencySymbol">$</span>85.00</span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img alt="" src="<%=contextPath%>/resources/assets/img/products/11.jpg">
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
                                        <a href="#" class="rated" title="1 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" class="rated" title="2 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" class="rated">
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
                                        <a href="product-details.html">Commodo dolor</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    <span class="Price-currencySymbol">$</span>55.00</span>
                                            </ins>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="product-wrapper mb-35">
                                <div class="product-img">
                                    <a href="product-details.html">
                                        <img alt="" src="<%=contextPath%>/resources/assets/img/products/10.jpg">
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
                                        <a href="#" class="rated" title="1 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" class="rated" title="2 star">
                                            <i class="far fa-star"></i>
                                        </a>
                                        <a href="#" class="rated">
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
                                        <a href="product-details.html">Auctor sem</a>
                                    </h4>
                                    <div class="product-price-2">
                                        <div class="price-box">
                                            <ins>
                                                <span class="amount">
                                                    <span class="Price-currencySymbol">$</span>60.00</span>
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
      
            

<%@ include file="/WEB-INF/common/footer.jsp" %>
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
















</body>
</html>