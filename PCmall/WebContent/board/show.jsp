<%@ page  import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=utf-8" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/ie-emulation-modes-warning.js"></script>
<script src="../js/ie10-viewport-bug-workaround.js"></script>
<style> 
   th, td {
  
  }
  .table-responsive{
  	width : 1150;
  	margin: auto;
  }
  </style>
<%!
     String b_name ,b_email,b_title,b_content,b_date,b_ip,mailto;
      int b_id , b_hit , ref=0 ;
 %>

<%
try {
      
   //DB풀 메니저 객체 생성 사용
   DBConnectionManager pool = DBConnectionManager.getInstance();
   Connection con = pool.getConnection("ora8");
     
   String bid=request.getParameter("b_id"); 
   Statement stmt = con.createStatement();
   stmt.executeUpdate("update re_board set b_hit=b_hit+1 where b_id="+bid+"");  //조회수를 올린다
   String sql="select b_id, b_name, b_email, b_title, b_content, to_char(b_date,'yy-mm-dd'),b_hit, b_ip, ref, step, anslevel, pwd  from re_board where b_id="+bid; 
   ResultSet rs = stmt.executeQuery(sql);  
   if(rs.next()) {   
      b_id=rs.getInt(1);
      b_name=rs.getString(2);
      b_email=rs.getString(3);
      b_title=rs.getString(4);
      b_content=rs.getString(5);
      b_date=rs.getString(6);
      b_hit=rs.getInt(7)+1;
      b_ip=rs.getString(8);
      ref = rs.getInt(9);  // 글 그룹
      if(!b_email.equals("")) {
         mailto="(<font size=2><a href=mailto:"+b_email+">"+b_email+"</a></font>)";
      } else {
         mailto="";
         }
   }
   rs.close(); 
   stmt.close();
   pool.freeConnection("ora8", con);
} catch (Exception e) {
	out.println(e);
}
%>	    

<html>
<head><title>WEB MALL</title>
<link href="../common/u3.css" type=text/css rel=stylesheet>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<br>
<div class="table-responsive" >

  <table class="table" border=1 width=550 height=30 bordercolor=black>
	<tr>
		<td align=center bgcolor=black><font size=3 color=#FFFFFF><b>게시물 읽기</b></td>
	</tr>
  </table>
  <br>
<table class="table" width="550" border="2" cellspacing="0" cellpadding="0">

	<tr>
	   <td width=120 align=center bgcolor=white>등록자</td>
	   <td width=170 bgcolor=white>&nbsp;<%=b_name%></td>
	   <td width=100 align=center bgcolor=white>작성일</td>
	   <td width=160 bgcolor=white>&nbsp;<%=b_date%>
	   </td>
	</tr>	
	
	<tr>
	   <td width=120 align=center bgcolor=white>E-mail 주소</td>
	   <td colspan=3 bgcolor=white>&nbsp;
	        <a href="mailto:<%=b_email%>"><%=b_email%></a></td>
	</tr>	
	
	<tr>
	   <td align=center bgcolor=white>제 목</td>
	   <td colspan=3 bgcolor=white>&nbsp;<%=b_title%></td>
	</tr>	
	<tr>
	   <td align=center bgcolor=white>내 용</td>
	   <td colspan=3 bgcolor=white>
	   
	    <table class="table">
	      <tr>
	         <textarea cols=60 rows=15 name="content"><%=b_content%></textarea>
	      </tr>
	   </table>
	   </td>
	</tr>

    <tr>
	   	<td colspan=4 align=right height=28 >
	   	  <a href="reply_form.jsp?b_id=<%=b_id%>"><img src="img/b_re.gif" border=0></a>
		  <a href="update_form.jsp?b_id=<%=b_id%>"><img src="img/b_modify.gif" border=0></a>
		  <a href="delete_confirm.jsp?b_id=<%=b_id%>"><img src="img/b_delete.gif" border=0></a>
		  <a href="javascript:history.go(-1)"><img src="img/b_list.gif" border=0></a>
	   	</td>
	  </TR>
	</table>
</div>
		<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>