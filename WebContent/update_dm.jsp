<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dm 정보 수정 </title>
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
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
String dmno=request.getParameter("dmno");
String maildate="";
String contents="";
String dept="";
String grade="";
String campain="";
String author="";
String custid="";
try{
	String sql="select c.custid,c.author,to_char(d.maildate,'YYYY-MM-DD'),d.contents,d.dept,d.grade,d.campain from dm0718 d,customer0718 c where c.custid=d.custid  and dmno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, dmno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		custid=rs.getString(1);
		 author=rs.getString(2);
		 maildate=rs.getString(3);
		contents=rs.getString(4);
		 dept=rs.getString(5);
		 grade=rs.getString(6);
		 campain=rs.getString(7);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>dm 정보 수정 </h2>
<hr>
<form name="form" method="post" action="update_dmProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">dm발송 번호</th>
		<td colspan="3"> 
		<input type="text" name="dmno" value="<%=dmno%>">
		</td>
</tr>

<tr>
	<th class="th1">고객아이디</th>
		<td> 
		<input type="text" name="custid" value="<%=custid%>">
		</td>
	<th class="th1">고 객 명</th>
		<td> 
		<input type="text" name="author" value="<%=author%>">
		</td>
</tr>
<tr>
	<th class="th1">발송일자</th>
		<td> 
		<input type="text" name="maildate" value="<%=maildate%>"> 
		</td>
	<th class="th1">dm내용</th>
		<td> 
		<input type="text" name="contents" value="<%=contents%>"> 
		</td>
</tr>
<tr>
	<th class="th1">발송부서</th>
		<td> 
		<input type="text" name="dept" value="<%=dept%>">
		</td>
	<th class="th1">고객등급</th>
		<td> 
		 <select name="grade">
		 	<option value="1" <%=grade.equals("1")?"selected":"" %>>1</option>
		 	<option value="2" <%=grade.equals("2")?"selected":"" %>>2</option>
		 	<option value="3" <%=grade.equals("3")?"selected":"" %>>3</option>
		 	<option value="4" <%=grade.equals("4")?"selected":"" %>>4</option>
		 	<option value="5" <%=grade.equals("5")?"selected":"" %>>5</option>
		 	<option value="V" <%=grade.equals("V")?"selected":"" %>>V</option>
		 	<option value="W" <%=grade.equals("W")?"selected":"" %>>W</option>
		 </select>
		</td>
</tr>
<tr>
	<th class="th1">캠패인구분</th>
		<td colspan="3"> 
		<input type="text" name="campain" value="<%=campain%>">
		</td>
</tr>
<tr>
	<td colspan="4" class="td1">
		<input type="button" value="목록" onclick="location.href='dmSelect.jsp'" class="bt1">
		<input type="button" value="수정" onclick="check()" class="bt1">
</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>