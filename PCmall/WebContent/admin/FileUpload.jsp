<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
  table{
  	width : 1150;
  }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>WebMall</title>

</head>
<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
	<jsp:include page="../common/basic_screen.jsp" flush="true" />




	<div class="table-responsive" >
		<table class="table" border=1 width=550 height=30 bordercolor=black>
			<tr>
				<td align=center bgcolor=black><font size=3 color=#FFFFFF><b>제품 업로드</b></font></td>
			</tr>
		</table>
	</div>

		<table class="table" width="550" border="1" cellspacing="0" cellpadding="0">

	<form action="product_insert.jsp" method="post" enctype="multipart/form-data">
				<tr>
					<td width=120 align=center bgcolor=white>코드</td>
					<td width=170 bgcolor=ffffff><select name=combo>
							<option value="1" >자켓</option>
							<option value="2">가디건</option>
							<option value="3">코트</option>
							<option value="4">반팔 티셔츠</option>
							<option value="5">긴팔 티셔츠</option>
							<option value="6">속옷 티셔츠</option>
							<option value="7">정장 셔츠</option>
							<option value="8">캐주얼 셔츠</option>
							<option value="9">파자마 셔츠</option>
							<option value="10">스판 바지</option>
							<option value="11">청바지</option>
							<option value="12">슬랙스</option>
							<option value="13">워커</option>
							<option value="14">로퍼</option>
							<option value="15">스니커즈</option>
							<option value="16">모자</option>
							<option value="17">악세사리</option>
							<option value="18">벨트</option>
					</select></td>


				</tr>

				<tr>
					<td width=120 align=center bgcolor=white>제품명</td>
					<td width=170 bgcolor=ffffff><input type="text" name="name"></td>
				</tr>

				<tr>
					<td width=120 align=center bgcolor=white>가격</td>
					<td width=170 bgcolor=ffffff><input colspan=3 type="text" name="price"></td>
				</tr>
				<br />

				<tr>
					<td width=120 align=center bgcolor=white>회사명</td>
					<td><input colspan=3 type="text" name="company"></td>
				</tr>
				<br />


				<tr>
					<td width=120 align=center bgcolor=white>제품 설명</td>
					<td><textarea colspan=3 name="expression" cols=60 rows=15></textarea></td>
				</tr>
				<br />

				<tr>
					<td width=120 align=center bgcolor=white>제품 사진 파일</td>
					<td><input colspan=3 type="file" name="upload_file"></td>
				<tr>
				<tr>
					<td><input colspan=2 type="submit" value="보내기"></td>
					<td><input colspan=2 type="reset" value="취소"></td>
				</tr>


	</form>
	</table>
		<jsp:include page="../common/basic_copyright.jsp" flush="true" />
	
</body>
</html>