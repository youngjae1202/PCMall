<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=utf-8" %>
<%
   try{
      DBConnectionManager pool = DBConnectionManager.getInstance();
      Connection con = pool.getConnection("ora8");
      String user_pwd="";
      String mem_uid = request.getParameter("user_id"); 
      String mem_psn = request.getParameter("user_ssn");
      String sql = "select m_pwd from member where m_uid ='" + mem_uid +"' and m_ssn ='"+ mem_psn +"'"; 
      String pwd = sql;
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery(sql);

      if(rs.next()) {
         
         user_pwd = rs.getString(1);
         System.out.println("@@@@@@@@ ID 조회확인 ");
         
         %>      
         <script>
             var sqlStr = "<%=user_pwd%>";
            alert("찾으시는 PASSWORD:" + sqlStr);
            location.href="../member/login.jsp";    
         </script>
<% 
   
      } else{
         System.out.println("!!!!!!!!! ID 없으니 회원가입");
 %>

         <script language="JavaScript"> 
            alert("아이디와 주민등록번호가 틀렸습니다.");
            history.go(-1); 
         </script>
  
 <% }
      
%>
<%
      

   } catch(Exception e) {

      //out.println(e);
      e.getMessage();
   }
%>