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
	<form id="userInsert">
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
								<button type="button" id="btnConfirm">중복확인</button>
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
					<button type="button" id="join">가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
// validation 정규식

var numCheck = /^[0-9]{4}$/;
var nameCheck = /[a-zA-Z가-힝]/; 

$j(document).ready(function(){
	$j("#userId").blur(function(){
		var userId = $j("#userId").val();
		if(!idCheck.test($j("#userId").val())){
			alert("잘못된 아이디 형태입니다. 5~10자의 영문자, 숫자");
		}
		else{
			type : 'POST'
			,data : {'userId':userId}
			,url : '/idCheck'
			,success : function(data){
				if(data) {
					alert("사용할수 있는 아이디입니다.");
				}
				else{
					alert("사용할수 없는 아이디입니다.");
					return false;
				}
			}
		}
	}
)};
	
	$j.ajax({
		url : "/user/joinAction"
		, dataType : "json"
		, type : "POST"
		, data : param
		, success : function(data)
		{
			alert("회원가입 완료");
			location.href = "/board/boardList.do";
		}
	});
});


</script>
</html>