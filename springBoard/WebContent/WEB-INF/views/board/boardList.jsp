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

<table>
	<tr>
		<td >
			<input  type='checkbox' id='all' name='all' value='all' />전체
			<input  type='checkbox' id='boardType' name='boardType' value='일반' />일반
			<input  type='checkbox' id='boardType' name='boardType' value='Q&A' />Q&A
			<input  type='checkbox' id='boardType' name='boardType' value='익명' />익명
			<input  type='checkbox' id='boardType' name='boardType' value='자유' />자유
			<input id="board-list-submit" type='submit' value='조회'  onClick='onCheckboxSubmit()'/>
		</td>
	</tr>
</table>	
</body>


<script type="text/javascript">
	var message = "${msg}";
	var listData=[];
</script>

<!-- 보드 리스트 출력 -->
<c:forEach items="${boardList}" var="list">
	<script type="text/javascript">
		listData.push({
			codeName:'${list.codeName}',
			boardNum:'${list.boardNum}',
			boardTitle:'${list.boardTitle}',
			boardType:'${list.boardType}'
		});
	</script>
</c:forEach>

<script type="text/javascript">
var boardListTable = $j("#board-list-table");
var boardListCheckboxs = $j("input:checkbox[name=boardType]")


/* 리스트 데이터 ajax로 가져옴 */
$j.ajax({
	url: "boardList.do",
	type: "GET",
	data:listData,
});

if(message){
	alert(message);
};


/* 체크박스 전체선택/전체해제 */
$j(document).ready(function(){
    $j("#all").click(function(){
        if($j("#all").prop("checked")){
            $j("input[name=boardType]").prop("checked",true);
        }else{
            $j("input[name=boardType]").prop("checked",false);
        }
    });
    drawPosts('all');
});


/* 체크박스 전체선택부분의 함수 */
/* filterProps 매개변수가 'all'로 들어왔을때 or codeName값으로 들어왔을때 */
/* tr td 그려주고 배열에 담김 데이터값 출력 */
/* title부분에는 href로 링크 처리 */
/* tr변수에 append를 사용하여 데이터를 붙여줌 / boardListTable은 html 테이블 그리는 부분에 넣어줌 */
function drawPosts(filterProps){
    for(var i =0; i <= listData.length-1; i++){
    	if(filterProps==='all' || listData[i].codeName === filterProps){
     		var tr = $j("<tr/>");
    		var tdCodeName = $j("<td/>", {
  		  	text: listData[i].codeName,
			});
    		var tdBoardNum = $j("<td/>", {
  		  	text: listData[i].boardNum,
			});
    		var tdBoardTitle = $j("<td/>");
    		var tdBoardTitleLink = $j("<a/>", {
		  		text: listData[i].boardTitle,
	  			attr:{ href:"/board/"+listData[i].boardType+"/"+listData[i].boardNum+"/boardView.do" }
				});
	    	tr.append( [tdCodeName, tdBoardNum, tdBoardTitle.append(tdBoardTitleLink)] ).appendTo(boardListTable);
		}
    }
}


/* submit버튼(조회)을 눌렀을때 checkbox의 checked 상태값을 가지고 작동 */
/* checkbox 엘리먼트들을 checked가 되었을때 새로운 배열에 집어넣고  */
/* 새로운 배열의 길이가 있을때 화면을 지움(그렇지 않으면 계속 리스트가 쌓여감) */
/* checkbox의 value 값을 기준으로 화면을 다시 그림 */
function onCheckboxSubmit(){
    var checkedTypes = [];
    boardListCheckboxs.each(function(){
    	
   		if(this.checked){ checkedTypes.push(this); } 
    });
    if(checkedTypes.length){
    	boardListTable.empty();
        checkedTypes.forEach(function(type){
        	drawPosts(type.value)
        })
    }
    else{
    	window.location.href = '/board/boardList.do';
    }
}
</script>
</html>
