<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dm 정보 등록 </title>
<script>
function check() {
	var doc=document.form;
	if(doc.dmno.value==""){
		alert("dm발송번호를 입력하세요");
		doc.dmno.focus();
		return false;
	}else{
		doc.submit();
	}
}

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<h2>dm 정보 등록 </h2>
<hr>
<form name="form" method="post" action="addDmProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">dm발송 번호</th>
		<td colspan="3"> 
		<input type="text" name="dmno">
		</td>
</tr>

<tr>
	<th class="th1">고객아이디</th>
		<td> 
		<input type="text" name="custid">
		</td>
	<th class="th1">고 객 명</th>
		<td> 
		<input type="text" name="author">
		</td>
</tr>
<tr>
	<th class="th1">발송일자</th>
		<td> 
		<input type="text" name="maildate">
		</td>
	<th class="th1">dm내용</th>
		<td> 
		<input type="text" name="contents">
		</td>
</tr>
<tr>
	<th class="th1">발송부서</th>
		<td> 
		<input type="text" name="dept">
		</td>
	<th class="th1">고객등급</th>
		<td> 
		 <select name="grade">
		 	<option value="1">1</option>
		 	<option value="2">2</option>
		 	<option value="3">3</option>
		 	<option value="4">4</option>
		 	<option value="5">5</option>
		 	<option value="V">V</option>
		 	<option value="W">W</option>
		 </select>
		</td>
</tr>
<tr>
	<th class="th1">캠패인구분</th>
		<td colspan="3"> 
		<input type="text" name="campain">
		</td>
</tr>
<tr>
	<td colspan="4" class="td1">
		<input type="button" value="목록" onclick="location.href='dmSelect.jsp'" class="bt1">
		<input type="button" value="등록" onclick="check()" class="bt1">
</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>