<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../member/mypagenav.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<style type="text/css">
		.con{
    		width: 1000px;
    		height: 800px;
    	}
    	.app{
    		padding: 10px;
    	}
    	.dashboard{
    		padding-left: 50px;
    		height: 1000px;
    	}
    	.dashboard-content {
		    padding-left: 200px;
		    padding-top: 100px;
		    height: 700px;
		}
		table{
			width: 1000px;
		}
	</style>	
</head>
<body>
	<div class="container">
		<div id="body">
 <div class="tab-content dashboard-content">
		<div id="dashboard" class="tab-pane fade show active">
			<table>
				<tr>
					<td>
						<!-- 내용 들어갈 공간 -->
						<div class="col-sm col-sm-10">
							<form method="get" action="<%=contextPath%>/order.ad">
								<input type="hidden" name="order" value="order">
								<div class="panel panel-success">
									<div class="panel-heading">
										<h3 class="panel-title" style="font-weight: bold;">
											${sessionScope.loginfo.name} 님  <span style="color: black">주문 목록</span> 페이지입니다.</h3>
										<h6 style="color: black">배송지에 따라 상품 정보가 달라질 수 있습니다.</h6>
									</div>
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-condensed">
												<thead>
													<tr style="font-weight: bolder;">
														<td class="text-center">주문 번호</td>
														<td class="text-center">고객 아이디</td>
														<td class="text-center">주문 날짜</td>
														<td class="text-center">송장 번호</td>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${requestScope.lists}" var="orderlist">
														<tr class="record">
															<td align="center">${orderlist.oid}</td>
															<td align="center">${orderlist.mid}</td>
															<td align="center">${orderlist.orderdate}</td>
															<td align="center">${orderlist.invoice}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</form>
						</div> <!-- 내용끝나는 곳 -->
					</td>
				</tr>
			</table>
		</div>
		<div id="orders" class="tab-pane fade"></div>
	</div>
		</div>
	</div>
</body>
<%@ include file="./../common/footer.jsp" %> 
</html>