<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<title>
ȸ������
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
								<button type="button" id="btnConfirm">�ߺ�Ȯ��</button><br>
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
								<!-- input option�� pattern�̶�� ���Խ��� ������ �ִ� ���  -->
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
					<button type="button" id="joinBtn">����</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
// validation ���Խ�
var idCheck = /^[a-z_-]+[a-z0-9_-]{6,12}$/g;
var pwCheck = /^(?=.*[a-zA-Z]{1,11})(?=.*[0-9]{1,11}).{6,12}$/;
var phoneCheck = /^[0-9]{1,4}$/;
var nameCheck = /[a-zA-Z��-����-��]/; 
var postCheck = /^[0-9]{3}-[0-9]{3}$/;

$j(document).ready(function(){
	$j("#userId").keyup(function(){
		if(!idCheck.test($j('#userId').val())){
			$j('#userIdCheck').text('6~12�ڸ��� ������ �Է����ּ���.')
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
				alert("6~12�� ���� ��/�ҹ���, ����, Ư�����ڸ� ����ϼ���");
				return false;
			}
		}
	});
	
	$j("#userPwCheck").keyup(function(){
		if($j("#userPwCheck").val() != $j("#userPwCheck").val()){
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return false;
		}
	});
	
	$j("#userName").keyup(function(){
		if($j('#userName').val() != ''){
			if(!nameCheck.test($j('#userName').val())){
				alert("�ѱ�/������ �Է� �����մϴ�.");
				return false;
			}
		}
	});
	
	$j("#userPhone2").keyup(function(){
		if($j('#userPhone2').val() != ''){
			if(!phoneCheck.test($j('#userPhone2').val())){
				alert("4�ڸ� ���ڷ� �Է����ּ���.")
				return false;
			}
		}
	});
	
	$j("#userPhone3").keyup(function(){
		if($j('#userPhone3').val() != ''){
			if(!phoneCheck.test($j('#userPhone3').val())){
				alert("4�ڸ� ���ڷ� �Է����ּ���.")
				return false;
			}
		}
	});
	
	$j("#userAddr1").keyup(function(){
		if($j('#userAddr1').val() != ''){
			if(!postCheck.test($j('#userAddr1').val())){
				alert("xxx-xxx �������� �Է����ּ���.");
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
				alert("ȸ������ ����");
				location.href = "/users/userLogin.do";
			}
			/* ajax error ó���� ���� �⺻���� 3���� �Ķ���� */
			, error : function(jqXHR, textStatus, errorThrown)
			{
				alert("���� �ٽ� �õ����ּ���");
				/* location.href = "/users/userJoin.do"; */
			}
		});
	});
});
</script>
</html>