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
String dmno=request.getParameter("dmno");
String maildate=request.getParameter("maildate");
String contents=request.getParameter("contents");
String dept=request.getParameter("dept");
String grade=request.getParameter("grade");
String campain=request.getParameter("campain");
try{
	String sql="insert into DM0718 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, dmno);
	pstmt.setString(2, custid);
	pstmt.setString(3, maildate);
	pstmt.setString(4, contents);
	pstmt.setString(5, dept);
	pstmt.setString(6, grade);
	pstmt.setString(7, campain);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록이 완료되었습니다!");
	location.href="dmSelect.jsp";
	</script>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>