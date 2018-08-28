<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page  import="java.sql.*,oracle.dbpool.*,java.util.*" contentType="text/html;charset=utf-8" %>
<%@ page import="myutil.MultiPart"%>
<%@ page import="java.net.URLEncoder"%>


<%


try {

    //DB풀 메니저 객체 생성 사용
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	
	MultiPart multiPart = new MultiPart(request);

	//Upload.jsp의 값을 받아옴
	int code = Integer.parseInt(multiPart.getParameter("combo"));
	String name = multiPart.getParameter("name");
	int price = Integer.parseInt(multiPart.getParameter("price"));
	String company_id = multiPart.getParameter("company");
	String expression = multiPart.getParameter("expression");
	//파일명 이름 받기
	String photo = multiPart.getFileName("upload_file");  
	String newPath = application.getRealPath("/product/image/files/" + photo);
	multiPart.saveFile("upload_file", newPath);
	
	//쿼리에 '가 들어가면 에러가 발생하므로 replace 처리해준다.
	name = Replace(name,"'","''");
	expression = Replace(expression,"'","''");
	photo = Replace(photo,"'","''");
	
	
	/* //마지막 컬럼의 행을 불러옴
	int sqlCount = 0;
	int count = 0;
	String sql = "select count(id) from product";
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()) {
		sqlCount = rs.getInt(1);
	} else {
		System.out.println("데이터 값이 없습니다");
	}
	//id의 컬럼값의 다음 숫자
	count = sqlCount + 1; */
	
	
	//제품 코드값 받아옴
	int p_code = 0;
	int p_codeSet = 0;
	String sql = "select code from(select * from product where category=" + code + " ORDER BY code DESC) where ROWNUM = 1";
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()) {
		p_code = rs.getInt(1);
	} else {
		System.out.println("코드 값이 없습니다");
	}
	p_codeSet = p_code +1;
	
	
	
	sql = "insert into product (id, category, code, name, price,  company_id, expression, photo,cdate)values(NO_SEQ.NEXTVAL,?,?,?,?,?,?,?,sysdate)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	//pstmt.setInt(1,count);
    pstmt.setInt(1,code);
    pstmt.setInt(2, p_codeSet);
    pstmt.setString(3, name);
    pstmt.setInt(4, price);
    pstmt.setString(5, company_id);
    pstmt.setString(6, expression);
    pstmt.setString(7, photo);
    
    
    pstmt.executeUpdate();
	pstmt.close();
	pool.freeConnection("ora8", con); 
	
	
	System.out.println(sql);
%>
	 <script language=javascript>
    location.href="product_list.jsp";
     </script> 
<%

	} catch (Exception e) {
		out.println(e);
	}
%>

<%! 
	
	   // 개행 처리를 위한 메소드 

public static String Replace(String original, String oldString, String newString) {
 	
	for(int index = 0; (index = original.indexOf(oldString, index)) >= 0; index += newString.length())
    	original = original.substring(0, index) + newString + original.substring(index + oldString.length());
        return original;
}	

%>