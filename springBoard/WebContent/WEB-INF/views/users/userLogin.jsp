<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<title>�α���</title>
<body>
	<form id="loginForm" action="/user/loginUser" method="post">
		<table>
			<tbody>
				<tr>
					<td>
						<input type="text" name="userId" id="userId" placeholder="���̵� �Է�"><br>
						<small id="idCk"></small>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="userPw" id="userPw" placeholder="��й�ȣ �Է�"><br>
						<small id="pwCk"></small>
					</td>
					<td>
						<button type="button" id="btn-login">�α���</button>
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

			$j('#idCk').text('���̵� �Է��� �ּ���');
			$j('#userId').focus();

			return false;
		} else if ($j('#userPw').val() == ''){

			$j('#pwCk').text('��й�ȣ�� �Է��� �ּ���');
			$j('#userPw').focus();

			return false;
		}
			$j('#loginForm').submit();
		
	});
});
</script>