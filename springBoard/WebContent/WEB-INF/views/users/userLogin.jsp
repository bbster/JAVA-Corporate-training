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
	<form id="loginForm" name="loginForm" action="/users/userLoginCheck.do" method="post">
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
				<td colspan="2">
					<button style="float:left"  onclick="location.href='/board/boardList.do'" type="button">���</button>
					<button style="float:left" type="button" id="loginBtn">�α���</button>
					<c:if test="${msg == 'faled'}">
						<div style="color: red">
							���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.
						</div>
					</c:if>
					<c:if test="${msg == 'logout' }">
						<div style="color: red">
							�α׾ƿ� �Ǿ����ϴ�.
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
			alert("���̵� �Է��ϼ���");
			$j("#userId").focus();
			return;
		}
		else if(userPw == ""){
			alert("��й�ȣ�� �Է��ϼ���.");
			$j("#userPw").focus();
			return;
		}
		document.loginForm.action="${path}/users/userLoginCheck.do"
		document.loginForm.submit();
	});
});
</script>
</html>