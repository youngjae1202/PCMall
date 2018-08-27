<%@ page contentType="text/html;charset=utf-8"
	import="java.sql.*,oracle.dbpool.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" media="screen"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<style>
/* div {
	margin: auto;
} */

table {
	margin: auto;
}
</style>

<div class="container" style="">
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
				<img src="../img/background.jpg"  alt="Los Angeles" class="img-responsive center-block">
			</div>

			<div class="item">
				<img src="../img/background.jpg" alt="Chicago" class="img-responsive center-block">
			</div>

			<div class="item">
				<img src="../img/background.jpg" alt="New york" class="img-responsive center-block">
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
	<table align=center width="100%">
		<div align=center>
			<td bgcolor=white><img src="../img/NewProduct.jpg"
				style="margin-right: auto; display: block;">
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
								ResultSet rs = stmt.executeQuery("select id,name,price,photo from product where id between 49 and 54");
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
	<div align=right>
		<td bgcolor=white><img src="../img/BestProduct.jpg"
			style="margin-right: auto; display: block;">
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
								"select id,name,price,company_id,expression,photo from product where id between 9 and 14");
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
					<table width=155 border=0 cellpadding=1 cellspacing=2 align=center>
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


<!-- 추천상품 -->
<tr>
	<div align=left>
		<td bgcolor=white><img src="../img/RecommendProduct.jpg"
			style="margin-right: auto; display: block;">
	</div>
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
								"select id,name,price,company_id,expression,photo,code from product where category between 34 and 36");
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
									src="../product/image/<%=photo%>" width=100 height=100 border=0></a></td>
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