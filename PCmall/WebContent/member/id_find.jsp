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
          <h2>아이디 찾기</h2>
        </div>
        <div class="col-md-3">
          <div class="login-box well">
        <form role="form" method="post" action="../member/id_search.jsp">
            <div class="form-group">
                <label for="username-number">전화번호</label>
                <input name="sphone"  id="username-number" placeholder="Number" type="text" class="form-control" />
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