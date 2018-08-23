<%@ page contentType="text/html;charset=utf-8" import="java.sql.*,oracle.dbpool.*"  %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/ie-emulation-modes-warning.js"></script>
<script src="../js/ie10-viewport-bug-workaround.js"></script>
<style>
  table {
    width: 90%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
	margin-left: auto; 
	margin-right: auto;
 }
  th, td {
  
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>

<HTML>
	<HEAD><TITLE>컴퓨터전문쇼핑몰</TITLE>
	</HEAD>
	<link href="../common/u3.css" type=text/css rel=stylesheet>

<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<form name=board_search method=post>
<br>
<div class="table-responsive" >
<table class="table table-bordered">
		<tr>
			<td align=center bgcolor=white ><font size=3 ><b>자 유 게 시 판</b></font></td>
		</tr>
	</table>
	<br>
	<table border=0 cellspacing=0 cellpadding=0  bordercolor="white">
		<tr bgcolor=black height=21>
			<td width=50 align="center" bgcolor=white><font size="2">번호</font></td>
			<td width=230  align="center" bgcolor=white>제목</td>
			<td width=100 align="center" bgcolor=white>날짜</td>
			<td width=100 align="center" bgcolor=white>글쓴이</td>
			<td width=60 align="center" bgcolor=white>조회수</td>
		</tr>
<%!   
	int pagesize = 20;  // 한페이지당 10개 출력물
	int pageNUM=1;    // 페이지 번호
	int pagecount=1 ; // 페이지 갯수 지정 변수
	int absolutepage=1;  // 절대 위치 페이지 번호
	int dbcount=0 ;   //  DB 안에 글 갯수 저장 변수
%>
<%
	try{ 
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
 
		String  b_name, b_email, b_title, b_content, b_date, mailto;
		int  b_id =0 , b_hit = 0, level=0, color=1 ;

		// DB 행의 수 계산
		Statement stmt = con.createStatement();  
		ResultSet pageset = stmt.executeQuery("select count(b_id) from re_board");
		if( pageset.next()){
			dbcount = pageset.getInt(1); 
			pageset.close();
		}

		//글번호
        int ii = dbcount + 1;

		if(dbcount%pagesize == 0)   
			pagecount = dbcount/(pagesize); // 총 페이지수 구하기
		else
			pagecount = dbcount/(pagesize)+1; // 총 페이지수 구하기

		if(request.getParameter("pageNUM") != null) {
			pageNUM=Integer.parseInt(request.getParameter("pageNUM"));	 //지정된 페이지 보여주기
			absolutepage=(pageNUM-1)*pagesize+1;
			ii = ii - (pageNUM-1)*pagesize;
		}

		String sql = "select b_id, b_name, b_email, b_title, b_content, ";
		sql = sql + " to_char(b_date,'yy-mm-dd'), b_hit, ref, step, anslevel "; 
		sql = sql + " from re_board order by ref desc, step ";
		sql = sql.toUpperCase().trim();
		ResultSet rs = stmt.executeQuery(sql);

		for(int k=1; k<absolutepage; k++)rs.next();
		int k=1;

		while(rs.next() && k<=pagesize){ 
			b_id=rs.getInt(1);			//글번호
			b_name=rs.getString(2);		// 글쓴이
			b_email=rs.getString(3);	//작성자 메일
			b_title=rs.getString(4);	// 글제목
			b_content=rs.getString(5);	//글내용
			b_date=rs.getString(6);		//작성날짜
			b_hit=rs.getInt(7);			// 조회수
			level=rs.getInt(10);		//글 레벨
			if(!b_email.equals("")) {
			mailto="<a href=mailto:"+b_email+">"+b_name+"</a>";
			} else {
				mailto=b_name; 
			}
            ii--;
 %>
		<tr height=22 bgcolor=#ffffff onMouseOver=this.style.backgroundColor='#FAFAFA'  onMouseOut=this.style.backgroundColor='#FFFFFF'>
			<td width=50 align=center><%= ii %></td>
			<td width=230 align="left"><a href='show.jsp?b_id=<%= b_id %>'>
<%			
				if(level>0) { 
					for(int i = 0; i< level; i++){
 %>				&nbsp;
 <%
		        }
 %>
				<img src="img/reply.gif" width="16" height="16"border=0>  	
<% 
                } 
 %> 
             <%=b_title%></a></td>
			 <td width=100 align=center><%=b_date%></td>
			 <td width=100 align=center><%=b_name%></td>
			 <td width=60 align=center><%=b_hit%></td>
		  </tr>
<%
		k++;
		} 

		rs.close();
		stmt.close(); 
		con.close(); 
		pool.freeConnection("ora8", con); 
	} catch (Exception e) {
	out.println(e);
	}
%>

	</table>
	<table width=550 bgcolor=black border=0 cellpadding=0 cellspacing=0 >
		<tr bgcolor=white>
			<td width=10>&nbsp;</td>
			<td width=350  align=center valign=middle height=30>
  
<%		// 페이지 구현부
			 int limit = 4 ;   //페이지 리스트 개수 지정
			 //시작 페이지 구하기
			 int temp =(pageNUM-1) % limit ;
			 int startPage = pageNUM - temp;
			// [이전] 링크 추가하기
			if ((startPage-limit)>0){ %>
				<a margin = auto href='board_list.jsp?pageNUM=<%=startPage-1%>' color=red ><font color=red>[이전]<a></font>
<% 
			}
			 //페이지 번호 나열하기
			for(int i=startPage ; i<(startPage+limit);i++){
				if( i == pageNUM){%>
				<font color=black>&nbsp;<%=i%>&nbsp;</font>
<% 
				} else { 
%>
					<a margin = auto href='board_list.jsp?pageNUM=<%=i%>'><%=i%><a>
<%
					}
				 if(i >= pagecount) break;
			 }
			 //[다음] 링크 추가
			if ((startPage+limit)<=pagecount){ %>
  				<a margin = auto href='board_list.jsp?pageNUM=<%=startPage+limit%>'><font color=red>[다음] <a></font>
<%
			}
%>
			</td>
			<td width=180 height=30 valign=middle align=right>
			<a href="write_form.jsp"><img src="img/m_bt10.gif" border=0 align=absmiddle></a>
			<a href="board_list.jsp"><img src="img/m_bt06.gif" border=0 align=absmiddle></a>
			</td>
			<td width=10>&nbsp;</td>
		</tr>
	</table>
	</div>
</form>
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>
