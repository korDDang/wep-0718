<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
String areacode=request.getParameter("areacode");
String areaname=request.getParameter("areaname");

try{
	String sql="insert into area0718 values(?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, areacode);
	pstmt.setString(2, areaname);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록이 완료되었습니다!");
	location.href="areaSelect.jsp";
	</script>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>