<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 부트 스트랩 -->

<%!
	String YesForm = null ;
	String NoForm = null ;
%>
<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/controller"; //서블릿에 정의되어 있슴
	
	//폼 태그에서 사용할 변수
	//YesForm = contextPath + mappingName ;
	
	//폼이 아닌 곳에서 사용할 변수
	//NoForm = contextPath + mappingName + "?command=" ;
%>

<%
	//out.print( "YesForm : " + YesForm + "<br>") ;
	//out.print( "NoForm : " + NoForm + "<br>") ;

%>
<%!
	String MakeCommand(String ... args){
		if( args.length == 0 ){
			return YesForm  ;
		}else if( args.length == 1 ){
			return YesForm + "?command=" + args[0]   ;	
		}else{
			String imsi = args[1] ;
			return YesForm + "?command=" + args[0] + "&" + imsi  ;
		}
	}
%>

<c:set var="contextPath" value="<%=contextPath%>" scope="application"/> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">

		function findZipcode() { /*우편 번호 찾기 버튼 클릭*/
			
			var url = '<%=contextPath%>/zipcheck.me';
			window.open(url, 'mywin', 'height=600, width=720, ststusbar=yes, scrollbars=yes, resizable=no');
														  		// 상태 포커스 , 스크롤 바 , 리사이즈 안되게
			//alert('우편 번호 찾기') ;
		}

		
		
	</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	
	<style type="text/css">
		/* 유효성 검사시 보여 주는 빨간색 글자를 위한 스타일 입니다. */
		.err{ 
			font-size : 10pt;
			color:red;
			font-weight: bolder;
		}
		#myalert{ 
			font-size : 15px;
			margin-top: 7px;
			margin-right: 20px;
			color:black;
		}
	</style>	
</head>
<body>


<div align="center" class="container col-sm-offset-2 col-sm-8">
	<h2>회원가입 페이지 입니다.</h2>
	
	<div class="panel panel-primary sub_container">
		<div class="panel panel-heading" align="left">
			<b>회원가입</b>
				페이지 입니다.
		</div>
		
		<div class="panel panel-body">
			<form:form modelAttribute="member" action="${contextPath}/insert.me" method="post"
			class="form-horizontal" role="form" name="myform" >
			
			<%-- jsp 주석 : isCheck가 false이면 가입이 불가능 합니다. --%>
			<input type="hidden" name="isCheck" value="true">
			
			<!-- html 주석 : 마일리지 포인트는 숨겨져 넘깁니다. (*참고 : 소스보기 시 이 주석은 보인다.)-->
			<input type="hidden" name="mpoint" value="5">
			
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="id" class="col-sm-3">
					아이디
				</label>
				<div class="col-sm-7">
					<form:input path="id" type="text" id="id" name="id" 
						class="form-control" value="${id}" />
					<form:errors cssClass="err" path="id" />
				</div>
				<div class="col-sm-2" align="left">
					<input type="button" class="btn btn-info" value="ID중복체크"
					 >
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="name" class="col-sm-3">
					이름
				</label>
				<div class="col-sm-9">
					<form:input path="name" type="text" id="name" name="name" 
						class="form-control" value="${name}" />
					<form:errors cssClass="err" path="name" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="password" class="col-sm-3">
					비밀번호
				</label>
				<div class="col-sm-9">
					<form:input path="password" type="password" id="password" name="password" 
						class="form-control" value="${password}" />
					<form:errors cssClass="err" path="password" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="email" class="col-sm-3">
					이메일
				</label>
				<div class="col-sm-9">
					<form:input path="email" type="text" id="email" name="email" 
						class="form-control" value="${email}" />
					<form:errors cssClass="err" path="email" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="phone" class="col-sm-3">
					전화 번호
				</label>
				<div class="col-sm-9">
					<form:input path="phone" type="text" id="phone" name="phone" 
						class="form-control" value="${phone}" />
					<form:errors cssClass="err" path="phone" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="gender" class="col-sm-3">
					성별
				</label>
				<div class="col-sm-9" align="left">
					<label class="radio-inline">
						<form:radiobuttons path="gender" items="${radiolist}" 
							itemLabel="mykey" itemValue="mykey" style="margin-left:70px;"/>
						<form:errors cssClass="err" path="gender" />
					</label>
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="birth" class="col-sm-3">
					생일
				</label>
				<div class="col-sm-9">
					<form:input path="birth" type="text" id="birth" name="birth" 
						class="form-control" value="${birth}" />
					<form:errors cssClass="err" path="birth" />
				</div>
			</div>
			
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="zipcode" class="col-sm-3">
					우편번호
				</label>
				<div class="col-sm-7">
				<%-- 우편 번호와 주소는 읽기 전용 이므로 form: 네임 스페이스를 사용하지 않고 처리 해야 함 --%>
				<%-- 진짜 우편 번호와 주소란에 입력이 안되는 문제 입니다. --%>
					<input type="text" id="fakezipcode" name="fakezipcode" 
						class="form-control" value="123" disabled="disabled"/>
					<form:input path="zipcode" type="hidden" name="zipcode" id="zipcode" 
						class="form-control" value="${zipcode}" />
					<form:errors cssClass="err" path="zipcode" />
				</div>
				<div class="col-sm-2" align="left">
					<input type="button" class="btn btn-info" value="우편번호찾기" 
						onclick="javascript:findZipcode();" >
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="address1" class="col-sm-3">
					주소
				</label>
				<div class="col-sm-9">
					<input type="text" name="fakeaddress1" id="fakeaddress1" 
								class="form-control" disabled="disabled" placeholder="주소"
								value="aaa"> 
						<input type="hidden" id="address1" name="address1" value="${address1}">
					<form:errors cssClass="err" path="address1" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="address2" class="col-sm-3">
					상세 주소
				</label>
				<div class="col-sm-9">
					<form:input path="address2" type="text" id="address2" name="address2" 
						class="form-control" value="${address2}" />
					<form:errors cssClass="err" path="address2" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<div class="col-sm-12">
				
					<button type="submit" class="btn btn-default"
					onclick="return checkForm();">
						☆회원 가입☆
					</button>
					
					<button type="reset" class="btn btn-default" style="margin:20px;"> 
						★초기화★
					</button>
				</div>
			</div>
			
			</form:form>
		</div>
	</div>
</div>










</body>
</html>