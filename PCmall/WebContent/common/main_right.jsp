<%@ page contentType="text/html;charset=utf-8"
	import="java.sql.*,oracle.dbpool.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" media="screen"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<style>
div{
	margin: auto;
}
table{
	margin: auto;
}
</style>

<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="../img/background.jpg" alt="Los Angeles">
			</div>

			<div class="item">
				<img src="../img/background.jpg" alt="Chicago">
			</div>

			<div class="item">
				<img src="../img/background.jpg" alt="New york">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
</div>


<div class=inline>
	<!-- 최신상품 출력  -->
	<table align = center width="100%">
		<div align=center>
			<td bgcolor=white><img src="../img/title_newproduct.gif" style="margin-left: auto; margin-right: auto; display: block;">
		</div>
	</table>

	<table>
		<tr>
			<td width=450>
				<table width=435 border=0 cellpadding=1 cellspacing=1>
					<tr>
						<%
							try {
								String name, company_id, expression, photo;
								int id, price;

								DBConnectionManager pool = DBConnectionManager.getInstance();
								Connection con = pool.getConnection("ora8");
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select id,name,price,photo from product where id between 49 and 51");
								int flag = 0;
								while (rs.next()) {
									id = rs.getInt(1);
									name = rs.getString(2);
									price = rs.getInt(3);
									photo = rs.getString(4);
						%>
						<!-- 표시 테이블  -->
						<td>
							<table width=145 border=0 cellpadding=1 cellspacing=2
								align=center>
								<tr>
									<td colspan=2 align=center><a
										href="../product/product.jsp?i=<%=id%>"> <img
											src="../product/image/<%=photo%>" width=90 height=90 border=0></a></td>
								</tr>
								<tr>
									<td width=145><font color=blue>&nbsp;<a
											href="../product/product.jsp?i=<%=id%>">[<%=name%>]
										</a></font></td>
								</tr>
								<tr>
									<td><c:set var="fmtPrice" value="<%=price%>" /> <font
										color=red>&nbsp;[<fmt:formatNumber value="${fmtPrice }"
												pattern="#,###" />&nbsp;원]
									</font></td>
								</tr>
							</table>
						</td>
						<%
							}
								rs.close();
								stmt.close();
								pool.freeConnection("ora8", con);
							} catch (Exception e) {
								out.println(e);
							}
						%>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<!-- 베스트 상품 -->
<tr>
	<div align=left>
		<td bgcolor=white><img src="../img/title_bestproduct.gif" style="margin-left: auto; margin-right: auto; display: block;">
	</div>
	</td>
</tr>
<tr>
	<td bgcolor=#dddddd><img height=1 src="" width=1></td>
</tr>
<tr>
	<td>
		<table width=450 border=0 cellpadding=1 cellspacing=1>
			<tr>
				<%
					try {
						String name, company_id, expression, photo;
						int id, price;

						DBConnectionManager pool = DBConnectionManager.getInstance();
						Connection con = pool.getConnection("ora8");

						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(
								"select id,name,price,company_id,expression,photo from product where id between 9 and 11");
						int flag = 0;
						while (rs.next()) {
							id = rs.getInt(1);
							name = rs.getString(2);
							price = rs.getInt(3);
							company_id = rs.getString(4);
							expression = rs.getString(5);
							photo = rs.getString(6);
				%>
				<!-- 표시테이블 -->
				<td>
					<table width=145 border=0 cellpadding=1 cellspacing=2 align=center>
						<tr>
							<td colspan=2 align=center valign=top><a
								href="../product/product.jsp?i=<%=id%>"> <img
									src="../product/image/<%=photo%>" width=90 height=90 border=0></a></td>
						</tr>
						<tr>
							<td width=145><font color=blue><a
									href="../product/product.jsp?i=<%=id%>">[<%=name%>]
								</a></font></td>
						</tr>
						<tr>
							<td><c:set var="fmtPrice" value="<%=price%>" /> <font
								color=red>&nbsp;[<fmt:formatNumber value="${fmtPrice }"
										pattern="#,###" />&nbsp;원]
							</font></td>
						</tr>
					</table>
				</td>
				<%
					}
						rs.close();
						stmt.close();
						pool.freeConnection("ora8", con);
					} catch (Exception e) {
						out.println(e);
					}
				%>
			</tr>
		</table>
	</td>
</tr>

<%-- <!--  최신 qna  -->
	<tr>
		<td>
			<script language="javascript">
				function readContents(articlenum){
					location.href ="../board/qnashow.jsp?qnaid="+articlenum;
				}
			</script>
<%
	try {
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");

		Statement stmt=null;
		Statement stmt1=null;
		ResultSet rs=null;
		ResultSet rs1=null;
		stmt1=con.createStatement();
		rs1=stmt1.executeQuery("select qnaid,title,name,to_char(cdate,'yy-mm-dd') from qna where type='I' order by 1 desc" );
%>		
		<table border=0  cellpadding=0 cellspacing=0>
			<tr><div align=left>
				<td bgcolor=white><img src="../img/title_qna.gif"></div></td>
				<td colspan=2 align=right><a href="../board/qnashow.jsp?qnaid=1"><font color=blue>More...&nbsp;&nbsp;&nbsp;</font></a></b></td>
			</tr>
			<tr>
				<td colspan=3 bgcolor=#dddddd></td>
			</tr>
<%
			int stop=0;	
			while(rs1.next() && (stop<5)) { 
%>
			<tr height=21>
				<td align=left>&nbsp;<img src="../img/que.gif"> 
				<a href="javascript:readContents('<%=rs1.getInt(1)%>')"><%=rs1.getString(2)%></a></td>
				<td align=center><%=rs1.getString(3)%></td>
				<td align=center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs1.getString(4)%></td>
			</tr>
<%	
		stmt=con.createStatement();
		rs=stmt.executeQuery("select qnaid,title,name,to_char(cdate,'yy-mm-dd') from qna where type='R' and p_id ="+rs1.getInt(1)+" order by 1 desc" );
		while(rs.next()) { 
%>
			<tr height=21>
				<td align=left><img src="../img/answ.gif">
				<a href="javascript:readContents('<%=rs.getInt(1)%>')"><%=rs.getString(2)%></a></td>
				<td align=center><%=rs.getString(3)%></td>
				<td align=center><%=rs.getString(4)%></td>
			</tr>
<%
			stop++;
		}
		stop++;
	}
		stmt.close();
        rs.close(); 
		stmt1.close();
		rs1.close();
	   pool.freeConnection("ora8", con); 
	} catch (Exception e) {
		out.println(e);
	}
%>
			</table>
		</td>
	</tr>
</table>
</td>
 --%>
<!-- 추천상품 -->
<tr>
	<div align=left>
		<td bgcolor=white><img src="../img/title_hitproduct.gif" style="margin-left: auto; margin-right: auto; display: block;">
	</div>
	</td>
</tr>
<tr>
	<td bgcolor=#dddddd><img height=1 src="" width=1></td>
</tr>
<tr>
	<td>
		<table width=450 border=0 cellpadding=1 cellspacing=1>
			<tr>
				<%
					try {
						String name, company_id, expression, photo, code;
						int id, price;
						DBConnectionManager pool = DBConnectionManager.getInstance();
						Connection con = pool.getConnection("ora8");

						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(
								"select id,name,price,company_id,expression,photo,code from product where category between 34 and 35");
						while (rs.next()) {
							id = rs.getInt(1);
							name = rs.getString(2);
							price = rs.getInt(3);
							company_id = rs.getString(4);
							expression = rs.getString(5);
							photo = rs.getString(6);
							code = rs.getString(7);
				%>

				<!-- 상품  테이블 표시-->
			<td>
					<table width=145 border=0 cellpadding=1 cellspacing=2 align=center>
						<tr>
							<td colspan=2 align=center valign=top><a
								href="../product/product.jsp?i=<%=id%>"> <img
									src="../product/image/<%=photo%>" width=90 height=90 border=0></a></td>
						</tr>
						<tr>
							<td width=145><font color=blue><a
									href="../product/product.jsp?i=<%=id%>">[<%=name%>]
								</a></font></td>
						</tr>
						<tr>
							<td><c:set var="fmtPrice" value="<%=price%>" /> <font
								color=red>&nbsp;[<fmt:formatNumber value="${fmtPrice }"
										pattern="#,###" />&nbsp;원]
							</font></td>
						</tr>
					</table>
				</td>
				<%
					}
						rs.close();
						stmt.close();
						pool.freeConnection("ora8", con);
					} catch (Exception e) {
						out.println(e);
					}
				%>