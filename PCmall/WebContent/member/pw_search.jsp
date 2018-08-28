<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=utf-8" %>
<%
	try{
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		String user_id="", user_ssn="";
		String mem_uid = request.getParameter("user_id"); 
		String mem_psn = request.getParameter("user_ssn");
		String sql = "select m_uid, m_pwd, m_name from member where m_uid ='" + mem_uid +"'"; 
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		if(rs.next()) {
			
			user_id = rs.getString(1);
			user_ssn = rs.getString(2);
			System.out.println("@@@@@@@@ ID 조회확인 ");
			
		} else{
			
			System.out.println("!!!!!!!!! ID 없으니 회원가입");
 %>

			<script language="JavaScript"> 
				alert("등록되어 있지 않은 아이디입니다.");
				history.go(-1); 
			</script>

 <% }
		
        if(user_id.equals(mem_uid) && user_ssn.equals(mem_psn)) {
			
		    session.setAttribute("pid",user_id);	 //회원아이디
			session.setAttribute("pname",user_ssn);	 //회원 이름
			session.setAttribute("pmember","y"); //회원 인지 아닌지..

            // 어플리케이션 변수 설정. 현재 사용자 체크용

			if( application.getAttribute("activecount") == null){
		
				Integer r1 = new Integer("1");
				application.setAttribute("activecount",r1);

			} else { 

				Integer r2 = (Integer)application.getAttribute("activecount");
			    int s = r2.intValue(); 
				Integer r3 = new Integer(++s);
			   application.setAttribute("activecount",r3);
			}			
			
			System.out.println("########### 로그인 성공! ###########");
%>

			<script>
				alert("로그인 되었습니다.");
				location.href="../main/index.jsp";	 
			</script>
				
<%		 

		 } else if(user_id.equals(mem_uid) && !user_ssn.equals(mem_psn)) {

			 System.out.println("로그인 실패 - 패스워드 오류");
%>

			<script>
				alert("패스워드가 일치하지 않습니다");
				history.go(-1); 
			</script>

<%
		}
		stmt.close();
		rs.close();
		pool.freeConnection("ora8", con); 

	} catch(Exception e) {

		//out.println(e);
		e.getMessage();
	}
%>