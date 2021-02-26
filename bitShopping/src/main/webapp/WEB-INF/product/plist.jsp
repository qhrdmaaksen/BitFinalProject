<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./../common/common.jsp" %>
<%@page import="utility.Paging"%>
<!doctype html>

<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>3teamProductList</title>
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
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/style.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/assets/css/responsive.css">
    <script src="<%=contextPath%>/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script>
        function search(){
            if ( $('#mode').val() == 'all'){
                alert('검색 목록을 선택해주세요.');
            }
        }
        function searchAll(){
            location.href='<%=contextPath%>/plist.pr';
        }
    </script>
</head>

<body>
    <div class="wrapper">
      
        <!-- breadcrumbs area start -->
        <div class="title-breadcrumbs">
            <div class="title-breadcrumbs-inner">
                <div class="container">
                    <nav class="woocommerce-breadcrumb">
                        <a href="<%=contextPath%>/main.cu">Home</a>
                        <span class="separator">/</span> Shop
                    </nav>
                </div>
            </div>
        </div>
        <!-- breadcrumbs area End -->
        <div class="shop-wrapper pt-50 pb-60 pr-140">
            <div class="container" >

                <div class="grid-list-product-wrapper" align="center">
                    <div class="product-grid product-view">
                        <div class="row">
                            <div class="col-xl-3 col-lg-3 col-md-12 col-12">
                                <div class="row_products_side">
                                </div>
                            </div>

                            <div class=" col-xl-9 col-lg-9 col-md-12 col-12">

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-12 ">
                                        <div class="shop_top_banner">
                                            <img src="<%=contextPath%>/resources/assets/img/products/쇼핑목록배너.jpg" alt="쇼핑목록배너.jpg">
                                        </div>
                                        <div class="tolbar__area">
                                            <div class="toolbar clearfix">
                                                <div class="toolbar-inner">
                                                    <div class="shop-tab view-mode nav" role=tablist>
                                                        <a class="active" href="#product-grid" data-toggle="tab" role="tab" aria-selected="false">
                                                            <i class="ion-grid"></i>
                                                        </a>
                                                        <a href="#product-list" data-toggle="tab" role="tab" aria-selected="true">
                                                            <i class="ion-navicon"></i>
                                                        </a>
                                                    </div>
                                                    <p class="woocommerce-result-count"
                                                        class="form-control-static">${requestScope.pageInfo.pagingStatus}
                                                    </p>
													<form class="form-inline" role="form" name="myform"
														action="<%=contextPath%>/plist.pr" method="get">
														<input type="hidden" name="command" value="plist.pr">
														<div class="form-group">
															<select class="form-control" name="mode" id="mode">
																<option value="all" selected="selected">--선택하세요---------</option>
																<option value="productname">상품명</option>
																<option value="pcategory">상품 종류</option>
																<option value="pcontents">상품 내용</option>
															</select>
														</div>
														<div class="form-group">
															<input type="text" class="form-control btn-xs"
																name="keyword" id="keyword" placeholder="검색 키워드">
														</div>
														<button class="btn btn-default btn-warning" type="submit"
															onclick="search();">검색</button>
														<button class="btn btn-default btn-warning" type="button"
															onclick="searchAll();">전체 검색</button>

														<c:if test="${whologin == 2}">
															<button class="btn btn-default btn-info" type="button"
																onclick="writeForm();">상품 등록</button>
														</c:if>
													</form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="shop-product-content tab-content">
                                    <div id="product-grid" class="tab-pane fade active show">
                                        <div class="row">
                                        <c:forEach var="bean" items="${requestScope.lists}">
                                            <div class="col-lg-4 col-md-6 col-12">
                                                <div class="product-wrapper mb-60">
                                                    <div class="product-img">
                                                        <a href="<%=contextPath%>/pdetail.pr?pno=${bean.productcode}">
                                                            <img alt="${bean.pimg1}" src="<%=contextPath%>/resources/assets/img/products/${bean.pimg1}">
                                                        </a>
                                                        <div class="product-action-2">
                                                            <a href="#" title="Add To Cart"  class="action-plus-2 tooltip">
                                                                <i class="zmdi zmdi-shopping-cart-plus"></i>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-content text-center">
                                                        <h4>
                                                            <a href="product-details.html">${bean.productname}</a>
                                                        </h4>
                                                        <div class="product-price-2">
                                                            <div class="price-box">
                                                                <ins>
                                                                    <span class="amount">
                                                                        <span class="Price-currencySymbol"></span>${bean.price}&nbsp;&nbsp;원</span>
                                                                </ins>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           	</c:forEach>
                                        </div>
                                    </div>




                                    <div id="product-list" class="tab-pane fade">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-12">
                                                <div class="product-wrapper mb-60">
                                                	<c:forEach var="bean" items="${requestScope.lists}">
                                                    <div class="product-img">
                                                        <a href="<%=contextPath%>/pdetail.pr?pno=${bean.productcode}">
                                                            <img alt="${bean.pimg1}" src="<%=contextPath%>/resources/assets/img/products/${bean.pimg1}">
                                                        </a>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4>
                                                            <a href="product-details.html">${bean.productname}</a>
                                                        </h4>
                                                        <div class="product-price-2">
                                                            <div class="price-box">
                                                                <ins>
                                                                    <span class="amount">
                                                                        <span class="Price-currencySymbol"></span>${bean.price} 원</span>
                                                                </ins>
                                                            </div>
                                                        </div>
                                                        <p>
                                                        	${bean.pcontents}Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce posuere
                                                            metus vitae arcu imperdiet, id aliquet ante scelerisque. Sed
                                                            sit amet sem vitae urna fringilla tempus Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce posuere.
                                                        </p>
                                                        <div class="product-action-2">
                                                            <a href="#" title="Add To Cart"  class="action-plus-2 list_bg_add tooltip">
                                                                <i class="zmdi zmdi-shopping-cart-plus"></i> Add to cart
                                                            </a>
                                                        </div>
                                                    </div>
													</c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <table>
								<tr>
									<td colspan="12" align="center">
										<form class="form-inline" role="form" name="myform"
											action="<%=contextPath%>/plist.pr" method="get">
											<input type="hidden" name="command" value="plist.pr">
											<div class="form-group">
												<select class="form-control" name="mode" id="mode">
													<option value="all" selected="selected">--
														선택하세요---------
													<option value="productname">상품명
													<option value="pcategory">상품 종류
													<option value="pcontents">상품 내용
												</select>
											</div>
											<div class="form-group">
												<input type="text" class="form-control btn-xs"
													name="keyword" id="keyword" placeholder="검색 키워드">
											</div>
											<button class="btn btn-default btn-warning" type="submit"
												onclick="search();">검색</button>
											<button class="btn btn-default btn-warning" type="button"
												onclick="searchAll();">전체 검색</button>

											<c:if test="${whologin == 2}">
												<button class="btn btn-default btn-info" type="button"
													onclick="writeForm();">상품 등록</button>
											</c:if>

											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<p class="form-control-static">${requestScope.pageInfo.pagingStatus}</p>
										</form>
									    <div style="margin-left: 300;">
                                           ${requestScope.pageInfo.pagingHtml}
		                                </div>
									</td>
								</tr>
							</table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->
    <div style="margin-left: 350;">
		<%@ include file="./../common/footer.jsp" %> 
	</div>
    </div>


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
    <script src="assets/js/main.js"></script>
</body>
</html>