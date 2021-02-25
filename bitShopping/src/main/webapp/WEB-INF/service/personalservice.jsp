<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ include file="/WEB-INF/common/common.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<%
	int myoffset = 2;
	int mywidth = 12 - 2 * myoffset;
	int formleft = 3;
	int formright = 12 - formleft;
	int mysearch = 2;
	//int label = 3 ; //양식의 왼쪽에 보여지는 라벨의 너비 
	//int content = twelve - label ; //우측의 내용 입력(input, select, textarea)의 너비
%>
<style type="text/css">
.bhs_buttonsm {
    width: 100px;
    display: inline-block;
    line-height: 30px;
    text-align: center;
    background-color: #795b8f;
    border: 1px solid #5f0080;
    color: #fff;
    font-size: 15px;
    float: right;
    margin-left: 2px;
    font-size: 13px;
}
*, *:after, *:before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    
    .panel-heading{
     background-color: #795b8f;
    }
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container col-sm-offset- col-sm-">
		<div class="panel panel-default panel-primary">
			<div class="panel-heading">
				<form class="form-inline" role="form">
					<h4>1:1문의</h4>
				</form>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>작성자</th>	
						<th>글내용</th>	
						<th>작성일</th>
					</tr>
				</thead>
				<tr>
					<td colspan="10" align="center">
						<form class="form-inline" role="form" name="myform" action="<%=contextPath%>/service.sr" method="get">
						</form>
					</td>
				</tr>
				<c:forEach var="bean" items="${requestScope.slist}">
					<tr>
						<td>${bean.sno}</td>
						<td>${bean.stitle}</td>
						<td>${bean.swriter}</td>
						<td>
							<a href="<%=contextPath%>/detailSerive.sr?no=${bean.sno}&${requestScope.parameters}">
								${bean.scontent}
							</a>
						</td>
						<td>${bean.swritedate}</td>
						</tr>
				</c:forEach>
			</table>
			
		</div>
		<a href="<%=contextPath%>/insert.sr">
		<button >
		<span class="bhs_buttonsm yb" style="float:right;">글쓰기</span>
		</button>
		</a>
</body>
</html>