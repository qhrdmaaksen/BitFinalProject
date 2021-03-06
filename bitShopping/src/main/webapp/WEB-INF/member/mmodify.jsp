
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>

<%@ include file="/WEB-INF/member/mypagenav.jsp"%>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>회원 정보 수정</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/controller/resources/assets/img/favicon.png">
    <!-- all css here -->
   <link rel="stylesheet" href="/controller/resources/assets/css/bootstrap.min.css">
     <link rel="stylesheet" href="/controller/resources/assets/css/animate.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/chosen.min.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/fontawesome-all.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/ionicons.min.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/material-design-iconic-font.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/meanmenu.min.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/tippy.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/bundle.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/style.css">
    <link rel="stylesheet" href="/controller/resources/assets/css/responsive.css"> 
    <script src="/controller/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <style type="text/controller/resources/assets/css">
	

    </style>
    
    <style type="text/css">
    .dashboard-content {
	    border: 1px solid #ebebeb;
	    padding-left: 30px;
	    padding-top: 0px !important;
	}
	.main-menu ul li a {
		font-size: 17px;
	}
    
    </style>
    
    
    
</head>

<body>
   

        <!-- breadcrumbs area End -->
        <!--My Account Area Strat-->
        <div class="my-account white-bg ptb-100">
            <div class="container">
                <div class="account-dashboard">
                        <div class="col-md-8 col-lg-8">
                            <!-- Tab panes -->
                            <div class="tab-content dashboard-content">
                                <div id="dashboard" class="tab-pane fade show active">
                                    <h3>(${sessionScope.loginfo.mid}) ${sessionScope.loginfo.name}님의 회원 정보 수정</h3>
                                    <div class="login">
                                        <div class="login-form-container">
                                            <div class="account-login-form">
                                            <form:form modelAttribute="member" action="${contextPath}/modify.me" method="post"
					 						  class="form-horizontal" role="form" name="myform">
					 						  <form:input path="mid" type="hidden" id="mid" name="mid"  value="${member.mid}"/>
					 						  <form:input path="zipcode" type="hidden" id="zipcode" name="zipcode"  value="${member.zipcode}"/>
					 						  <form:input path="address1" type="hidden" id="address1" name="address1"  value="${member.address1}"/>
					 						  <form:input path="address2" type="hidden" id="address2" name="address2"  value="${member.address2}"/>
					 						  <form:input path="mpoint" type="hidden" id="mpoint" name="mpoint"  value="${member.mpoint}"/>
					 						  <form:input path="createdate" type="hidden" id="createdate" name="createdate"  value="${member.createdate}"/>
                                                   <!--  <p>Already have an account?
                                                    </p> -->
                                                   
                                                    <label>Name</label> 
                                                   		<form:input path="name" type="text" id="name" name="name" 
															class="form-control" value="${name}" />
														<form:errors cssClass="err" path="name" />
													 <div class="input-radio">
                                                    <label>Gender</label> <br>
                                                        <span class="custom-radio">
                                                            <input name="gender" value="남자" type="radio"> 남자</span>
                                                        <span class="custom-radio">
                                                            <input name="gender" value="여자" type="radio"> 여자</span>
                                                    </div>
                                                    <label>Password</label>
                                                    	<form:input path="password" type="password" id="password" name="password" 
															class="form-control" value="${password}" />
														<form:errors cssClass="err" path="password" />
                                                    <label>Email</label>
                                                    	<form:input path="email" type="text" id="email" name="email" 
															class="form-control" value="${email}" />
														<form:errors cssClass="err" path="email" />
                                                    <label>Phone</label>
                                                    	<form:input path="phone" type="text" id="phone" name="phone" 
															class="form-control" value="${phone}" />
														<form:errors cssClass="err" path="phone" />
                                                    <label>Birthdate</label>
                                                    	<form:input path="birth" type="text" id="birth" name="birth" 
															class="form-control" value="${birth}" placeholder="MM/DD/YYYY"/>
														<form:errors cssClass="err" path="birth" />
                                                    <span class="example">
                                                        (E.g.: 05/31/1970)
                                                    </span>
                                                    <span class="custom-checkbox">
                                                        <input name="newsletter" value="1" type="checkbox">
                                                        <label>마켓컬리의 광고 및 정보 수집 개인 정보 이용에 동의합니다. (선택)
                                                            <br>
                                                            <p>*주소지 변경은 마이페이지 내 주소지 변경 탭에서 변경 가능합니다.</p>
                                                        </label>
                                                    </span>
                                                    <div class="button-box">
                                                        <button type="submit" class="default-btn">UPDATE</button>
                                                    </div>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    

    <!-- all js here -->
    <script src="/controller/resources/assets/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="/controller/resources/assets/js/popper.js"></script>
    <script src="/controller/resources/assets/js/bootstrap.min.js"></script>
    <script src="/controller/resources/assets/js/isotope.pkgd.min.js"></script>
    <script src="/controller/resources/assets/js/imagesloaded.pkgd.min.js"></script>
    <script src="/controller/resources/assets/js/jquery.counterup.min.js"></script>
    <script src="/controller/resources/assets/js/waypoints.min.js"></script>
    <script src="/controller/resources/assets/js/tippy.min.js"></script>
    <script src="/controller/resources/assets/js/ajax-mail.js"></script>
    <script src="/controller/resources/assets/js/owl.carousel.min.js"></script>
    <script src="/controller/resources/assets/js/plugins.js"></script>
    <script src="/controller/resources/assets/js/main.js"></script>
    
    
    <%@ include file="./../common/footer.jsp" %>
    
    
</body>

</html>