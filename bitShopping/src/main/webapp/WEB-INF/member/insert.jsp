<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

		function findZipcode() { /*우편 번호 찾기 버튼 클릭*/
			
			var url = '<%=contextPath%>/zipcheck.me';
			window.open(url, 'mywin', 'height=600, width=720, statusbar=yes, scrollbars=yes, resizable=no');
														  		// 상태 포커스 , 스크롤 바 , 리사이즈 안되게
			//alert('우편 번호 찾기') ;
		}
		function checkForm() { // 회원 가입 버튼 클릭 함수
			var isCheck = document.myform.isCheck.value ; 
			if (isCheck == 'false'){
				alert('아이디 중복 체크를 눌러주세요.')
				return false ; 
			}
		}
		
	</script>
	<style type="text/css">
	</style>
</head>
<body>


<div align="center" class="container col-sm-offset-2 col-sm-8">
	<h2>회원 가입</h2>
		<h6 align="right"><label class="redPrefix">*&nbsp;&nbsp;</label>필수 입력 사항</h6>
	<hr>
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
				<label for="mid" class="col-sm-3">
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
				<label for="name" class="col-sm-3">
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
				<label for="password" class="col-sm-3">
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
				<label for="email" class="col-sm-3">
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
				<label for="phone" class="col-sm-3">
					전화 번호
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
				<label for="gender" class="col-sm-3">
					성별
					<span  class="redPrefix">
				 		*
				 	</span>
				</label>
				<div class="col-sm-9" align="left">
					<label class="radio-inline">
						<form:radiobuttons path="gender" items="${radiolist}" 
							itemLabel="mykey" itemValue="mykey" style="margin-left:70px;"/>
						<form:errors cssClass="err" path="gender" />
					</label>
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="birth" class="col-sm-3">
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
			
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
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
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
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
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
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
			</div>
			<!-- -------------------------------------------------------------------------------- -->
			<div class="form-group">
				<label for="createdate" class="col-sm-3">
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
				<div class="col-sm-12">
				
					<button type="submit" class="w3-button w3-purple w3-border w3-border-purple w3-round-large"
					onclick="return checkForm()">
						<p align="center" style="color: white; font-weight: bolder;">가입 하기</p>
					</button>
					 
					<button type="reset" class="btn btn-default" style="margin:20px;"> 
						<p align="right">초기화</p>
					</button>
				</div>
			</div>
			
			</form:form>
		</div>
	</div>
</div>
</body>
</html>