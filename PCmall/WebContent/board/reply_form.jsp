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
<%
 //DB풀 메니저 객체 생성 사용
   DBConnectionManager pool = DBConnectionManager.getInstance();
   Connection con = pool.getConnection("ora8");
  
   String  b_name=null, b_email=null, b_title=null, b_content=null;
   int      ref = 0, step=0, level=0;
   String b_id=request.getParameter("b_id");

      
   Statement stmt= con.createStatement();
   String sql="select b_name,b_email,b_title,b_content, ";
          sql += " ref, step, anslevel from re_board where b_id="+b_id;

   ResultSet rs=stmt.executeQuery(sql);
   if(rs.next()) {
      b_name=rs.getString(1);
      b_email=rs.getString(2);
      b_title=rs.getString(3);
      b_content=rs.getString(4);
      ref = rs.getInt(5);
      step = rs.getInt(6);
      level = rs.getInt(7);
   }   

     rs.close();
     stmt.close();
     pool.freeConnection("ora8", con); 
%>

<html>
<head><title>WebMall</title>
<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>

<script>
function go_reply()
{
	var form = document.reply_form;
	
	if(!form.title.value){
		alert("제목을 입력하세요.");
		form.title.focus();
		return ;
	}
	if(!form.pwd.value){
		alert("암호를 입력하세요");
		form.pwd.focus();
		return ;
	}
	if(!form.name.value){
		alert("이름을 입력하세요");
		form.name.focus();
		return ;
	}
	if(!form.body.value){
		alert("내용을 입력하세요.");
		form.body.focus();
		return;
	}
	form.submit();
}

</script>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
<br>
<div class="table-responsive" >
  <table class="table" border=1 width=550 height=30 bordercolor=black>
	<tr>
		<td align=center bgcolor=black><font size=3 color=#FFFFFF><b>게시물 답변</b></td>
	</tr>
  </table><br>

<table class="table" width="550" border="1" cellspacing="0" cellpadding="0">

<form method="post" name="reply_form" action="reply.jsp">
  <input type="hidden" name="b_id" value="<%=b_id%>">
  <input type="hidden" name="ref" value="<%=ref%>">
  <input type="hidden" name="step" value="<%=step%>">
  <input type="hidden" name="level" value="<%=level%>">

	<tr>
	   <td width=110 align=center bgcolor=white>등록자</td>
	   <td width=160 bgcolor=ffffff>&nbsp;<input type="text" name="name" size=20></td>
	   <td width=100 align=center bgcolor=white>비밀번호</td>
	   <td width=160 bgcolor=ffffff>&nbsp;<input type="password" name="pwd" size=15 value="" ></td>
	</tr>	
	<tr>
	   <td width=110 align=center bgcolor=white>E-mail 주소</td>
	   <td  colspan=3 bgcolor=ffffff>&nbsp;<input type="text" size=30 name="email" value=""></td>
	</tr>	
	<tr>
	   <td align=center bgcolor=white>제 목</td>
	   <td  colspan=3 bgcolor=ffffff>&nbsp;<input type="text" size=40 name="title" value="<%="[답변] "+b_title%>"></td>
	</tr>	
	<tr>
	   <td align=center bgcolor=white>내 용</td>
	   <td  colspan=3 bgcolor=ffffff>
           <table class="table">
		      <tr>
		        <td><textarea cols=58 rows=15 name="body"><%=b_content%></textarea></td>
		      </tr>
		   </table>
		</td>
	</tr>

	<tr>
	   <td colspan=4 align=right height=25>
		   <a href="javascript:go_reply()"><img src="img/b_reply.gif" border=0></a>
		   <a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
	   	</td>
    </TR>
</form>
    </TD>
	</TR>
</TABLE>
</div>
		<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>
