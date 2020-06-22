<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<title>로그인</title>
<body>
	<form id="loginForm" action="/user/loginUser" method="post">
		<table>
			<tbody>
				<tr>
					<td>
						<input type="text" name="userId" id="userId" placeholder="아이디 입력"><br>
						<small id="idCk"></small>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="userPw" id="userPw" placeholder="비밀번호 입력"><br>
						<small id="pwCk"></small>
					</td>
					<td>
						<button type="button" id="btn-login">로그인</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>

<script>
$j(document).ready(function(){
	
	$j('#btn-login').on('click',function(){
		console.log('btn-login btn click test.');

		if ($j('#userId').val() == ''){

			$j('#idCk').text('아이디를 입력해 주세요');
			$j('#userId').focus();

			return false;
		} else if ($j('#userPw').val() == ''){

			$j('#pwCk').text('비밀번호를 입력해 주세요');
			$j('#userPw').focus();

			return false;
		}
			$j('#loginForm').submit();
		
	});
});
</script>