<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
  <div class="container">
      <div class="row">
        <div class="page-header">
          <h2>비밀 번호 찾기</h2>
        </div>
        <div class="col-md-3">
          <div class="login-box well">
        <form accept-charset="UTF-8" role="form" method="post" action="pw_search.jsp">
            <div class="form-group">
                <label for="username-email">아이디</label>
                <input name="user_id" id="username-email" placeholder="E-mail or Username" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">주민번호</label>
                <input name="user_ssn" id="password" placeholder="Password" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="SEARCH" />
            </div>
        </form>
          </div>
        </div>
      </div>
    </div>
 
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../js/bootstrap.min.js"></script>
  </body>
</html>