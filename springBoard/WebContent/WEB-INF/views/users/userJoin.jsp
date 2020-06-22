<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<title>
회원가입
</title>
<body>
	<table>
		<tbody>
			<td>
				<button style="float:left"  onclick="location.href='/board/boardList.do'" type="button">목록</button>
			</td>
		</tbody>
	</table>
	<table>
		<tbody id="board-list-table">
					<tr>
						<td>
						id
						</td>
						<td>
						<input type="text">
						</td>
						<td>
						<input type="button">
						</td>
					</tr>
					<tr>
						<td>
						pw
						</td>
						<td>
						<input type="text">
						</td>
					</tr>
					<tr>
						<td>
						pw_check
						</td>
						<td>
						<input type="text">
						</td>
					</tr>
					<tr>
						<td>
						name
						</td>
						<input type="text">
					</tr>
					<tr>
						<td>
						phone
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td>
						postNo
						</td>
						<td>
						</td>
					</tr>
					
			</tbody>
	</table>		
</body>
</html>