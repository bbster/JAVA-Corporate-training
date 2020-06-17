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
		<td>
			<form id="selectType"  method="get" action="/board/boardList.do">
			<input type="checkbox" class="chk" id="chk_all" name="chk_all">��ü����
			<c:forEach var="comCode" items="${codeName}" varStatus="status">
			<input type="checkbox" class="chk" name="boardType" value="${comCode.codeId}">${comCode.codeName}</>
			</c:forEach>
			<input id="board-list-submit" type='submit' value='��ȸ' onClick='onCheckboxSubmit()'/>
			</form>
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
var boardListCheckboxs = $j("input:checkbox[name=boardType]");


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
	$j("#chk_all").click(function(){
		if($j("#chk_all").is(":checked")){
			$j(".chk").prop("checked", true);
		}else{
			$j(".chk").prop("checked",false);
		}
	}); 


/* JSTL �����Լ� fn���� boardType�� ����� ������ ���� �Ѵ�.  */
var typeLength = ${fn:length(codeName)};

console.log("codeName ����: "+ typeLength);
console.log("checked �� ���� " + $j("input[name=boardType]:checked").length);

    
$j(".chk").click(function(){
	if($j("input[name=boardType]:checked").length == typeLength){
		$j("#chk_all").prop("checked", true);
	}else{
		$j("#chk_all").prop("checked", false);
	}
	drawPosts("type");
});
});

/* üũ�ڽ� ��ü���úκ��� �Լ� */
/* filterProps �Ű������� 'all'�� �������� or codeName������ �������� */
/* tr td �׷��ְ� �迭�� ��� �����Ͱ� ��� */
/* title�κп��� href�� ��ũ ó�� */
/* tr������ append�� ����Ͽ� �����͸� �ٿ��� / boardListTable�� html ���̺� �׸��� �κп� �־��� */
function drawPosts(filterProps){
    for(var i =0; i <= listData.length-1; i++){
    	if(filterProps === 'all' || listData[i].codeName === filterProps){
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
