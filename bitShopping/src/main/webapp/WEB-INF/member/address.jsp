<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../member/mypage.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<html>
<head>
    <title>Title</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                    document.getElementById('zipcode').value = data.zonecode;
                    document.getElementById("address1").value = roadAddr;

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
    </script>
</head>
<body>
	<div class="contater" align="center" style="width: 1300; position: relative; bottom: 420; left: 400;">
	<div class="col-sm-offset-2 col-sm-8">
	    <form  method="get" action="<%=contextPath%>/address.ad">
	    	<input type="hidden" name="address" value="address">
	        <div class="panel panel-success">
	            <div class="panel-heading">
	                <h3 class="panel-title" style="font-weight: bold;">
	                    ${sessionScope.loginfo.name} 님 배송지 관리 페이지입니다.
	                </h3>
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
		                            <td id="sample4_detailAddress" align="center">${lists.address2}</td>
		                        </tr>
	                        </tbody>
	                    </table>
	                    <span id="guide" style="color:#999;display:none"></span>
	                    <div align="center">
		                    <input class="w3-btn w3-white w3-border w3-border-purple w3-round-large"
		                                type="button" id="shippingchange" onclick="sample4_execDaumPostcode()" value="배송지 변경"/>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </form>
    </div>
    <table>
    	<tr>
    		<td style="position: relative; top: 400; right: 50;">
    			<%@ include file="./../common/footer.jsp" %>
    		</td>
    	</tr>
    </table>
</div>
</body>
</html>
