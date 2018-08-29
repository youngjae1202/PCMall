<%@ page contentType="text/html;charset=utf-8"  %>

<% String user_id= (String) session.getAttribute("pid");%>

<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>

<body>

<%-- <table>
   <tr>
      <td >마이 페이지</td>
   </tr>
</table>
  
<table>
   <tr> 
      <!-- <td>
         <table>
            <tr> 
               <td>쇼핑몰<br>
                  <img src="img/middle_line_01.gif"></td>
            </tr>                           
            <tr>
               <td><a href="../shoppingmall/gongi.jsp">&nbsp;공지사항</a></td>
            </tr>
             <tr>
               <td><a href="../shoppingmall/newproduct.jsp">&nbsp;신상품 코너</a></td>
            </tr>
            <tr>
               <td><a href="../shoppingmall/pc_calculation.jsp"> &nbsp;조립PC견적</a></td>
            </tr>
            <tr>
               <td><a href="../shoppingmall/gongdong.jsp"> &nbsp;공동구매</a></td>
            </tr>
         </table>

      </td> -->
      <td>
         <table>
            <tr> 
               <td>내페이지<br>
                  <img src="img/middle_line_01.gif"></td>
            </tr>
            <tr>
               <td><a href="../member/user.jsp"> &nbsp;회원가입</a></td>
            </tr>
            <tr>
               <td><a href="../member/modify.jsp?user_id=<%=user_id%>"> &nbsp;회원정보수정</a></td>
            </tr>
            <tr>
               <td><a href="../member/delete.jsp?user_id=<%=user_id%>"> &nbsp;회원탈퇴</a></td>
            </tr>
            <tr>
               <td><a href="../product/basket_view.jsp"> &nbsp;장바구니</a></td>
            </tr>
         </table>
      </td>

   <table>
         <tr> 
            <td>
               <table>
                  <tr> 
                     <td>묻고답하기 <img src="img/middle_line_01.gif" border=0 width=200></td>
                  </tr>                           
                  <tr>
                     <td><a href="../board/reply_list.jsp">&nbsp;자유게시판</a></td>
                  </tr>
                  <tr>
                     <td><a href="../service/inform_01.jsp">&nbsp;FAQ</a></td>
                  </tr>
               </table> 
            </td>
            <td>
               <table>
                  <tr> 
                     <td>기 타<br>
                     <img src="img/middle_line_01.gif"></td>
                  </tr>
                  <tr>
                     <td><a href="../member/login_form.jsp">&nbsp;로그인</a></td>
                  </tr>
                  <tr>
                     <td><a href="../service/company_intro.jsp">&nbsp;회사소개</a></td>
                  </tr>
               </table>
            </td>
         </tr>
      </table>
   </tr>
</table> --%>

<h1 align="center">쇼핑몰</h1>
<div class="btn-group btn-group-justified" role="group" aria-label="...">
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default" onclick="location.href='../shoppingmall/gongji.jsp'">공지사항</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default" onclick="location.href='../shoppingmall/newproduct.jsp'">신상품 코너</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default" onclick="location.href='../product/basket_view.jsp'">장바구니</button>
  </div>
</div>
<h1 align="center">회원 관리</h1>
<div class="btn-group btn-group-justified" role="group" aria-label="...">
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default" onclick="location.href='../member/user.jsp'">회원 가입</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default" onclick="location.href='../member/modify.jsp?user_id=<%=user_id%>'">회원 수정</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default" onclick="location.href='../member/delete.jsp?user_id=<%=user_id%>'">회원 탈퇴</button>
  </div>
</div>
<h1 align="center">묻고 답하기</h1>
<div class="btn-group btn-group-justified" role="group" aria-label="...">
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default" onclick="location.href='../board/board_list.jsp'">자유게시판</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default" onclick="location.href='../service/inform_01.jsp'">FAQ</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default" onclick="location.href='../service/company_intro.jsp'">회사소개</button>
  </div>
</div>

</BODY>
</HTML>