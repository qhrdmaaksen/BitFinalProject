<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	                document.getElementById('fakezipcode').value = data.zonecode;
	                document.getElementById('zipcode').value = data.zonecode;
	                document.getElementById("address1").value = roadAddr;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	
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
	<script type="text/javascript">
		function checkDuplicateId(){//아이디 중복 체크 함수
			var mid = document.myform.mid.value ;
			if (mid.length < 4){
				alert('아이디는 최소 4 자리 이상이어야합니다.')
				document.myform.mid.focus() ;
				return false ;
			}
			var url = '<%=contextPath%>/idCheck.me?mid=' + mid ;
			window.open(url , 'mywin' , 'height=150,width=300') ;
		}
		function checkForm() { // 회원 가입 버튼 클릭 함수
			var isCheck = document.myform.isCheck.value ; 
			if (isCheck == 'false'){
				alert('아이디 중복 체크를 눌러주세요.')
				return false ; 
			} else if (isCheck == 'true'){
				alert('회원 가입 성공하였습니다 !!')
				return true ;
			}
		}
		document.getElementById('changeGender').onclick = changeColor;   
	    function changeColor() {
	        document.body.style.color = "purple";
	        return false;
	    }   
	</script>
	<style type="text/css">
		#mainbody {
			margin-left: 500;
		}
		#inreset {
			margin-left: 350;
		}
	</style>
</head>
<body>
<div id="mainbody" class="container col-offset col-sm-6">
	<h2>회원 가입</h2>
		<h6 align="right"><label class="redPrefix">*&nbsp;&nbsp;</label>필수 입력 사항</h6>
	<div class="panel panel-primary sub_container">
		<div class="panel panel-body">
			<form:form modelAttribute="member" action="${contextPath}/insert.me" method="post"
					   class="form-horizontal" role="form" name="myform">
			
			<%-- jsp 주석 : isCheck가 false이면 가입이 불가능 합니다. --%>
			<input type="hidden" name="isCheck" value="false">
			
			<!-- html 주석 : 마일리지 포인트는 숨겨져 넘깁니다. (*참고 : 소스보기 시 이 주석은 보인다.)-->
			<input type="hidden" name="mpoint" value="5">
			
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="mid" class="col-sm-2">
					아이디
				 	<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-7">
					<form:input path="mid" type="text" id="mid" name="mid"
						class="form-control" value="${mid}" />
					<form:errors cssClass="err" path="mid" />
				</div>
				<div class="col-sm-2" align="left">
					<input type="button" class="w3-btn w3-white w3-border w3-border-purple w3-round-large" style="font-weight: bold;" value="ID 중복체크"
					 onclick="return checkDuplicateId()">
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="name" class="col-sm-2">
					이름
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9">
					<form:input path="name" type="text" id="name" name="name" 
						class="form-control" value="${name}" />
					<form:errors cssClass="err" path="name" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="password" class="col-sm-2">
					비밀번호
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9">
					<form:input path="password" type="password" id="password" name="password" 
						class="form-control" value="${password}" />
					<form:errors cssClass="err" path="password" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="email" class="col-sm-2">
					이메일
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9">
					<form:input path="email" type="text" id="email" name="email"
						class="form-control" value="${email}" />
					<form:errors cssClass="err" path="email" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="phone" class="col-sm-2">
					휴대폰
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9">
					<form:input path="phone" type="text" id="phone" name="phone" 
						class="form-control" value="${phone}" />
					<form:errors cssClass="err" path="phone" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="gender" class="col-sm-2">
					성별
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9" align="left">
					<label class="radio-inline">
						<form:radiobuttons path="gender" id="changeGender" items="${radiolist}" 
							itemLabel="mykey" itemValue="mykey" style="margin-left:70px;" onclick="changeColor()"/>
						<form:errors cssClass="err" path="gender" />
					</label>
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="birth" class="col-sm-2">
					생일
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9">
					<form:input path="birth" type="text" id="birth" name="birth" 
						class="form-control" value="${birth}" />
					<form:errors cssClass="err" path="birth" />
				</div>
			</div>
				<!-- ----------------------------------우편번호 api---------------------------------------------- -->
			<span id="guide" style="color:#999;display:none"></span>
			<div class="form-group">
				<label for="zipcode" class="col-sm-2">
					우편번호
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-7" style="margin-top: 5px;">
					<input type="text" id="fakezipcode" name="fakezipcode" 
						class="form-control" value="우편번호 찾기를 눌러주세요." disabled="disabled"/>
						<input type="hidden" name="zipcode" id="zipcode" value="">
					<div class="col-sm-6" style="margin-bottom: 1px; margin-left: 470;">
						<input type="button" class="w3-btn w3-white w3-border w3-border-purple w3-round-large" value="우편 번호 찾기"
								style="font-weight: bold;" onclick="sample4_execDaumPostcode();">
					</div>
					<div class="form-group" class="col-sm-8" style="margin-top: 5px; margin-left: 20;">
						<label for="address1"></label>
						<input type="text" name="address1" id="address1"
								class="form-control" placeholder="도로명주소" value="">
					</div>
					<div class="form-group" class="col-sm-8" style="margin-top: 5px; margin-left: 20;">
						<label for="address2"></label>
						<input type="text" name="address2" id="address2"
								class="form-control" placeholder="상세주소" value="">
					</div>
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<%-- <div class="form-group">
				<label for="zipcode" class="col-sm-3">
					우편번호
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-7">
					<input type="text" id="fakezipcode" name="fakezipcode" 
						class="form-control" value="우편번호 찾기를 눌러주세요." disabled="disabled"/>
					<form:input path="zipcode" type="hidden" name="zipcode" id="zipcode" 
						class="form-control" value="${zipcode}" />
					<form:errors cssClass="err" path="zipcode" />
				</div>
				<div class="col-sm-2" align="left">
					<input type="button" class="w3-btn w3-white w3-border w3-border-purple w3-round-large" style="font-weight: bold;" value="주소 검색" 
						onclick="javascript:findZipcode();" >
				</div>
			</div> --%>
			<!-- -------------------------------------------------------------------------------- -->
			<%-- <div class="form-group">
				<label for="address1" class="col-sm-3">
					주소
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9">
					<input type="text" name="fakeaddress1" id="fakeaddress1" 
								class="form-control" disabled="disabled" placeholder="주소"
								value=" "> 
						<input type="hidden" id="address1" name="address1" value="${address1}">
					<form:errors cssClass="err" path="address1" />
				</div>
			</div> --%>
			<!-- -------------------------------------------------------------------------------- -->
			<%-- <div class="form-group">
				<label for="address2" class="col-sm-3">
					상세 주소
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9">
					<form:input path="address2" type="text" id="address2" name="address2" 
						class="form-control" value="${address2}" />
					<form:errors cssClass="err" path="address2" />
				</div>
			</div> --%>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="createdate" class="col-sm-2">
					가입 일자
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9">
					<form:input path="createdate" type="text" id="createdate" name="createdate" 
						class="form-control" value="${createdate}" />
					<form:errors cssClass="err" path="createdate" />
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<div class="col-sm-4" id="inreset">
				
					<button type="submit" class="w3-button w3-purple w3-border w3-border-purple w3-round-large"
					onclick="return checkForm()">
						<p align="right" style="color: white; font-weight: bolder;">가입 하기</p>
					</button>
					 
					<button type="reset" class="w3-button w3-red" style="margin:20px; font-weight: bold;">
						<p>초기화</p>
					</button>
				</div>
			</div>
			
			</form:form>
		</div>
	</div>
</div>
</body>
</html>