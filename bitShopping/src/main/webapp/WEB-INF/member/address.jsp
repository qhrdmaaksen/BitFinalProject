<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../member/mypagenav.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    } 
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zipcode').textContent = data.zonecode;
                    document.getElementById("address1").textContent = roadAddr;
                    document.getElementById("address2").textContent = "상세주소변경 여기를 클릭해주세요";//api 값적용시 상세주소란 내용변경

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
        function address2click() {//상세주소란 클릭시 modal open
			/* alert('아래 상세주소 변경클릭.'); */
			//$('#myModal').modal("show");
			$("#modalBtn").click();
		}
        $(document).ready(function(){//모달활용 input text내용 td에 값넣기
        	$('#addrChange').on("click" , function(){
        		var text = $("#inputValue input").eq(0).val();
        		$("#address2").text(text);
    			$('#myModal').modal('hide');
    			
    			alert('데이터 전송!');
           		$.ajax({
           			url : '/mytest/updateAddr.ad',
           			type : 'post',
           			data : {
           				zipcode : $('#zipcode').text(),
           				address1 : $('#address1').text(),
           				address2 : $('#address2').text()
           			},
           			success : function(res){
           				console.log(res);
           				if(res > 0 ) {
           					alert("데이터 변경 성공!");
           				}else {
           					alert("데이터 변경 실패 !");
           				}
           			},
           			error : function(){
           				alert('실패!');
           			}
           		});

        	});
        });

    </script>
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
	<div class="tab-content dashboard-content">
		<div id="dashboard" class="tab-pane fade show active">
			<table>
				<tr>
					<td>
						<!-- 내용 들어갈 공간 -->
						<div class="col-sm col-sm-10">
							<form method="get" action="<%=contextPath%>/address.ad">
								<input type="hidden" name="address" value="address">
								<div class="panel panel-success">
									<div class="panel-heading">
										<h3 class="panel-title" style="font-weight: bold;">
											${sessionScope.loginfo.name} 님 <span style="color: black">배송지 관리</span></span> 페이지입니다.</h3>
										<h6 style="color: black">배송지에 따라 상품 정보가 달라질 수 있습니다.</h6>
									</div>
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-condensed">
												<thead>
													<tr style="font-weight: bolder;">
														<td class="text-center">수령인</td>
														<td class="text-center">전화번호</td>
														<td class="text-center">우편번호</td>
														<td class="text-center">배송주소</td>
														<td class="text-center">배송 상세주소</td>
													</tr>
												</thead>
												<tbody>
													<tr class="record">
														<td align="center">${lists.name}</td>
														<td align="center">${lists.phone}</td>
														<td id="zipcode" align="center">${lists.zipcode}</td>
														<td id="address1" align="center">${lists.address1}</td>
														<td id="address2" align="center" onclick="address2click()">${lists.address2}</td>
													</tr>
												</tbody>
											</table>
											<!-- Trigger the modal with a button -->
											<div align="right" style="display: none">
												<button id="modalBtn" type="button" class="btn btn-info btn-lg" style="margin-bottom: 20; margin-top: 10; font-size: 10;"
													data-toggle="modal" data-target="#myModal">
														<span style="margin-bottom: 20;">상세 주소 변경</span>
												</button>
											</div>
											
											<!-- Modal -->
											<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
											  <div class="modal-dialog modal-dialog-centered" role="document">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											          <span aria-hidden="true">&times;</span>
											        </button>
											      </div>
											      <div class="modal-body" id="inputValue">
											      	<input type="text" value="" placeholder="여기에 상세주소를 입력해주세요.">
											      </div>
											      <div class="modal-footer">
											        <button id="addrChange" type="button" class="btn btn-primary" data-dismiss="modal">변경하기</button>
											      </div>
											    </div>
											  </div>
											</div>
											<div>
											</div>
											<span id="guide" style="color: #999; display: none"></span>
											<div align="center">
												<input
													class="w3-btn w3-white w3-border w3-border-purple w3-round-large"
													type="button" id="shippingchange"
													onclick="sample4_execDaumPostcode()" value="배송지 변경" />
											</div>
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
</body>
<%@ include file="./../common/footer.jsp" %> 
</html>
