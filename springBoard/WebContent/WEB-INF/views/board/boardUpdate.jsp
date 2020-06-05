<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script>
$j(document).ready(function(){
	$j(function() {
		  $(".movie_list").on("click", function() {
		    var href=$(this).data("href");
		    location.href = href;
		  });
		});
}

</script>
<body>

<table align="center" style="border:1px solid gray">
	<tr>
		<td>
			<table border ="1"  style="border:none">
			<form method="POST" action="/board/${boardType}/${boardNum}/boardUpdate.do?">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					${board.creator}
					</td>
				</tr>
				<tr>
				<td align="center" colspan="2" style="clear:both; border:none">
					<button style="float:right" onclick="location.href='/board/'+${boardType}+'/'+${boardNum}+'/boardUpdate.do" type="button">수정</button>
					<button style="float:left"  onclick="location.href='/board/'+${boardType}+'/'+${boardNum}+'/boardView.do'" type="button">취소</button>
				</td>
				</tr>
				</form>
			</table>
		</td>	
	</tr>

</table>	

</body>
</html>