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
	<form id="loginForm" action="/users/userLoginAction" method="post">
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
				</td>
			</tr>
		</table>
	</form>
</body>

<script>
$j(document).ready(function(){
	$j('#loginBtn').on('click',function(){
		if ($j('#userId').val() == ''){
			alert("아이디를 입력해주세요")
			return false;
		} else if ($j('#userPw').val() == ''){
			alert("비밀번호를 입력해주세요")
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
				alert("로그인 성공");
				location.href = "/board/boardList.do?pageNo=";
	    	}
		});
	});
});
</script>
</html>