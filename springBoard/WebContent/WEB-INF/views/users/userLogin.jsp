<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<title>�α���</title>
<body>
	<form id="loginForm" action="/user/userLogin.do" method="post">
		<table align="center">
			<tr>
				<th colspan="2" align="center">
					�α���
				</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="userId" id="userId" placeholder="���̵� �Է�"><br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="userPw" id="userPw" placeholder="��й�ȣ �Է�"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button type="button" id="loginBtn">�α���</button>
				</td>
			</tr>
		</table>
	</form>
</body>

<script>
$j(document).ready(function(){
	
	$j('#loginBtn').on('click',function(){
		if ($j('#userId').val() == ''){

			alert("���̵� �Է����ּ���")

			return false;
		} else if ($j('#userPw').val() == ''){

			alert("��й�ȣ�� �Է����ּ���")

			return false;
		}
			$j('#loginForm').submit();
		
	});
});
</script>
</html>