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
String custid=request.getParameter("custid");

try{
	String sql="delete from customer0718 where custid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custid);
	pstmt.executeUpdate();
	%>
	<script>
	alert("삭제 완료");
	location.href="customerSelect.jsp";
	</script>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}
%>
</body>
</html>