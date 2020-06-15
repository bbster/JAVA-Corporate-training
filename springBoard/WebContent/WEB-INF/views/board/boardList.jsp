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
			<a href ="/board/boardWrite.do">�۾���</a>
		</td>
	</tr>
</table>

<table>
	<tr>
		<td >
			<input  type='checkbox' id='all' name='all' value='all' />��ü
			<input  type='checkbox' id='boardType' name='boardType' value='�Ϲ�' />�Ϲ�
			<input  type='checkbox' id='boardType' name='boardType' value='Q&A' />Q&A
			<input  type='checkbox' id='boardType' name='boardType' value='�͸�' />�͸�
			<input  type='checkbox' id='boardType' name='boardType' value='����' />����
			<input id="board-list-submit" type='submit' value='��ȸ'  onClick='onCheckboxSubmit()'/>
		</td>
	</tr>
</table>	
</body>


<script type="text/javascript">
	var message = "${msg}";
	var listData=[];
</script>

<!-- ���� ����Ʈ ��� -->
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


/* ����Ʈ ������ ajax�� ������ */
$j.ajax({
	url: "boardList.do",
	type: "GET",
	data:listData,
});

if(message){
	alert(message);
};


/* üũ�ڽ� ��ü����/��ü���� */
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


/* üũ�ڽ� ��ü���úκ��� �Լ� */
/* filterProps �Ű������� 'all'�� �������� or codeName������ �������� */
/* tr td �׷��ְ� �迭�� ��� �����Ͱ� ��� */
/* title�κп��� href�� ��ũ ó�� */
/* tr������ append�� ����Ͽ� �����͸� �ٿ��� / boardListTable�� html ���̺� �׸��� �κп� �־��� */
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


/* submit��ư(��ȸ)�� �������� checkbox�� checked ���°��� ������ �۵� */
/* checkbox ������Ʈ���� checked�� �Ǿ����� ���ο� �迭�� ����ְ�  */
/* ���ο� �迭�� ���̰� ������ ȭ���� ����(�׷��� ������ ��� ����Ʈ�� �׿���) */
/* checkbox�� value ���� �������� ȭ���� �ٽ� �׸� */
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
