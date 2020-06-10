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
<script type="text/javascript">
var message = "${msg}";
if(message){
	alert(message);
};

$j(document).ready(function(){
    $j("#all").click(function(){
        if($j("#all").prop("checked")){
            $j("input[name=code_name]").prop("checked",true);
        }else{
            $j("input[name=code_name]").prop("checked",false);
        }
    })
});

$j(document).ready(function(){

});

1
</script>
<body>
<table>
<tr>
	<td>
		<a href="">Login</a>
	</td>
	<td>
		<a href="">Join</a>
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
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.code_name}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	
	
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
</table>

<form action="">
<table>
	<tr>
		<input type='checkbox' id='all' name='all' value='all' />전체
		<input type='checkbox' id='boardType' name='boardType' value='a01' />일반
		<input type='checkbox' id='boardType' name='boardType' value='a02' />Q&A
		<input type='checkbox' id='boardType' name='boardType' value='a03' />익명
		<input type='checkbox' id='boardType' name='boardType' value='a04' />자유
		<input type='submit' value='조회' />
	</tr>
</table>	
</form>
</body>
</html>

