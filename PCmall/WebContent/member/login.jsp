<%@ page contentType="text/html;charset=utf-8"%>
<HTML>
<HEAD>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<TITLE>로그온폼</TITLE>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="signin.css" rel="stylesheet">
<script src="../js/ie-emulation-modes-warning.js"></script>
<script src="../js/ie10-viewport-bug-workaround.js"></script>
<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
<script language="JavaScript">
	function checkInput() {
		if (document.fname.uid.value == "") {
			alert("ID를 입력하세요");
			document.fname.uid.focus();
			return;
		}

		if (document.fname.pwd.value == "") {
			alert("비밀번호를 입력하세요");
			document.fname.pwd.focus();
			return;
		}

		document.fname.submit();
	}
</script>
</HEAD>

<BODY>
	<jsp:include page="../common/basic_screen.jsp" flush="true" />
	<form class="form-signin" name="fname" method="post"
		action="login_ok.jsp">
		<div class="container">
			<table width="1536" border="1" height="500">
				<div align="center">
					<h2 class="form-signin-heading" color="#ffffff">WebMall</h2>
				</div>
				<label for="inputEmail" class="sr-only"></label>
				<input type="text" name="uid" id="inputEmail" name="uid"
					class="form-control" placeholder="ID"
					onkeypress="if(event.keyCode==13) {checkInput(); return false;}">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" name="pwd" id="inputPassword"
					class="form-control" placeholder="Password"
					onkeypress="if(event.keyCode==13) {checkInput(); return false;}">
				<input class="btn btn-lg btn-primary btn-block" type="button"
					value="Login" OnClick="checkInput();">
				<input class="btn btn-lg btn-primary btn-block" type="reset"
					value="Cancle" OnClick="checkInput();">

			</table>
		</div>
	</form>


	<!--상단테이블과 메뉴테이블 끝-->
	<br>
	<br>
	<form>
		<!--name="fname" method="post" action="login_ok.jsp"  -->
		<table width="1536" cellspacing="0" cellpadding="0" height="100">
				<!-- 		<td bgcolor="#0000ff" height="28">
					<div align="center">
						<font color="#ffffff"><b>회 원 로 그 인</b></font>
					</div>
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td align=center bgcolor="#eff4f8" height="120">
					<table width="250" border="0" cellspacing="0" cellpadding="1">
						<tr>
							<td width="55" nowrap>아이디</td>
							<td width="175"><input type=text name="uid" size="16"
								value="jmkim" maxlength=16 style="width: 155"
								onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
						</tr>
						<tr>
							<td nowrap>비밀번호</td>
							<td><input type=password name="pwd" size="14" maxlength="16"
								value="1234" style="width: 155"
								onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
						</tr>
						<tr height=40 valign=bottom>
							<td></td>
							<td align=center><input type="button" value="로그인"
								OnClick="checkInput();"><input type="reset" value="취 소"></td>
						</tr>
					</table>
				</td>  
			</tr> -->
		</table>
				<div style="text-align: center;">
					<a href="id_find.jsp"><font color="#ff7508">아이디 찾기</font></a>&nbsp;&nbsp;
					<a href="pw_find.jsp"><font color="#ff7508">비밀번호 찾기</font></a>&nbsp;&nbsp;
					<a href="user.jsp"><font color="#ff7508">회원가입</font></a>&nbsp;
				</div>
	</form>
	<jsp:include page="../common/basic_copyright.jsp" flush="true" />
</body>

<!-- login.ok -->
</html>


