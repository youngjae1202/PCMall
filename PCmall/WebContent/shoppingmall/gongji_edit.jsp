<%@ page import="java.sql.*,oracle.dbpool.*"
   contentType="text/html;charset=utf-8"%>

<%
   try {

      //DB풀 메니저 객체 생성 사용
      DBConnectionManager pool = DBConnectionManager.getInstance();
      Connection con = pool.getConnection("ora8");
      
      //String bid=request.getParameter("bid"); 
      String idnum=session.getAttribute("idnum").toString(); 

      
      String g_title = makeKOR(request.getParameter("title"));
      String g_body = makeKOR(request.getParameter("body"));
      //쿼리에 '가 들어가면 에러가 발생하므로 replace 처리해준다.
      idnum = Replace(idnum, "'", "''");
      g_title = Replace(g_title, "'", "''");
      g_body = Replace(g_body, "'", "''");


      String b_id = request.getParameter("b_id");

      String sql = "update notice set title=?, body=? where idnum=?";
      PreparedStatement pstmt = con.prepareStatement(sql); 
      //pstmt.setInt(1,count);
       //pstmt.setInt(1,product_id);
      pstmt.setString(1,g_title);
       pstmt.setString(2, g_body);
       pstmt.setString(3, idnum);

       pstmt.executeUpdate();
      pstmt.close();
      pool.freeConnection("ora8", con); 
%>
<script language=javascript>
   alert("수정 하였습니다.");
   location.href = "gongji.jsp";
</script>
<%
   } catch (Exception e) {
      out.println(e);
   }
%>

<%!String makeKOR(String str) throws java.io.UnsupportedEncodingException {
      String kor = "";
      if (str == null)
         kor = null;
      else
         kor = new String(str.getBytes("ISO-8859-1"), "utf-8");
      return kor;
   }

   // 개행 처리를 위한 메소드 

   public static String Replace(String original, String oldString, String newString) {
      for (int index = 0; (index = original.indexOf(oldString, index)) >= 0; index += newString.length())
         original = original.substring(0, index) + newString + original.substring(index + oldString.length());
      return original;
   }%>


<html>
<head>
<title>WebMall</title>
<script language="Javascript">
   function alrim() {
      alert("성공적으로 수정하였습니다.");
      location.href = "gongji.jsp";
   }
</script>
</head>
<body onload="alrim();">
</body>
</html>