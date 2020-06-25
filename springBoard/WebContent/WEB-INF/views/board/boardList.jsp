<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%request.setCharacterEncoding("euc-kr"); %>
<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<body>
<table align="center">
<tr>
	<td>
		<a href="/users/userLogin.do">Login</a>
	</td>
	<td>
		<a href ="/users/userJoin.do">Join</a>
	</td>
</tr>
</table>
<table  align="center">
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
			<thead>
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
			</thead>
			<tbody id="board-list-table">
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td>
							${list.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href="/board/${list.boardType}/${list.boardNum}/boardView.do">${list.boardTitle}</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
</table>
<table align="center">
	<tr>
		<td>
			<form id="selectType"  method="get" action="/board/boardList.do">
			<input type="checkbox" class="chk" id="chk_all" name="chk_all">전체선택
			<c:forEach var="comCode" items="${codeName}" varStatus="status">
			<input type="checkbox" class="chk" id="boardType" name="boardType" value="${comCode.codeId}">${comCode.codeName}</>
			</c:forEach>
			<input type='submit' value='조회' onClick='onCheckboxSubmit()'/>
			</form>
		</td>
	</tr>
</table>
</body>

<script type="text/javascript">
	var message = "${msg}";

if(message){
	alert(message);
};

/* 체크박스 전체선택/전체해제 */
$j(document).ready(function(){
	$j("#chk_all").click(function(){
		if($j("#chk_all").is(":checked")){
			$j(".chk").prop("checked", true);
		}else{
			$j(".chk").prop("checked",false);
		}
	}); 

/* JSTL 내장함수 fn으로 boardType의 요소의 개수를 리턴 한다.  */
var typeLength = ${fn:length(codeName)};

	$j(".chk").click(function(){
		if($j("input[name=boardType]:checked").length == typeLength){
			$j("#chk_all").prop("checked", true);
		}else{
			$j("#chk_all").prop("checked", false);
		}
	});
});
</script>
</html>