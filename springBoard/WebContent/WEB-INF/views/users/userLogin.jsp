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
	<form id="loginForm" action="/users/userLoginAction" method="post">
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
	
	$j("#loginBtn").on("click",function(){
		var $formData = $j("form[id=loginForm]");
		var param = $formData.serialize();
	
		$j.ajax({
		    url : "/users/userLoginAction",
	    	dataType: "json",
	    	type: "POST",
	    	data : param,
	    	success: function(data)
	    	{
				alert("�α��� ����");
				location.href = "/board/boardList.do?pageNo=";
	    	}
		});
	});
});
</script>
</html>