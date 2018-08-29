
<%@ page contentType="text/html; charset=utf-8"%>
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
<html>
	<head><title>WebMall</title>
		<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
	
	<script>
	function writeCheck() {
		if(!document.bbs_form.b_title.value){
			alert("제목을 입력하세요.");
			document.bbs_form.b_title.focus();
			return ;
		}
	
		if(!document.bbs_form.pwd.value) {
			alert("비밀번호를 입력하세요.");
			document.bbs_form.pwd.focus();
			return ;
		}

		if(!document.bbs_form.b_name.value){
			alert("이름을 입력하세요");
			document.bbs_form.b_name.focus();
			return ;
		}

		if(!document.bbs_form.b_content.value){
			alert("내용을 입력하세요.");
			document.bbs_form.b_content.focus();
			return;
		}
		document.bbs_form.submit();
	}
	</script>
	</head>

<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<br>
<form name=bbs_form method=post action="write.jsp">
<div class="table-responsive">
	
	  <table class="table" border=1 width=550 height=30 bordercolor=black>
		<tr>
			<td align=center bgcolor=black><font size=3 color=white><b>게시물 올리기</b></td>
		</tr>
	  </table>
	  <br>
<table class="table" width="550" border="2" cellspacing="0" cellpadding="0">
	<tr>
	  <td width=120 align=center bgcolor=white>등록자</td>
	   <td width=170 bgcolor=white>&nbsp;<input class=box type="text" name="b_name" size=20 value=""></td>
	   <td width=100 align=center bgcolor=white>비밀번호</td>
	   <td width=160 bgcolor=white>&nbsp;<input class=box type="password" name="pwd" size=15 value=""></td>
	</tr>	
	
	<tr>
	   <td width=120 align=center bgcolor=white>e-mail</td>
	   <td  colspan=3 bgcolor=white>&nbsp;
	   <input type="text" name="b_email" size=30></td>
	</tr>	
	
	<tr>
	   <td align=center bgcolor=white>제 목</td>
	   <td colspan=3>&nbsp;<input type="text" name="b_title" size=40></td>
	</tr>	
	   <td align=center bgcolor=white>내 용</td>
	   <td colspan=3>
  
   <table class="table">
      <tr>
         <td><textarea cols=60 rows=15 name="b_content"></textarea></td>
      </tr>
   </table>
   
	  <tr>
	   	<td colspan=4 align=right height=25>
		  <a href="javascript:writeCheck()"><img src="img/b_save.gif" border=0></a>
		  <a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
	   	</td>
	  </TR>

</TABLE>
</div>
</form>

			<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
	</body>
	</html>
