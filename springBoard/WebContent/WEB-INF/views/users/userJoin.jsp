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
								<button type="button" id="btnConfirm">중복확인</button><br>
								<small id="userIdCheck"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								password
							</td>
							<td>
								<input type="password" id="userPw" name="userPw">
							</td>
						</tr>
						<tr>
							<td align="center">
								password check
							</td>
							<td>
								<input type="password" id="userPwCheck" name="userPwCheck">
							</td>
						</tr>
						<tr>
							<td align="center">
								name
							</td>
							<td>
								<input type="text" id="userName" name="userName">
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
								-
								<!-- input option중 pattern이라는 정규식을 넣을수 있는 기능  -->
								<input type="tel" id="userPhone2" name="userPhone2" size="2" pattern="[0-9]{4}" required>
								-
								<input type="tel" id="userPhone3" name="userPhone3" size="2" pattern="[0-9]{4}" required><br>
							</td>
						</tr>
						<tr>
							<td align="center">
								postNo
							</td>
							<td>
								<input type="tel" id="userAddr1" name="userAddr1" pattern="[0-9]{3}-[0-9]{3}">
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
var idCheck = /^[a-z_-]+[a-z0-9_-]{6,12}$/g;
var pwCheck = /^(?=.*[a-zA-Z]{1,11})(?=.*[0-9]{1,11}).{6,12}$/;
var phoneCheck = /^[0-9]{1,4}$/;
var nameCheck = /[a-zA-Zㄱ-ㅎ가-힝]/; 
var postCheck = /^[0-9]{3}-[0-9]{3}$/;

$j(document).ready(function(){
	$j("#userId").keyup(function(){
		if(!idCheck.test($j('#userId').val())){
			$j('#userIdCheck').text('6~12자리의 영문만 입력해주세요.')
			/* this.value=''; */
			return false;
		}
		else{
			$j('#userIdCheck').empty();
		}
	});
	
	$j("#userPw").keyup(function(){		
		if($j("#userPw").val() != ''){
			if(!pwCheck.test($j('#userPw').val())){
				alert("6~12자 영문 대/소문자, 숫자, 특수문자를 사용하세요");
				return false;
			}
		}
	});
	
	$j("#userPwCheck").keyup(function(){
		if($j("#userPwCheck").val() != $j("#userPwCheck").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	});
	
	$j("#userName").keyup(function(){
		if($j('#userName').val() != ''){
			if(!nameCheck.test($j('#userName').val())){
				alert("한글/영문만 입력 가능합니다.");
				return false;
			}
		}
	});
	
	$j("#userPhone2").keyup(function(){
		if($j('#userPhone2').val() != ''){
			if(!phoneCheck.test($j('#userPhone2').val())){
				alert("4자리 숫자로 입력해주세요.")
				return false;
			}
		}
	});
	
	$j("#userPhone3").keyup(function(){
		if($j('#userPhone3').val() != ''){
			if(!phoneCheck.test($j('#userPhone3').val())){
				alert("4자리 숫자로 입력해주세요.")
				return false;
			}
		}
	});
	
	$j("#userAddr1").keyup(function(){
		if($j('#userAddr1').val() != ''){
			if(!postCheck.test($j('#userAddr1').val())){
				alert("xxx-xxx 형식으로 입력해주세요.");
				return false;
			}
		}
	});
	
	$j('#joinBtn').click(function(){
		/* document.joinForm.action="${path}/users/userJoinAction.do";
		document.joinForm.submit(); */
		
		var $formData = $j('#joinForm');
		var dataParams = $formData.serialize();
		
		console.log(dataParams);

		$j.ajax({
			url : "/users/userJoinAction.do"
			, dataType : 'json'
			, type : 'POST'
			,data : dataParams
			,success : function(data, textStatus, jqXHR)
			{
				alert("회원가입 성공");
				location.href = "/users/userLogin.do";
			}
			/* ajax error 처리를 위한 기본적인 3개의 파라미터 */
			, error : function(jqXHR, textStatus, errorThrown)
			{
				alert("실패 다시 시도해주세요");
				/* location.href = "/users/userJoin.do"; */
			}
		});
	});
});
</script>
</html>