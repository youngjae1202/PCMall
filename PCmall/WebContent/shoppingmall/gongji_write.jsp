<%@ page  import="java.sql.*,oracle.dbpool.*,java.util.*" contentType="text/html;charset=utf-8" %>
<%@page import="org.apache.log4j.*"%>
<%!
 static Logger logger = Logger.getLogger("write.jsp"); //log4j를 위해 
%>
<%
 logger.info("여기 있쯤!");
%>


<%
try {

   //DB풀 메니저 객체 생성 사용
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");
	
	int b_id=0;
	String b_title=makeKOR(request.getParameter("b_title"));
	String b_content=makeKOR(request.getParameter("b_content"));
	
	//쿼리에 '가 들어가면 에러가 발생하므로 replace 처리해준다.
 	b_title = Replace(b_title,"'","''");
 	b_content = Replace(b_content,"'","''");
 	logger.info("여기 있쯤!!");
	/* 답변형에서 추가된 부분 */
	int maxref=0;  //DB 안에 들어 있는 가장 큰 글 그룹번호
    logger.info("여기 있쯤!!!");
    String sql = "select max(idnum) from notice";
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()) {
		b_id=rs.getInt(1); 
		b_id=b_id+1;    
		rs.close();
	} else {
		b_id=1;   
	}
	logger.info("여기 있쯤!!!!");
	
	
	sql = "insert into notice (idnum,title,body,hits,cdate )values(?,?,?,?,sysdate)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,b_id);
	pstmt.setString(2,b_title);
	pstmt.setString(3,b_content);
    pstmt.setInt(4,0);

	pstmt.executeUpdate();
	pstmt.close();
	pool.freeConnection("ora8", con);
	logger.info("여기 있쯤!!!!!");
%>
	 <script language=javascript>
    location.href="../shoppingmall/gongji.jsp";
     </script> 
<%

	} catch (Exception e) {
		out.println(e);
	}
%>

<%! 
   String makeKOR(String str)throws java.io.UnsupportedEncodingException{
   String kor="";
   if (str==null) 
    kor=null;
   else
    kor=new String(str.getBytes("ISO-8859-1"),"utf-8");
   return kor;
   }
	
	   // 개행 처리를 위한 메소드 

public static String Replace(String original, String oldString, String newString) {
 	for(int index = 0; (index = original.indexOf(oldString, index)) >= 0; index += newString.length())
    	original = original.substring(0, index) + newString + original.substring(index + oldString.length());
        return original;
}	

%>