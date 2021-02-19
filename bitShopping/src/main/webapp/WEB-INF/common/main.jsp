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
	   height: 350px;
	}
    .logo{
    	align-items: center;
    }
   .line{
    	color: white;
   } 
	.carousel-control-prev{
 		  background: url(https://res.kurly.com/pc/service/main/1908/ico_prev1_x2.png) no-repeat 50% 50%;
  		  background-size: 52px 52px;
	}
 </style>
	

<script type="text/javascript">
    $(document).ready(function(){
      $("#top-message-close").on("click",function(){
        setCookie('top_msg_banner2','set_cookie',1)
      });
      if(getCookie('top_msg_banner2') == 'set_cookie'){
        $("#top-message").hide()
      }else{
        $("#top-message").show() ;
      }
    });

/*     function setCookie(cookieName, value, exdays){
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
      var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
      document.cookie = cookieName + "=" + cookieValue +"; path=/;"
    }

    function getCookie(cookieName) {
      cookieName = cookieName + '=';
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cookieName);
      var cookieValue = '';
      if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
    } */
  </script>

</head>
<body>


<div class="line">
------------------------------------------------------------------------------------------------------------------------------
</div>

<!-- 사진 슬라이드 시작 -->
<div id="demo" class="carousel slide" data-ride="carousel">

  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1612946357.jpg" alt="배너1" width="960" height="350">
      <div class="carousel-caption">
      </div>   
    </div>
    
    <div class="carousel-item">
      <img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1612866708.jpg" alt="배너2" width="960" height="350">
      <div class="carousel-caption">
      </div>   
    </div>
    
    <div class="carousel-item">
      <img src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1612949959.jpg" alt="배너3" width="960" height="350">
      <div class="carousel-caption">
        <!-- <h3>New York</h3>
        <p>We love the Big Apple!</p> -->
      </div>   
    </div>
    
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>




<%@ include file="/WEB-INF/common/footer.jsp" %>


<br><br><br>
<br><br><br>
		<a href="<%=contextPath%>/list.me">회원 목록 보기</a>
<br><br><br>
		<a href="<%=contextPath%>/pdetail.pr?pno=1&${requestScope.parameters}">
			제품 상세 보기</a>
<br><br><br>

		<a href="<%=contextPath%>/list.prr">상품 후기 게시판</a>
<br><br><br>
<a href="<%=contextPath%>/mypage.me?mid=admin&${requestScope.parameters}">마이 페이지</a>

<br><br><br>
<br><br><br>

</body>
</html>


