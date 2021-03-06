<%@ page import="java.sql.*,oracle.dbpool.*"
	contentType="text/html;charset=utf-8"%>
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
<%!String b_title, b_content, cdate;
	int b_id, b_hit = 0;%>

<%
	try {

		//DB풀 메니저 객체 생성 사용
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");

		String bid = request.getParameter("idnum");

		Statement stmt = con.createStatement();
		stmt.executeUpdate("update notice set hits=hits+1 where b_id=" + bid + ""); //조회수를 올린다

		String sql = "select idnum,title,body,cdate,hits from notice where idnum= "
				+ bid;

		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			b_id = rs.getInt(1);
			b_title = rs.getString(2);
			b_content = rs.getString(3);
			cdate = rs.getString(4);
			b_hit = rs.getInt(5) + 1;
		
		}
		rs.close();

		stmt.close();

		pool.freeConnection("ora8", con);
	} catch (Exception e) {
		out.println(e);
	}
%>

<html>
<head>
<title>WEB MALL</title>
<link href="../common/u3.css" type=text/css rel=stylesheet>
<script>
	function go_update() {
		document.update_form.submit();
	}
</script>
</head>

<BODY>
	<jsp:include page="../common/basic_screen.jsp" flush="true" />

	<br>

<div class="table-responsive" >
		<table class="table" border=1 width=550 height=30 bordercolor=black>
			<tr>
				<td align=center bgcolor=black><font size=3 color=#FFFFFF><b>게시물 수정</b></td>
			</tr>
		</table>
		<br>
		<table class="table" width="550" border="1" cellspacing="0" cellpadding="0">
			<form method="post" name="update_form" action="../shoppingmall/gongji_update.jsp">
				<tr class="term">
					<td width=120 align=center bgcolor=white>등록일</td>
					<td width=170 bgcolor=ffffff>&nbsp;<%=cdate%></td>
				</tr>
				<tr class="term">
					<td width=120 align=center bgcolor=white>제 목</td>
					<td colspan=3 bgcolor=ffffff>&nbsp;<input type="text" size=50
						name="title" value="<%=b_title%>"></td>
				</tr>
				<tr class="term">
					<td width=120 align=center bgcolor=white>내 용</td>
					<td width=440 colspan=3 bgcolor=ffffff>
						<table class="table">
							<tr>
								<td><textarea cols=58 rows=15 name="content"><%=b_content%></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td colspan=4 align=right height=25><a
						href="javascript:go_update()"><img src="../board/img/b_edit.gif"
							border=0></a> <a href="javascript:history.go(-1)"><img
							src="../board/img/b_cancel.gif" border=0></a></td>
				</tr>

				<input type="hidden" name="b_id" value="<%=b_id%>">
			</form>
		</table>
	</div>

	<jsp:include page="../common/basic_copyright.jsp" flush="true" />
</body>
</html>
