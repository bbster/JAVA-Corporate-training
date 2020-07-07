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
								<button type="button" id="userIdDupCheck" name="userIdDupCheck">�ߺ�Ȯ��</button><br>
								<small id="userIdCheck"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								password
							</td>
							<td>
								<input type="password" id="userPw" name="userPw"><br>
								<small id="userPwCheckSub"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								password check
							</td>
							<td>
								<input type="password" id="userPwCheck" name="userPwCheck"><br>
								<small id="userPwCheckSub2"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								name
							</td>
							<td>
								<input type="text" id="userName" name="userName"><br>
								<small id="userNameSub"></small>
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
								<!-- input option�� pattern�̶�� ���Խ��� ������ �ִ� ���  -->
								<input type="tel" id="userPhone2" name="userPhone2" size="2" pattern="[0-9]{4}">
								<input type="tel" id="userPhone3" name="userPhone3" size="2" pattern="[0-9]{4}"><br>
								<small id="userPhoneSub"></small>
							</td>
						</tr>
						<tr>
							<td align="center">
								postNo
							</td>
							<td>
								<input type="tel" id="userAddr1" name="userAddr1" pattern="[0-9]{3}-[0-9]{3}"><br>
								<small id="userAddr1Sub"></small>
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
var idCheck = /[a-zA-Z]+[a-zA-Z0-9_-]{5,20}$/g;
var pwCheck = /^[a-zA-Z]+[a-zA-Z0-9_-]{6,12}$/g;	
var phoneCheck = /^[0-9]{1,4}$/;
var korCheck = /[��-��|��-��|��-��]/; 
var postCheck = /^\d{3}-\d{3}$/;

$j(document).ready(function(){
	$j('#joinBtn').attr('disabled','disabled');
	
	/* ȸ�����Խ� �Է°� validation */
	/* userId�� �ѱ��� ������ ������, ���ڷ� �̷���� */
	$j("#userId").keyup(function(){
		if(korCheck.test($j('#userId').val())){
			$j('#idSub').attr('style','color:#B70000');
			$j('#userIdCheck').text('5~20�ڸ��� ������ ���ڷθ� �����ؼ� �Է����ּ���.');
			this.value='';
			return false;
		}
		else{
			$j('#userIdCheck').empty();
		}
		
 		if($j('#userId').val().toString().length < 5){
 			$j('#userIdCheck').attr('style','color:#B70000');
			$j('#userIdCheck').text('5~20�ڸ��� ������ ���ڷθ� �����ؼ� �Է����ּ���.');
			return false;
		}
 		else if($j('#userId').val().toString().length > 20){
			$j('#userIdCheck').attr('style','color:#B70000');
			$j('#userIdCheck').text('5~20�ڸ��� ������ ���ڷθ� �����ؼ� �Է����ּ���.');
			return false;
		} 
		else {
			$j('#userId').empty();
		}
	});
	
	$j("#userPw").keyup(function(){
		if($j("#userPw").val() != ''){ // null�� �ƴҶ�
			if(!pwCheck.test($j('#userPw').val())){
				$j('#userPwCheckSub').attr('style','color:#B70000');
				$j('#userPwCheckSub').text('6~12�ڸ� ������ ���ڷθ� �����ؼ� �Է����ּ���.');
				return false;
			}else{
				$j('#userPwCheckSub').empty();
			}
		
// 		if($j('#userPw').val().toString().length < 6){
// 	 			$j('#userPwCheckSub').attr('style','color:#B70000');
// 				$j('#userPwCheckSub').text('6~12�ڸ� ������ ���ڷθ� �����ؼ� �Է����ּ���.');
// 				return false;
// 			}
// 	 		else if($j('#userPw').val().toString().length > 12){
// 				$j('#userPwCheckSub').attr('style','color:#B70000');
// 				$j('#userPwCheckSub').text('6~12�ڸ� ������ ���ڷθ� �����ؼ� �Է����ּ���.');
// 				this.value='';
// 				return false;
// 			} 
// 			else {
// 				$j('#userPwCheckSub').empty();
// 			}
		}
	});
	
	$j("#userPwCheck").keyup(function(){
		if($j('#userPwCheck').val() != ''){
			if($j('#userPwCheck').val() == $j('#userPw').val()){
				$j('#userPwCheckSub2').attr('style','color:#008000');
				$j('#userPwCheckSub2').text("��й�ȣ�� ��ġ�մϴ�!");
				return false;
			}else{
				$j('#userPwCheckSub2').attr('style','color:#B70000');
				$j('#userPwCheckSub2').text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			}
		}
	});
	
	
	$j("#userName").keyup(function(){
		if($j('#userName').val() != ''){
			if(!korCheck.test($j('#userName').val())){
				$j('#userNameSub').attr('style','color:#B70000');
				$j('#userNameSub').text('�ѱ۸� �Է� ���ּ���.');
				this.value='';
				return false;
			}else{
				$j('#userNameSub').empty();
			}
			
			if($j('#userName').val().toString().length < 3){
				$j('#userNameSub').attr('style','color:#B70000');
				$j('#userNameSub').text(' �ּ� 3���� �̻� �ִ� 5���� ����');
				return false;
			}else if($j('#userName').val().toString().length > 8){
				$j('#userNameSub').attr('style','color:#B70000');
				$j('#userNameSub').text(' �ּ� 3���� �̻� �ִ� 5���� ����');
				return false;
			}else{
				$j('#userNameSub').empty();
			}
		}
	});
	
	$j("#userPhone2").keyup(function(){
		if($j('#userPhone2').val() != ''){
			if(!phoneCheck.test($j('#userPhone2').val())){
				$j('#userPhoneSub').attr('style','color:#B70000');
				$j('#userPhoneSub').text('xxxx-xxxx ������ ���ڸ� �Է����ּ���.');
				this.value='';
				return false;
			}else{
				$j("#userPhoneSub").empty();
			}
		}
	});

	$j("#userPhone3").keyup(function(){
		
		if($j('#userPhone3').val() != ''){
			if(!phoneCheck.test($j('#userPhone3').val())){
				$j('#userPhoneSub').attr('style','color:#B70000');
				$j('#userPhoneSub').text('xxxx-xxxx ������ ���ڸ� �Է����ּ���.');
				this.value='';
				return false;
			}else{
				$j("#userPhoneSub").empty();
			}
		}
	});
	
	$j("#userAddr1").keypress(function(){
		var insertHyphen = /^[0-9]{3}$/;
		if(insertHyphen.test($j('#userAddr1').val())){
			this.value=$j("#userAddr1").val()+'-';
		}
	});
	
	$j("#userAddr1").blur(function(){
		if($j('#userAddr1').val() != ''){
			console.log($j('#userAddr1').val());
			if(!postCheck.test($j('#userAddr1').val())){
				$j('#userAddr1Sub').attr('style','color:#B70000');
				$j('#userAddr1Sub').text('xxx-xxx ������ ���ڸ� �Է����ּ���.');
				this.value='';
				return false;
			}
			else{
				$j("#userAddr1Sub").empty();
			}
		}
	});
	
	/* ���̵� �ߺ�üũ ��ư */
	$j('#userIdDupCheck').click(function(){
		var idDupCheck = $j('#userId').val();
		
		console.log(idDupCheck);
		
		if(idDupCheck.length > 4 && idDupCheck.length < 21){
			$j.ajax({
				url : "/users/userIdDupCheck.do"
				,type : 'POST'
				,data : {'userId' : idDupCheck}
				,success : function(data){
					if(data == 1){
						alert("��� �Ұ����� ���̵� �Դϴ�.");
						$j('#joinBtn').attr('disabled','disabled');						
					}else{
						alert("��� ������ ���̵� �Դϴ�.");
						$j('#joinBtn').removeAttr('disabled');
					}
				}
			});
		}else{
			alert("���̵� ������ ���� �ʽ��ϴ�.");
		}
	});
	
	/* ���� ��ư �������� */
	$j('#joinBtn').click(function(){
		/* document.joinForm.action="${path}/users/userJoinAction.do";
		document.joinForm.submit(); */
		var $formData = $j('#joinForm');
		var dataParams = $formData.serialize();
		
		console.log(dataParams);
		
		if($j('#userId').val().toString().length > 4 && $j('#userId').val().toString().length < 21
				&& $j('#userPw').val().toString().length > 4 && $j('#userPw').val().toString().length < 21){
			if($j('#userPwCheck').val().toString().length > 5 && $j('#userPwCheck').val().toString().length < 13
					&& $j('#userPwCheck').val() == $j('#userPw').val()){
				if($j('#userName').val().toString().length > 2 && $j('#userName').val().toString().length < 6){
					if($j('#userPhone2').val().toString().length == 4 && $j('#userPhone3').val().toString().length == 4){
						if($j('#userAddr1').val().toString().length == 7){
							$j.ajax({
								url : "/users/userJoinAction.do"
								, dataType : 'json'
								, type : 'POST'
								, data : dataParams
								,success : function(data, textStatus, jqXHR)
								{
									alert("ȸ������ ����");
									location.href = "/users/userLogin.do";
								}
								/* ajax error ó���� ���� �⺻���� 3���� �Ķ���� */
								, error : function(jqXHR, textStatus, errorThrown)
								{
									alert("����");
									/* location.href = "/users/userJoin.do"; */
								}
							});
						}else{
							alert("�����ȣ ������ ���� �ʽ��ϴ�.");
						}
					}else{
						alert("Phone �Է°��� �߸��Ǿ����ϴ�. xxxx - xxxx ���·� �Է����ּ���.")
					}
				}else{
					alert("�������� ������ �����ʽ��ϴ�.")
				}
			}else{
				alert("�н����� ������ ���� �ʽ��ϴ�.")
			}
		}else{
			alert("���̵� �н����� ������ ���� �ʽ��ϴ�.");
		}
	});
});
</script>
</html>