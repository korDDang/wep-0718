<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거주지 정보 목록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
int cnt=0;
int no=0;
try{
	String sql="select count(*) from area0718";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h3>거주지 정보 목록</h3>
<div style="margin: 0 15%">총 <%=cnt %>개의 거주지가 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
	<th class="th1">no</th>
	<th class="th1">거주지 코드</th>
	<th class="th1">거주지 이름</th>
	<th class="th1">구분</th>
</tr>
<%
try{
	String sql="select * from area0718";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String areacode=rs.getString(1);
		String areaname=rs.getString(2);
		no++;
		System.out.println("조회 성공");
	
%>
<tr>
<td class="td1"><%=no %></td>
<td class="td1"><%=areacode%></td>
<td class="td1"><%=areaname %></td>
<td class="td1">
<a href="update_area.jsp?areacode=<%=areacode%>">수정</a> /
<a href="delete_area.jsp?areacode=<%=areacode%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
</td>
</tr>
<%
	}
	

	}catch(Exception e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='addArea.jsp'" class="bt1"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>