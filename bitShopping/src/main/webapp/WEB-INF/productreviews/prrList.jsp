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

<title>Productreviews List | 상품 후기 게시판</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
div {
    word-break: break-all;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
summary {
  cursor: pointer;
} 

/*삼각형 없애기*/
summary {
  list-style: none;
}
summary::-webkit-details-marker {
  display: none;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
form {
    display: block;
    margin-top: 0em;
}
body, input, select, textarea, button {
 
    line-height: 1;
    color: #4c4c4c;
    font-size: 12px;
    max-width: 100%;
}
.xans-board-listheader {
    border-top: 2px solid #522772;
   
}
.btitle{
padding-left: 50px;
    text-align: left;
}

#foot{
position:fixed;
clear: right;
float: right;
width: 300px;
height: 50px;
left: 20;
bottom: 0px;
}
.input_txt{
padding-left: 20px
}


</style>

<body>
<form name="frmList">
<input type="hidden" name="sort" value="">
<input type="hidden" name="page_num" value="">
<input type="hidden" name="goodsno" value="13677">
<div class="title_txt">
<h2>PRODUCT REVIEW</h2>
<div class="sort-wrap">
<ul class="list_type1 old">
<li><span class="ico"></span><p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p></li>
 <li><span class="ico"></span><p class="txt">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a href="#none" onclick="window.parent.location.href = '/shop/mypage/mypage_qna.php'" class="emph">1:1 문의</a>에 남겨주세요.</p></li>
</ul>
<div class="sort" style="bottom:-9px">
<select onchange="this.form.sort.value=this.value;this.form.submit()">
<option value="1">최근등록순</option>
<option value="2">좋아요많은순</option>
<option value="3">조회많은순</option>
</select>
</div>
</div>
</div>
<table class="xans-board-listheader" width="100%" border="0" cellpadding="0" cellspacing="0">
<caption style="display:none">구매후기 제목</caption>
<colgroup>
<col style="width:70px;">
<col style="width:auto;">
<col style="width:51px;">
<col style="width:77px;">
<col style="width:100px;">
<col style="width:40px;">
<col style="width:80px;">
</colgroup>
<tbody><tr>
<th scope="col" class="input_txt">번호</th>
<th scope="col" class="input_txt">제목</th>
<th scope="col" class="input_txt">작성자</th>
<th scope="col" class="input_txt">작성일</th>
<th scope="col" class="input_txt">조회</th>
</tr>
</tbody></table>
<div class="tr_line on">
<table class="xans-board-listheaderd tbl_newtype1" width="100%" cellpadding="0" cellspacing="0" onclick="view_content(this,event,'notice')">
<caption style="display:none">구매후기 내용</caption>
<colgroup>
<col style="width:70px;">
<col style="width:auto;">
<col style="width:51px;">
<col style="width:77px;">
<col style="width:100px;">
<col style="width:40px;">
<col style="width:80px;">
</colgroup>
<tbody>
<tr>

<td align="center">공지</td>
<td class="btitle">
<div>금주의 Best 후기 안내</div>
</td>
<td class="user_grade grade_comm">
</td>
<td class="bwirter">
Marketkurly </td>
<td class="bregdate">2019-11-01</td>
<td>
<span class="breview" data-sno="6412655">275635</span>
</td>
</tr>
</tbody>
</table>
<div data-sno="6412655" class="review_view review_notice" style="display: none;">
<div class="inner_review">
<div class="name_purchase">
<strong class="name"></strong>
<p class="package"></p>
</div>

<div class="goods-review-grp-btn">
</div>
</div>
</div>
<div class="tr_line">
<table class="xans-board-listheaderd tbl_newtype1" width="100%" cellpadding="0" cellspacing="0" onclick="view_content(this,event,'notice')">
<caption style="display:none">구매후기 내용</caption>
<colgroup>
<col style="width:70px;">
<col style="width:auto;">
<col style="width:51px;">
<col style="width:77px;">
<col style="width:100px;">
<col style="width:40px;">
<col style="width:80px;">
</colgroup>
<tbody><tr>

<tbody>
<tr>

<td align="center">공지</td>
<td class="btitle">
<div>금주의 Best 후기 안내</div>
</td>
<td class="user_grade grade_comm">
</td>
<td class="bwirter">
Marketkurly </td>
<td class="bregdate">2019-11-01</td>
<td>
<span class="breview" data-sno="6412655">275635</span>
</td>
</tr>
</tbody>
</body>
<c:forEach var="bean" items="${requestScope.lists}">
<td align="center">${bean.bno}</td>
<td class="btitle">
<div>${bean.btitle}</div>
<td><details><summary>내용 자세히 보기</summary>
  					<p>${bean.bcontent}</p>
					</details></td>
</td>
<td class="user_grade grade_comm">
</td>
<td class="bwirter">
${bean.bwriter} </td>
<td class="bregdate">${bean.bregdate}</td>
<td>
<span class="breview">${bean.breview}</span>
</td>
</tr>
</tbody>
</c:forEach>
<br>
<div id="foot">
<a href="<%=contextPath%>/insert.prr">상품 후기 작성</a></div>
</body>
</html>