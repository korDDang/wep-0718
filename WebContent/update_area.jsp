<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거주지 정보 등록 화면</title>
<script>
function check() {
	var doc=document.form;
	if(doc.areacode.value==""){
		alert("거주지 코드를 입력하세요");
		doc.areacode.focus();
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
String areacode=request.getParameter("areacode");
String areaname="";
try{
	String sql="select * from area0718 where areacode=?" ;
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, areacode);
	rs=pstmt.executeQuery();
	if(rs.next()){
		 areaname=rs.getString("areaname");
		

	}
			
}catch(SQLException e){
	e.printStackTrace();
}%>

<h2>거주지 정보 수정 화면</h2>
<hr>
<form name="form" method="post" action="update_areaProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">거주지 코드</th>
		<td> 
		<input type="text" name="areacode" value="<%=areacode%>">
		</td>
</tr>
<tr>
	<th class="th1">거주지 이름</th>
		<td> 
		<input type="text" name="areaname" value="<%=areaname%>">
		</td>
</tr>
<tr>
	<td colspan="2" class="td1">
		<input type="button" value="수정" onclick="check()" class="bt1">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
</td>
</tr>

</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>