<%@ page contentType="text/html;charset=utf-8" 
         import="java.sql.*,oracle.dbpool.*"
         errorPage="error.jsp" %>
<%          
	String mem_uid = session.getAttribute("pid").toString();
  
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");

	String mem_name, mem_ssn, mem_pwd, mem_zip, mem_address;
	String mem_phone, mem_email, mem_job;

	try {
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select m_name, m_ssn, m_pwd, m_zip, m_address, m_phone, m_email, NVL(m_job,0) from member where m_uid='"+ mem_uid +"'");

		if(rs.next()) {
			mem_name    = rs.getString(1);
			mem_ssn     = rs.getString(2);	
			mem_pwd     = rs.getString(3);	
			mem_zip     = rs.getString(4);
			mem_address = rs.getString(5);	
			mem_phone   = rs.getString(6);	
			mem_email   = rs.getString(7);	
			mem_job     = rs.getString(8);
%>

<HTML>
	<HEAD>
		<TITLE>회원정보수정화면</TITLE>
   
	<script language="JavaScript">
		function checkInput() {
		 	if(document.mform.pwd.value == "") {
				alert("비밀번호를 입력하세요");
				return;
			}
		
		 	document.mform.submit();
		}   
	</script>
		</HEAD>

<BODY>
	<div>
	  <table width=660 height=30 align=center >
      <tr>
         <td align="center"><font size=3 color=gray><b>회원정보 수정</b></td>
      </tr>
   </table>

<form name=mform method=post action="update.jsp" >
	<table width=660 align=center>       
		<tr>
      		<td algin=center>기본정보</td>
      	</tr>
		<tr>
			<td bgcolor=#F7F7F7>&nbsp;회원 id</td>
			<td bgcolor=white><input type=text name=uid size=12 maxlength=16 value="<%=mem_uid%>" readonly style="width:120">
			</td>
			
		</tr>
		<tr>
			<td bgcolor=#F7F7F7>&nbsp;비밀번호<font color=red>&nbsp;*</font></td>
				<td bgcolor=white><input type=password name=pwd size=8 maxlength=12 style="width:80" value="<%=mem_pwd%>"></td>
		</tr>
		<tr>
			<td bgcolor=#F7F7F7>&nbsp;비밀번호확인<font color=red>&nbsp;*</font></td>
			<td bgcolor=white><input type=password name=repwd size=8 maxlength=12 value="<%=mem_pwd%>" style="width:80">&nbsp;비밀번호를 한번 더 입력해 주세요. </td>
		</tr>
		<tr>
			<td  bgcolor=#F7F7F7>&nbsp;회원 성명</td>
			<td bgcolor=white><input type=text name="name" size=20 maxlength=20 value="<%=mem_name%>"></td>
		</tr>
		<tr>
			<td bgcolor=#F7F7F7>&nbsp;주민등록번호</td>
			<td bgcolor=white><input type=text name=ssn size=13 maxlength=13 value="<%=mem_ssn%>"readonly></td>
			</tr>
		<tr>
      		<td algin=center>추가 정보</td>
      	</tr>
      	<tr>
			<td bgcolor=#F7F7F7>&nbsp;지역<font color=red>&nbsp;*</font></td>
			<td bgcolor=white>
			  <select name=job class="formbox">
				<option value="0"       <% if(mem_job.equals("0"))    { %> selected <%}%>> 선택하세요 ---
				<option value="서울시"    <% if(mem_job.equals("서울시"))  { %>selected<%}%>>서울시
				<option value="경기도"    <% if(mem_job.equals("경기도"))  { %>selected<%}%>>경기도
				<option value="충정도"  <% if(mem_job.equals("충정도")){ %>selected<%}%>>충정도
				<option value="경상도"  <% if(mem_job.equals("경상도")){ %>selected<%}%>>경상도
				<option value="전라도"  <% if(mem_job.equals("전라도")){ %>selected<%}%>>전라도
 				<option value="제주도"  <% if(mem_job.equals("제주도")){ %>selected<%}%>>제주도
				<option value="기타"    <% if(mem_job.equals("기타"))  { %>selected<%}%>>기타
	 		  </select>
			</td>
		</tr>
		<tr>
			<td bgcolor=#F7F7F7>&nbsp;우편번호<font color=red>&nbsp;*</font></td>
			<td bgcolor=white colspan=2><input type=text name=zip size=7 maxlength=7 value="<%=mem_zip==null?"":mem_zip%>"></td>
		</tr>
		<tr>
			<td bgcolor=#F7F7F7>&nbsp;주소<font color=red>&nbsp;*</font></td>
			<td bgcolor=white><input type=text name=addr size=50 maxlength=100 value="<%=mem_address==null?"":mem_address%>"></td>
		</tr>
		<tr>
			<td bgcolor=#F7F7F7>&nbsp;전화번호<font color=red>&nbsp;*</font></td>
			<td bgcolor=white><input type=text name=tel size=12 maxlength=12 value="<%=mem_phone%>"></td>
		</tr>
		<tr>
			<td bgcolor=#F7F7F7>&nbsp;e-mail<font color=red>&nbsp;*</font></td>
			<td bgcolor=white valign=middle><input type=text name=email size=30 maxlength=30 value="<%=mem_email%>"></td>
		</tr>
		
		<tr bgcolor=#F7F7F7>
			<td colspan=4>&nbsp;<font color=red>*</font> 표시만 수정할 수 있습니다&nbsp;&nbsp;
				<input type="button" name="modify" value="수 정" OnClick="checkInput()"></td>
		</tr>
	</table> 
</form>
</div>

<% 
	} 
	rs.close();
	stmt.close();
	pool.freeConnection("ora8", con); 
	} catch (Exception e)	{
		pool.freeConnection("ora8", con); 
	}
%>	
</BODY>
</HTML>    