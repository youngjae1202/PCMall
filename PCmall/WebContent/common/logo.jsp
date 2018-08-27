<head>
<link rel="icon" href="../favicon.ico">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="non-responsive.css" rel="stylesheet">
<script src="../js/ie10-viewport-bug-workaround.js"></script>
</head>
<%@ page contentType="text/html;charset=utf-8"%>

<%
	String pid = (String) session.getAttribute("pid");
	String pname = (String) session.getAttribute("pname");
%>

<body>
	<div class="navbar-wrapper">
	<div class="container">
	<nav class="navbar navbar-inverse navbar-static-top">
	<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span> 
			<spanclass="icon-bar"></span> 
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="../main/index.jsp">Web Mall</a>
	</div>
	<div id="navbar" class="navbar-collapse collapse">
	<ul class="nav navbar-nav">
		<table name="top_table">
			<li>
			<li> 
<%
         if( session.getAttribute("pid") != null) {
%>         <%// page로그인하면 로그아웃이 보이고 로그아웃하면 로그인이 나오게하는 액션부분 %>
         <a href="../member/logout.jsp" class=line>로그아웃</a>
<%
         }  else {
%>
		<li class="active"><a href="../member/login.jsp" class=line>로그인</a></li>
<%
         }
%>
      </li>
      <li> <a href="../member/user.jsp"">회원가입</a></li>
   </li>
   
</table>
							
						</ul>
					</div>
				</div>
			</nav>

		</div>
	</div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>


