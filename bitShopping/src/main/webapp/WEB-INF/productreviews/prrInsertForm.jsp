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
<title>Productreviews Insert | 상품 후기 등록 게시판</title>
</head>
<body>
	<div>
		<div class="row">
			<div class="col-md-offset-3 col-md-offset-3 review-insert">
				
			
			</div>
		</div>
	</div>
	
			<table class="review-write-table">
				<tbody>
					<tr>
						<td width="20%"> 작성자 : </td>
						<td><input type="text" name="bwriter" size="20" value="${sessionScope.loginfo.id}" readonly></td>
				</tbody>
			</table>

</body>
</html>