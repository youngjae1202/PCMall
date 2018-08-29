<%@ page contentType="text/html;charset=utf-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/ie-emulation-modes-warning.js"></script>
<script src="../js/ie10-viewport-bug-workaround.js"></script>
<%  
	String pid = (String) session.getAttribute("pid"); 
%>


<script language="JavaScript">
<!--
function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>

<body>
	<nav>
		<div class="container">
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="../product/categoryall.jsp?c=23"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="false">아우터 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../product/category.jsp?c=1">자켓</a></li>
							<li><a href="../product/category.jsp?c=2">가디건</a></li>
							<li><a href="../product/category.jsp?c=3">코트</a></li>
						</ul></li>
					<li>
					<li class="dropdown"><a href="../main/index.jsp"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="false">티셔츠 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../product/category.jsp?c=4">반팔</a></li>
							<li><a href="../product/category.jsp?c=5">긴팔</a></li>
							<li><a href="../product/category.jsp?c=6">속옷</a></li>
						</ul></li>
					<li>
					<li class="dropdown"><a href="../main/index.jsp"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="false">셔츠 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../product/category.jsp?c=7">정장셔츠</a></li>
							<li><a href="../product/category.jsp?c=8">캐쥬얼 셔츠</a></li>
							<li><a href="../product/category.jsp?c=9">파자마 셔츠</a></li>
						</ul></li>
					<li class="dropdown"><a href="../main/index.jsp"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="false">바지 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../product/category.jsp?c=10">스판</a></li>
							<li><a href="../product/category.jsp?c=11">청바지</a></li>
							<li><a href="../product/category.jsp?c=12">슬랙스</a></li>
						</ul></li>
					<li class="dropdown"><a href="../main/index.jsp"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="false">신발 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../product/category.jsp?c=13">워커</a></li>
							<li><a href="../product/category.jsp?c=14">로퍼</a></li>
							<li><a href="../product/category.jsp?c=15">스니커즈</a></li>
						</ul></li>
					<li class="dropdown"><a href="../main/index.jsp"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="false">ACC <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../product/category.jsp?c=16">모자</a></li>
							<li><a href="../product/category.jsp?c=17">악세사리</a></li>
							<li><a href="../product/category.jsp?c=18">벨트</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">고객센터<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../product/basket_view.jsp?user_id=<%=pid %>">장바구니</a></li>
							<li><a href="../board/board_list.jsp">게시판</a></li>
							<li><a href="../service/index_site.jsp">마이페이지</a></li>
						</ul></li>
				</ul>


				<!-- <tr> 
             <form name="search_form" action="../common/search_view.jsp" method=post>
	         <td height=20 width=125 align=center>  
                   <input type="text" name="srch_word" size=14>
                   <input type="image" border=0 src="../img/s.gif"></td>
             </form>
          </tr> -->


				<form class="navbar-form navbar-left" name="search_form"
					role="search" action="../common/search_view.jsp" method=post>
					<div class="form-group">
						<input type="text" name="srch_word" class="form-control"
							placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>


				<ul class="nav navbar-nav navbar-right">

				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<%-- <div align=left>
<table width=780  border=0 cellspacing=0 cellpadding=0 height=39>
<tbody valign="top" align="left" bgcolor="#eeeeee">
  <tr valign="middle" align="right" height="19">
    <td width=50 height=24></td>

	<td width=95 height=24><a href="../service/company_intro.jsp" onMouseOver="document.images[2].src='../img/bar_22.gif';;MM_showHideLayers('shop','','hide','member','','hide','qna','','hide')" onMouseOut="document.images[2].src='../img/bar_2.gif';">
   <img src="../img/bar_2.gif" width=95 height=24></a></td>

    <td width=95 height=24 border=0><a src="../img/bar_3.gif"   onMouseOver="document.images[3].src='../img/bar_33.gif';MM_showHideLayers('shop','','show','member','','hide','qna','','hide')" onMouseOut="document.images[3].src='../img/bar_3.gif';"><img name="Image1" border=2 src="../img/bar_3.gif" width=95 height=24></a></td>

   <td width=95 height=24><a href="../product/basket_view.jsp?user_id=<%=pid %>" onMouseOver="document.images[4].src='../img/bar_44.gif';MM_showHideLayers('shop','','hide','member','','hide','qna','','hide')" onMouseOut="document.images[4].src='../img/bar_4.gif';"><img src="../img/bar_4.gif" width=95 height=24></a></td>
   
   <td width=95 height=24><a src="../img/bar_5.gif" onMouseOver="document.images[5].src='../img/bar_55.gif';MM_showHideLayers('shop','','hide','member','','show','qna','','hide')" onMouseOut="document.images[5].src='../img/bar_5.gif';"><img name="Image2"  border=2  src="../img/bar_5.gif" width=95 height=24></a></td>  
 
 	<td width=95 height=24><a href="../member/user.jsp" onMouseOver="document.images[6].src='../img/bar_66.gif';MM_showHideLayers('shop','','hide','member','','hide','qna','','hide');" onMouseOut="document.images[6].src='../img/bar_6.gif';">
   <img src="../img/bar_6.gif" width=95 height=24></a></td>

	<td width=95 height=24><a src="../img/bar_7.gif"  onMouseOver="document.images[7].src='../img/bar_77.gif';MM_showHideLayers('shop','','hide','member','','hide','qna','','show')" onMouseOut="document.images[7].src='../img/bar_7.gif';"><img name="Image3"  border=2   src="../img/bar_7.gif" width=95 height=24></a></td>

	<td width=30 height=24 border=0></td>

<tr height=25 > 
    <td colspan=5 bgcolor="#eaeaea">&nbsp; </td>
</tr>
</tbody>
</table>

<div id="shop" style="position:absolute; left:240px; top:100px; width:311px; height:20px; z-index:100; visibility: hidden" class="layerstyle"> 
  <table width=250 border=0 cellspacing=0 cellpadding=0 height=20>    
	<tr> 
      <td width=80 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center> &nbsp;<span class="layerstyle"><a href="../shoppingmall/gongi.jsp">공지사항</a></span> </div>
      </td>
      <td width=90 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center><span class="layerstyle"><a href="../shoppingmall/newproduct.jsp">신상품 코너</a></span> </div>
      </td>
      <td width=90 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center><span class="layerstyle"><a href="../shoppingmall/pc_calculation.jsp">조립 PC 견적</a></span> </div>
      </td>
    </tr>
  </table>
</div>

<div id="member" style="position:absolute; left:420px; top:99px; width:160px; height:20px; z-index:100; visibility: hidden"> 
  <table width=180 border=0 cellspacing=2 cellpadding=0 height=20>
    <tr> 
      <td width=100 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center class="layerstyle"><a href="../member/modify.jsp?user_id=<%= pid %>">회원정보수정</a></div>
      </td>
      <td width=80 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center class="layerstyle"><a href="../member/user_delete.jsp?user_id=<%= pid %>">회원 탈퇴</a></div>
      </td>
    </tr>
  </table>
</div>

<div id="qna" style="position:absolute; left:600px; top:99px; width:150px; height:40px; z-index:100; visibility: hidden"> 
  <table width=300 border=0 cellspacing=2 cellpadding=0 height=20>
    <tr bgcolor="#EAEAEA">        
      <td width=200 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
	<div align=center><span class="layerstyle"><a href="../board/member_board_list.jsp">회원게시판</a></span> </div>
      </td>
       <td width=200 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
	<div align=center><span class="layerstyle"><a href="../board/board_list.jsp">자유게시판</a></span> </div>
      </td>
      <td width=130 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center class="layerstyle"><a href="../service/inform_01.jsp">F A Q</a></div>
      </td>
    </tr>
  </table>
</div> --%>