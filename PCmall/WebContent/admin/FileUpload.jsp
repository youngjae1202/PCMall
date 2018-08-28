<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

   <div class="table-responsive" border="1" >
   <table class="table" border=1 width=550 height=30 bordercolor=black>
   <tr>
      <td align=center bgcolor=black><font size=3 color=white><b>제품 업로드</b></font></td>
   </tr>
   </table>
   </div>
   
   <form action="product_insert.jsp" method="post" enctype="multipart/form-data">
         <div class="table-responsive" border="1" >
      
      <tr>
      <td>코드</td>
         <td>
         
         <select name=combo>
         <option value="1">자켓</option>
         <option value="2">양말</option>
<!--          <option value="3">신발</option>
         <option value="4">신발</option>
         <option value="5">신발</option>
         <option value="6">신발</option>
         <option value="7">자켓</option>
         <option value="8">양말</option>
         <option value="9">신발</option>
         <option value="10">신발</option>
         <option value="11">신발</option>
         <option value="12">신발</option>
         <option value="13">자켓</option>
         <option value="14">양말</option>
         <option value="15">신발</option>
         <option value="16">신발</option>
         <option value="17">신발</option>
         <option value="18">신발</option> -->
      </select>
         </td>
         <td>제품명</td>
         <td><input type="text" name="name"></td>
         
      </tr>
      <br/>
         
      <tr>
      <td>가격</td>
      <td><input colspan=3 type="text"   name="price"> </td>
      </tr><br/>
      
      <tr>
      <td>회사명</td>
      <td><input colspan=3 type="text"   name="company"></td>
      </tr>
      <br/>
      
      <tr>
      <td>제품 설명</td>
      <td><textarea colspan=3 name="expression" cols=60 rows=15></textarea></td>
      </tr>
      <br/>
      
      <tr>
      <td>제품 사진 파일</td>
      <td><input colspan=3 type="file"   name="upload_file"></td>
      <tr> 
      <input type="submit" value="보내기">
         </div>
      
      
   </form>
</body>
</html>