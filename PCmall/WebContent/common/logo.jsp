<head>
<link href="../css/bootstrap.min.css" rel="stylesheet">
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
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="../main/index.jsp"">Web Mall</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li></li>
							<li class="dropdown open"><a
								href="../service/index_site.jsp" class="dropdown-toggle">사이트맵</a></li>
							<li class="active"><a href="../member/login.jsp">로그인</a></li>
							
							<li><a href="../member/logout.jsp">회원가입</li>
							
						</ul>
					</div>
				</div>
			</nav>

		</div>
	</div>

</body>
