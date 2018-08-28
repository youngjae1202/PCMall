<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="myutil.MultiPart"%>
<%@ page import="java.net.URLEncoder"%>

<%
   MultiPart multiPart = new MultiPart(request);
   




   //전송된 데이터를 받음
 /*   String title = multiPart.getParameter("title");
   String description = multiPart.getParameter("description");
  */  
   String code = multiPart.getParameter("combo");
   String name = multiPart.getParameter("name");
   String price = multiPart.getParameter("price");
   String expression = multiPart.getParameter("expression");
 
   //파일 이름 및 파일을 받을 경로 지정
   String fileName = multiPart.getFileName("upload_file");  
   String newPath = application.getRealPath("/product/image/files/" + fileName);
   multiPart.saveFile("upload_file", newPath);
   
   //파일 결과 값을 지정하기 위한것
   String url = String.format("product_insert.jsp?code=%s&name=%s&price=%s&expression=%s&fileName=%s", URLEncoder.encode(code, "utf-8"),URLEncoder.encode(name, "utf-8"),URLEncoder.encode(price, "utf-8"),URLEncoder.encode(expression, "utf-8"),URLEncoder.encode(fileName, "utf-8"));
   response.sendRedirect(url);
   
   
%>