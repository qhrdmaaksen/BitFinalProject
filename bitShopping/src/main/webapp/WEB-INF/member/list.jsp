<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 부트 스트랩 -->
<% int twelve = 12 ; %>
<c:set var="twelve" value="12" />
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

<%
	int myoffset = 2;
	int mywidth = 12 - 2 * myoffset;
	int formleft = 3 ;
	int formright = 12 - formleft ; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap Sample</title>
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
	<script type="text/javascript">
	/* 검색 모드와 해당 키워드를 이용한 필드 검색 */
	
		function search() {
			//alert($('#mode').val()) ;
			var mode = $('#mode').val();
			var keyword = $('#keyword').val();
			
			if(mode == 'all'){ // 전체 모드
				alert('검색 모드를 선택 해 주세요.');
				$('#mode').focus(); /* 해당 영역에 포커스 넣기 */
			}else {
				// alert(keyword); // 글자 출력
				// alert(keyword.length); // 글자의 길이 출력
			}
			var param = '?mode=' + mode + '&keyword=' + keyword ; // ?문자=변수&문자=변수
			var url = '<%=contextPath%>/list.me' + param ; /* 파라미터와 함께 요청하기 */
			alert(url);
			// location.href=url ;
		}
		
		function searchAll() {
			/* location 객체의 href 속성은 특정 페이지로 이동하기 위한 자바 스크립트 내장 객체 */
			location.href='<%=contextPath%>/list.me' ;
		}
	
	</script>

</head>
<body>
	<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-warning">
			<div class="panel-heading"><h4>회원 목록</h4></div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>생일</th>
						<th>성별</th>
						<th>우편번호</th>
						<th>주소</th>
						<th>세부 주소</th>
						<th>포인트</th>					
					</tr>
				</thead>
				
				<tr>
					<td colspan="12" align="center">
						<form class="form-inline" action="<%=contextPath%>/list.me" method="get">
							<div class="form-group">
								<select class="form-control" name="mode" id="mode">
									<option value="all">----선택하세요----
									<option value="name">이름
									<option value="gander">성별
								</select>
							</div>
							<div class="form-group">
								<input type="text" class="form-control"
								   name="keyword" id="keyword" placeholder="검색 키워드를 넣어주세요">
							</div>
							<button class="btn btn-default" type="button" onclick="search();">검색</button>
							<button class="btn btn-default" type="button" onclick="searchAll();">전체 검색</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<p class="form-control-static">
								${requestScope.pageInfo.pagingStatus}
							</p>
						</form>
				</tr>
				
				
				<c:forEach var="bean" items="${requestScope.lists}">
					<tr>
						<td>${bean.mid}</td>
						<td>
								${bean.name}
						</td>
						<td>${bean.email}</td>
						<td>${bean.phone}</td>
						<td>${bean.birth}</td>
						<td>${bean.gender}</td>
						<td>${bean.zipcode}</td>
						<td>${bean.address1}</td>
						<td>${bean.address2}</td>
						<td>${bean.mpoint}</td>
					</tr>
				</c:forEach>				
			</table>
		</div>
		<div align="center">
			<footer>${requestScope.pageInfo.pagingHtml}</footer>	
		</div>		
	</div>


</body>
</html>




