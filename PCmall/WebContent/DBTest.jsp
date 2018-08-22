<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String url="jdbc:oracle:thin:@localhost:1521:orcl";

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = DriverManager.getConnection(url,"antman","12345");

if(conn !=null){
	out.println("연결 완료");
	conn.close();
	out.println("연결 종료");
}else{
	out.println("연결 실패");
}

%>
</body>
</html>