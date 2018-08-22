<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="myutil.MultiPart"%>
<%@ page import="java.net.URLEncoder"%>

<%
   MultiPart multiPart = new MultiPart(request);
   
   String title = multiPart.getParameter("title");
   String description = multiPart.getParameter("description");
   
   String fileName = multiPart.getFileName("upload_file");
   String newPath = application.getRealPath("/product/image/files/" + fileName);
   multiPart.saveFile("upload_file", newPath);
   
   String url = String.format("UploadResult.jsp?title=%s&description=%s&file_name=%s", URLEncoder.encode(title, "utf-8"),URLEncoder.encode(description, "utf-8"), URLEncoder.encode(fileName, "utf-8"));
   response.sendRedirect(url);
   
   
%>