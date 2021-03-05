<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="./../common/common.jsp" %>

<%
	int myoffset = 2;
	int mywidth = 12 - 2 * myoffset;
	int formleft = 3;
	int formright = 12 - formleft;

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.write-title{
font-family: 맑은고딕;
font-weight: bold;
padding-top: 2ex;

}

</style>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Productreviews Insert | 상품 후기 등록 게시판</title>
<body>
	<div class="mydiv col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h5 class="write-title" align="center">상품 후기 등록</h5>
			</div>
			<div class="panel-body">
				<form:form modelAttribute="productreviews" class="form-horizontal" name="myform" role="form" action="${contextPath}/insert.prr" method="post">
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="bwriter">작성자</label>
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" name="fakebwriter" id="fakebwriter"
							placeholder="작성자" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.mid})" disabled="disabled"> 
							<input type="hidden" name="bwriter"
								id="bwriter" value="${sessionScope.loginfo.mid}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="btitle">제목</label>
						<div class="col-sm-<%=formright%>">
							<form:input path="btitle" type="text" class="form-control" name="btitle"
								id="btitle" placeholer="제목을 작성해 주세요" value="${btitle}"/>
							<form:errors cssClass="err" path="btitle"/>
						</div>
					</div>
					<%-- <div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="password">비밀번호</label>
						<div class="col-sm-<%=formright%>">
							<form:input path="password" type="password" class="form-control" name="password"
								id="password" placeholder="비밀 번호를 넣어주세요" value="${bean.password}"/>
							<form:errors cssClass="err" path="password"/>
						</div>
					</div> --%>
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="bcontent">내용</label>
					<div class="col-sm-<%=formright%>">
						<form:textarea path="bcontent" name="bcontent" id="bcontent" rows="5" cols=""
								placeholder="내용" class="form-control" />
						<form:errors cssClass="err" path="bcontent"/>
					</div>
					</div>
					<div class="form-group">
						<label class="control label col-sm-<%=formleft%>" for="bregdate">작성 일자</label>
						<div class="col-sm-<%=formright%>">
							<form:input path="bregdate" type="datetime" class="form-control" name="bregdate"
								id="bregdate" placeholder="yyyy/MM/dd 형식으로 작성해 주세요" value="${bregdate}"/>
							<form:errors cssClass="err" path="bregdate" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="bimg">사진 등록</label>
						<div class="col-sm-<%=formright%>">
							<input type="file" class="form-control" name="bimg"
								id="bimg" placeholder="이미지를 넣어주세요" "/>
							<%-- <form:errors cssClass="err" path="bimg" /> --%>
						</div>
					</div>
					<div class="form-group">
						<div align="center" class="col-sm-offset-3 col-sm-6">
							<button class="btn btn-default" type="submit">글쓰기</button>
						
							<button class="btn btn-default" type="reset">취소</button>
							<button class="btn btn-default" value="목록" onclick="goBack();"></button>
							<a href="list.prr">목록</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- <script type="text/javascript">
	function goBack(){
		window.history.back();
	}
	</script> -->
</body>
</html>