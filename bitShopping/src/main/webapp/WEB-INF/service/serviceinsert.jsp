<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
     <%@ include file="/WEB-INF/common/common.jsp" %>  
<%
	int myoffset = 2;
	int mywidth = 12 - 2 * myoffset;
	int formleft = 3;
	int formright = 12 - formleft;
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading">
				<h2>게시물 등록</h2>
			</div>
			<div class="panel-body">
				<c:set var="apppath" value="<%=request.getContextPath()%>" />
				<form class="form-horizontal" role="form" action="${apppath}/insert.sr"
					method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="writer">작성자</label>
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" name="fakewriter" id="fakewriter"
								placeholder="작성자" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.mid})" disabled="disabled">
							<input type="hidden" name="swriter" id="swriter"
								value="${sessionScope.loginfo.mid}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="title">글
							제목</label>
						<div class="col-sm-<%=formright%>">
							<input type="text" class="form-control" name="stitle"
								id="stitle" placeholder="글 제목" value="${bean.stitle}"> 
							<span class="err">${errstitle}</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="abcd">사진</label>
						<div class="col-sm-<%=formright%>">
							<input type="file" class="form-control" name="abcd"
								id="abcd" placeholder="">
							<span class="err form-control-static">${errsimg}</span>								
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="control-label col-sm-<%=formleft%>" for="scontent">글
							내용</label>
						<div class="col-sm-<%=formright%>">
							<textarea name="scontent" id="scontent" rows="5" cols=""
								placeholder="글 내용" class="form-control">${bean.scontent}</textarea>
						</div>
					</div>
					
					<div class="form-group">
						<div align="center" class="col-sm-offset-3 col-sm-6">
							<button class="btn btn-default" type="submit">새글 쓰기</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-default" type="reset">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>