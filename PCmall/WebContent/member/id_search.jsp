<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=utf-8" %>
<%@ page import="java.net.URLEncoder" %>
<!-- String url = 
		String.format(URLEncoder.encode(sname, "utf-8")); -->
<%

	try{
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		String sphone="";
		String mem_phone = request.getParameter("sphone"); 
		String sql = "select m_uid from member where m_phone ='" + mem_phone +"'"; 
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		if(rs.next()) {
			
			sphone = rs.getString(1);
			System.out.println("@@@@@@@@ ID 조회확인 ");
			System.out.println(sphone);
%>		
			<script>
			    var sqlStr = "<%=sphone%>";
				alert("ID:" + sqlStr);
				location.href="../member/login.jsp";	 
			</script>
<% 
	
		} else{
			System.out.println("!!!!!!!!! ID 없으니 회원가입");
 %>

			<script language="JavaScript"> 
				alert("등록되어 있지 않은 아이디입니다.");
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