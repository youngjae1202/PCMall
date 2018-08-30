<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*,oracle.dbpool.*" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   

<HTML>
   <HEAD>
      <TITLE>WEB MALL</TITLE>
      <script language=JavaScript src="../common/u3.js"></script>
      <link href="../common/u3.css" type=text/css rel=stylesheet>
   </HEAD>

<BODY>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
   
<!--  신상품 화면    -->
   <table width=1000 align=center>
      <tr bgcolor=#7aaad5 height=25>
         <td colspan=3 align=center bgcolor=black><font color=#ffffff><b>신 상 품</b></font></td>
      </tr>
   </table><br>
   <table cellpadding=1 cellspacing=1 width=1000 align=center>
<%
   try {
      String name,company_id,expression,photo;
      int id,price;
      DBConnectionManager pool = DBConnectionManager.getInstance();
      Connection con = pool.getConnection("ora8");

      Statement stmt=con.createStatement();
      ResultSet rs=stmt.executeQuery("select id,name,price,company_id,expression,photo from product order by cdate desc, id desc");
      
      int flag=0;
        int stop = 1;      
      while(rs.next())  {
         id=rs.getInt(1);
         name=rs.getString(2);
         price=rs.getInt(3);
         company_id=rs.getString(4);
         expression=rs.getString(5);
         photo=rs.getString(6);
      if(flag==0){
%>
      <tr>
         <td>
            <!-- ========= 왼쪽 테이블 ========== -->
            <table width="450" border=1 cellpadding=1 cellspacing=2 align=center bordercolor=gray>
            <tr>
               <td colspan=2 align="center"><a href="../product/product.jsp?i=<%= id%>">
               <img src="../product/image/<%=photo%>" width=100 height=100 border=0></a></td>
            </tr>
            <tr>
               <td width=60 align=right bgcolor=#CCD6DD>상품명</td>
               <td bgcolor=#CCD6DD>&nbsp;&nbsp;<%=name%></td>
            </tr>
            <tr>
            <c:set var="fmtPrice" value="<%=price%>"/>
               <td width=60 align=right bgcolor=#CCD6DD>가격</td>
               <td bgcolor=#CCD6DD>&nbsp;&nbsp;<fmt:formatNumber value="${fmtPrice }" pattern="#,###" />&nbsp;원</td>
            </tr>
            <tr>
               <td width=60 align=right bgcolor=#CCD6DD>제조회사</td>
               <td bgcolor=#CCD6DD>&nbsp;&nbsp;<%=company_id%></td>
            </tr>
            <tr>
               <td width=60 align=right bgcolor=#CCD6DD><font  color=black>제품설명</font></td>
               <td bgcolor=#CCD6DD>&nbsp;&nbsp;<%=expression%></td>
            </tr>
               <br>
            </table>
             <!-- 끝 -->
<%      
      flag=1;            

      } else {
%>
      </td>
      <td>
         <!-- 오른쪽  테이블 -->
         <table width="450" border=1 cellpadding=1 cellspacing=2 align=center bordercolor=gray>
         <tr>
            <td colspan=2 align="center"><a href="../product/product.jsp?i=<%= id%>">
            <img src="../product/image/<%=photo%>" width=100 height=100 border=0></a></td>
         </tr>
         <tr>
            <td width=60 align=right bgcolor=#CCD6DD>상품명</td>
            <td bgcolor=#CCD6DD>&nbsp;&nbsp;<%=name%></td>
         </tr>
         <tr>
         <c:set var="fmtPrice" value="<%=price%>"/>
            <td width=60 align=right bgcolor=#CCD6DD>가격</td>
            <td bgcolor=#CCD6DD>&nbsp;<fmt:formatNumber value="${fmtPrice }" pattern="#,###" />&nbsp;원</td>
         </tr>
         <tr>
            <td width=60 align=right bgcolor=#CCD6DD>제조회사</td>
            <td bgcolor=#CCD6DD>&nbsp;&nbsp;<%=company_id%></td>
         </tr>
         <tr>
            <td width=60 align=right bgcolor=#CCD6DD><font color=black>제품설명</td>
            <td bgcolor=#CCD6DD>&nbsp;&nbsp;<%=expression%></td>
         </tr>
         <br>
         </table>
         <!--끝 -->   
      </td>
   </tr>
<%
   flag=0;

     stop = stop + 1;
    if( stop > 2) break;
   } //while
   } //try
        rs.close(); 
        stmt.close();
    pool.freeConnection("ora8", con);
} catch (Exception e) {
   out.println(e);
}
%>
   </table>

<!--  화면 끝   -->
   <jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</BODY>
</HTML>