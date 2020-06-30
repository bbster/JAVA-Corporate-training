<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<title>로그인</title>
<body>
	<form id="loginForm" name="loginForm" action="/users/userLoginCheck.do" method="post">
		<table align="center">
			<tr>
				<th colspan="2" align="center">
					로그인
				</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="userId" id="userId" placeholder="아이디 입력"><br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="userPw" id="userPw" placeholder="비밀번호 입력"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button style="float:left"  onclick="location.href='/board/boardList.do'" type="button">목록</button>
					<button style="float:left" type="button" id="loginBtn">로그인</button>
					<c:if test="${msg == 'faled'}">
						<div style="color: red">
							아이디 또는 비밀번호가 일치하지 않습니다.
						</div>
					</c:if>
					<c:if test="${msg == 'logout' }">
						<div style="color: red">
							로그아웃 되었습니다.
						</div>
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</body>

<script>
$j(document).ready(function(){
	$j('#loginBtn').on('click',function(){
		var userId = $j("#userId").val();
		var userPw = $j("#userPw").val();
		if(userId == ""){
			alert("아이디를 입력하세요");
			$j("#userId").focus();
			return;
		}
		else if(userPw == ""){
			alert("비밀번호를 입력하세요.");
			$j("#userPw").focus();
			return;
		}
		document.loginForm.action="${path}/users/userLoginCheck.do"
		document.loginForm.submit();
	});
});
</script>
</html>