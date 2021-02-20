<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Productreviews Insert | 상품 후기 등록 게시판</title>
<style>

.xans-product-additional div.board h2 {
    font-size: 13px;
    font-weight: 700;
    padding-bottom: 5px;
}
.xans-board-listheader{
	border-top:2px solid #522772;
	
}
body * {
    font-family: 'Noto Sans';
    letter-spacing: 0;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

h2 {
    display: block;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
tr{
display: table-row;
vertical-align:inherit;
border-color:inherit;
}
th{
display: table-cell;
text-align:-internal-center;
}
div, th, td, li, dt, dd, p {
    word-break: break-all;
}
body, input, select, textarea, button {
    line-height: 1;
    color: #4c4c4c;
    max-width: 100%;
}
.title_txt{
line-height: 1;
color: #4c4c4c;
font-size: 12px;
box-sizing: border-box;
margin: 0;
padding: 0;
word-break: break-all;
font-family: 'Noto Sans';
font-weight: 400;
letter-spacing: 0;
}


</style>
</head>
<body>
	
	<div class="title_txt">
		<h2>PRODUCT REVIEW</h2>
			<div class="sort-wrap">
				<ul class="list_type1 old">
					<li>
						<span class="ico"></span>
						<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p>					
					</li>
					<li>
						<span class="ico"></span>
						<p class="txt">
						"배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내" 
						<a href="">1:1문의</a>"에 남겨주세요" 
					</li>				
				</ul>
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
				<tbody>
					<tr>
						<th scope="col" class="input_txt">번호</th>
						<th scope="col" class="input_txt">제목</th>
						<th scope="col" class="input_txt">
							<span class="screen_out">회원 등급</span>
						</th>
						<th scope="col" class="input_txt" align="left">작성자</th>
						<th scope="col" class="input_txt">작성일</th>
						<th scope="col" class="input_txt">조회</th>
						</tr>
				</tbody>
			</table>
		<table>
		<tbody>
			<tr>
				<td align="center">공지</td>
				<td class="subject">
					<div>금주의 Best 후기 안내</div>
				</td>
				<td class="user_grade">
				Marketkurly</td>
				<td class="time">2019-11-01</td>
				<td>
					<span class="review-breview-cnt">274071</span>
				</td>
				</tr>
				<tr>
				<td align="center">공지</td>
				<td class="subject">
					<div>상품 후기 적립금 정책 안내</div>
				</td>
				<td class="user_grade grade_comm"></td>
				<td class="user_grade">
				Marketkurly</td>
				<td class="time">2019-11-01</td>
				<td>
					<span class="review-breview-cnt">150881</span>
				</td>
				</tr>
		</tbody>
		<p class="btnArea after">
			<a href=""><span class="bhs_button" style="line-height:30px; width:130px;">후기 쓰기</span>
			</a>
		</p>
		
		</table>

</body>
</html>