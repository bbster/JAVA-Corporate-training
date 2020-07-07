<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<title>
회원가입
</title>
<body>
	<form id="joinForm" name="joinForm">
		<table align="center">
			<tr>
				<td align="left">
					<a href="/board/boardList.do">List</a>
				</td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="100" align="center">
								id
							</td>
							<td width="280">
								<input type="text" id="userId" name="userId">
								<button type="button" id="userIdDupCheck" name="userIdDupCheck">중복확인</button><br>
								<small id="userIdCheck"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								password
							</td>
							<td>
								<input type="password" id="userPw" name="userPw"><br>
								<small id="userPwCheckSub"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								password check
							</td>
							<td>
								<input type="password" id="userPwCheck" name="userPwCheck"><br>
								<small id="userPwCheckSub2"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								name
							</td>
							<td>
								<input type="text" id="userName" name="userName"><br>
								<small id="userNameSub"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								phone
							</td>
							<td>
								<select id="phone" id="userPhone1" name="userPhone1">
									<c:forEach var="code" items="${codeName}">
										<option value="${code.codeId}">${code.codeName}</option>
									</c:forEach>
								</select>
								<!-- input option중 pattern이라는 정규식을 넣을수 있는 기능  -->
								<input type="tel" id="userPhone2" name="userPhone2" size="2" pattern="[0-9]{4}">
								<input type="tel" id="userPhone3" name="userPhone3" size="2" pattern="[0-9]{4}"><br>
								<small id="userPhoneSub"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								postNo
							</td>
							<td>
								<input type="tel" id="userAddr1" name="userAddr1" pattern="[0-9]{3}-[0-9]{3}"><br>
								<small id="userAddr1Sub"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								address
							</td>
							<td>
								<input type="text" id="userAddr2" name="userAddr2">
							</td>
						</tr>
						<tr>
							<td align="center">
								company
							</td>
							<td>
								<input type="text" id="userCompany" name="userCompany">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<button type="button" id="joinBtn">가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
// validation 정규식
var idCheck = /[a-zA-Z]+[a-zA-Z0-9_-]{5,20}$/g;
var pwCheck = /^[a-zA-Z]+[a-zA-Z0-9_-]{6,12}$/g;	
var phoneCheck = /^[0-9]{1,4}$/;
var korCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/; 
var postCheck = /^\d{3}-\d{3}$/;

$j(document).ready(function(){
	$j('#joinBtn').attr('disabled','disabled');
	
	/* 회원가입시 입력값 validation */
	/* userId는 한글을 제외한 영문자, 숫자로 이루어짐 */
	$j("#userId").keyup(function(){
		if(korCheck.test($j('#userId').val())){
			$j('#idSub').attr('style','color:#B70000');
			$j('#userIdCheck').text('5~20자리의 영문과 숫자로만 조합해서 입력해주세요.');
			this.value='';
			return false;
		}
		else{
			$j('#userIdCheck').empty();
		}
		
 		if($j('#userId').val().toString().length < 5){
 			$j('#userIdCheck').attr('style','color:#B70000');
			$j('#userIdCheck').text('5~20자리의 영문과 숫자로만 조합해서 입력해주세요.');
			return false;
		}
 		else if($j('#userId').val().toString().length > 20){
			$j('#userIdCheck').attr('style','color:#B70000');
			$j('#userIdCheck').text('5~20자리의 영문과 숫자로만 조합해서 입력해주세요.');
			return false;
		} 
		else {
			$j('#userId').empty();
		}
	});
	
	$j("#userPw").keyup(function(){
		if($j("#userPw").val() != ''){ // null이 아닐때
			if(!pwCheck.test($j('#userPw').val())){
				$j('#userPwCheckSub').attr('style','color:#B70000');
				$j('#userPwCheckSub').text('6~12자리 영문과 숫자로만 조합해서 입력해주세요.');
				return false;
			}else{
				$j('#userPwCheckSub').empty();
			}
		
// 		if($j('#userPw').val().toString().length < 6){
// 	 			$j('#userPwCheckSub').attr('style','color:#B70000');
// 				$j('#userPwCheckSub').text('6~12자리 영문과 숫자로만 조합해서 입력해주세요.');
// 				return false;
// 			}
// 	 		else if($j('#userPw').val().toString().length > 12){
// 				$j('#userPwCheckSub').attr('style','color:#B70000');
// 				$j('#userPwCheckSub').text('6~12자리 영문과 숫자로만 조합해서 입력해주세요.');
// 				this.value='';
// 				return false;
// 			} 
// 			else {
// 				$j('#userPwCheckSub').empty();
// 			}
		}
	});
	
	$j("#userPwCheck").keyup(function(){
		if($j('#userPwCheck').val() != ''){
			if($j('#userPwCheck').val() == $j('#userPw').val()){
				$j('#userPwCheckSub2').attr('style','color:#008000');
				$j('#userPwCheckSub2').text("비밀번호가 일치합니다!");
				return false;
			}else{
				$j('#userPwCheckSub2').attr('style','color:#B70000');
				$j('#userPwCheckSub2').text("비밀번호가 일치하지 않습니다.");
			}
		}
	});
	
	
	$j("#userName").keyup(function(){
		if($j('#userName').val() != ''){
			if(!korCheck.test($j('#userName').val())){
				$j('#userNameSub').attr('style','color:#B70000');
				$j('#userNameSub').text('한글만 입력 해주세요.');
				this.value='';
				return false;
			}else{
				$j('#userNameSub').empty();
			}
			
			if($j('#userName').val().toString().length < 3){
				$j('#userNameSub').attr('style','color:#B70000');
				$j('#userNameSub').text(' 최소 3글자 이상 최대 5글자 이하');
				return false;
			}else if($j('#userName').val().toString().length > 8){
				$j('#userNameSub').attr('style','color:#B70000');
				$j('#userNameSub').text(' 최소 3글자 이상 최대 5글자 이하');
				return false;
			}else{
				$j('#userNameSub').empty();
			}
		}
	});
	
	$j("#userPhone2").keyup(function(){
		if($j('#userPhone2').val() != ''){
			if(!phoneCheck.test($j('#userPhone2').val())){
				$j('#userPhoneSub').attr('style','color:#B70000');
				$j('#userPhoneSub').text('xxxx-xxxx 형태의 숫자만 입력해주세요.');
				this.value='';
				return false;
			}else{
				$j("#userPhoneSub").empty();
			}
		}
	});

	$j("#userPhone3").keyup(function(){
		
		if($j('#userPhone3').val() != ''){
			if(!phoneCheck.test($j('#userPhone3').val())){
				$j('#userPhoneSub').attr('style','color:#B70000');
				$j('#userPhoneSub').text('xxxx-xxxx 형태의 숫자만 입력해주세요.');
				this.value='';
				return false;
			}else{
				$j("#userPhoneSub").empty();
			}
		}
	});
	
	$j("#userAddr1").keypress(function(){
		var insertHyphen = /^[0-9]{3}$/;
		if(insertHyphen.test($j('#userAddr1').val())){
			this.value=$j("#userAddr1").val()+'-';
		}
	});
	
	$j("#userAddr1").blur(function(){
		if($j('#userAddr1').val() != ''){
			console.log($j('#userAddr1').val());
			if(!postCheck.test($j('#userAddr1').val())){
				$j('#userAddr1Sub').attr('style','color:#B70000');
				$j('#userAddr1Sub').text('xxx-xxx 형태의 숫자만 입력해주세요.');
				this.value='';
				return false;
			}
			else{
				$j("#userAddr1Sub").empty();
			}
		}
	});
	
	/* 아이디 중복체크 버튼 */
	$j('#userIdDupCheck').click(function(){
		var idDupCheck = $j('#userId').val();
		
		console.log(idDupCheck);
		
		if(idDupCheck.length > 4 && idDupCheck.length < 21){
			$j.ajax({
				url : "/users/userIdDupCheck.do"
				,type : 'POST'
				,data : {'userId' : idDupCheck}
				,success : function(data){
					if(data == 1){
						alert("사용 불가능한 아이디 입니다.");
						$j('#joinBtn').attr('disabled','disabled');						
					}else{
						alert("사용 가능한 아이디 입니다.");
						$j('#joinBtn').removeAttr('disabled');
					}
				}
			});
		}else{
			alert("아이디 형식이 맞지 않습니다.");
		}
	});
	
	/* 가입 버튼 눌렀을때 */
	$j('#joinBtn').click(function(){
		/* document.joinForm.action="${path}/users/userJoinAction.do";
		document.joinForm.submit(); */
		var $formData = $j('#joinForm');
		var dataParams = $formData.serialize();
		
		console.log(dataParams);
		
		if($j('#userId').val().toString().length > 4 && $j('#userId').val().toString().length < 21
				&& $j('#userPw').val().toString().length > 4 && $j('#userPw').val().toString().length < 21){
			if($j('#userPwCheck').val().toString().length > 5 && $j('#userPwCheck').val().toString().length < 13
					&& $j('#userPwCheck').val() == $j('#userPw').val()){
				if($j('#userName').val().toString().length > 2 && $j('#userName').val().toString().length < 6){
					if($j('#userPhone2').val().toString().length == 4 && $j('#userPhone3').val().toString().length == 4){
						if($j('#userAddr1').val().toString().length == 7){
							$j.ajax({
								url : "/users/userJoinAction.do"
								, dataType : 'json'
								, type : 'POST'
								, data : dataParams
								,success : function(data, textStatus, jqXHR)
								{
									alert("회원가입 성공");
									location.href = "/users/userLogin.do";
								}
								/* ajax error 처리를 위한 기본적인 3개의 파라미터 */
								, error : function(jqXHR, textStatus, errorThrown)
								{
									alert("실패");
									/* location.href = "/users/userJoin.do"; */
								}
							});
						}else{
							alert("우편번호 형식이 맞지 않습니다.");
						}
					}else{
						alert("Phone 입력값이 잘못되었습니다. xxxx - xxxx 형태로 입력해주세요.")
					}
				}else{
					alert("유저네임 형식이 맞지않습니다.")
				}
			}else{
				alert("패스워드 형식이 맞지 않습니다.")
			}
		}else{
			alert("아이디 패스워드 형식이 맞지 않습니다.");
		}
	});
});
</script>
</html>