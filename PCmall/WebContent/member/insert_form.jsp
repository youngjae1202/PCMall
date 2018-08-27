<%@ page contentType="text/html;charset=utf-8" %>
<HTML>
   <HEAD>
      <TITLE> 신규회원 가입화면</TITLE>
   </HEAD>
<script language="JavaScript">
   var msg;
   function form_check()   
   {
      
      var form = document.form_name;
      msg = "== 가입시 오류 사항 ==\n\n";
      
      if(form.name.value=="")
         msg += "회원 성명을 입력하세요.\n\n";
      
      if(form.uid.value=="")
         msg += "회원ID를 입력하세요.\n\n";
      
      else if(form.uid.value.length < 5)
         msg += "회원ID는 5자 이상 입력하셔야 합니다.\n\n";
      
      else if(!a_or_d(form.uid.value))
         msg += "회원ID는 영문이나 숫자로 입력하셔야 합니다.\n\n";
      
      if(form.pwd.value=="")
         msg += "비밀번호를 입력하세요.\n\n";
       
      else if(form.pwd.value.length < 5)
         msg += "비밀번호는 4자 이상 입력하셔야 합니다.\n\n";
      
      else if(!a_or_d(form.pwd.value))
         msg += "비밀번호는 영문이나 숫자로 입력하셔야 합니다.\n\n";
      
      if(form.pwd.value != form.repwd.value)
         msg += "비밀번호와 비밀번호확인의 값이 서로 같지 않습니다.\n\n";
      
      if(form.ssn1.value == "")
         msg += "주민등록번호를 입력하세요.\n\n";
   
      if(msg == "== 가입시 오류 사항 ==\n\n") { 
         form.submit();
      } else {
         alert(msg);
         return;
      }
   }

   // 숫자와 영문 입력 체크
   function a_or_d(str) {
      lower_str = str.toLowerCase();
      for(i=0; i<lower_str.length; i++) {
         ch = lower_str.charAt(i);
         if(((ch < 'a') || (ch > 'z')) && ((ch < '0') ||(ch > '9')))
            return 0;
      }
      return 1;
   }

   // ID 공백 체크
   function openuid_check() {
       if (document.form_name.uid.value == "") {
          alert("아이디를 입력하세요");
         return;
       }
       url = "id_check.jsp?uid=" + 
      document.form_name.uid.value ;
      open(url, "id_repeat_check", "width=300, height=220");
   }
</script>
     
<BODY>
   <br>
   <div>
   <table width=660 height=30 align=center >
      <tr>
         <td align="center"><font size=3 color=gray><b>WEB MALL</b></td>
      </tr>
   </table>
   <form name=form_name method=post action="insert.jsp">
   <table cellpadding=3 cellspacing=0 width=660 valign=top align=center>
      <tr>
      <td algin=center>기본정보</td>
      </tr>
      <tr>
         <td bgcolor=#F7F7F7>회원 id<font color=red> *</font></td>
         <td bgcolor=white >
            <input type=text name=uid size=10 maxlength=16 placeholder="ID" >
            <input type="button" name="id_chk" value="ID중복 체크"  OnClick="openuid_check(document.form_name.uid.value)">
        &nbsp;   중복체크 필수</td>
      </tr>
      <tr>
         <td bgcolor=#F7F7F7> 비밀번호<font color=red> *</font></td>
         <td bgcolor=white>
            <input type=password name=pwd size=8 maxlength=12 placeholder="****">
            &nbsp;5자 이상의 영문이나 숫자로 입력하세요.
         </td>
      </tr>
      <tr>
         <td bgcolor=#F7F7F7> 비밀번호확인<font color=red> *</font></td>
         <td bgcolor=white><input type=password name=repwd size=8 maxlength=12 value="" style="width:80" placeholder="****">&nbsp다시 한번 입력해 주세요. </td>
      </tr>
      <tr>
      <tr>
         <td width=90 bgcolor=#F7F7F7> 회원 성명<font color=red> *</font></td>
         <td width=340 bgcolor=white>
            <input type=text name=name size=20 maxlength=20 value="" placeholder="NAME" >
         </td>
      </tr>
      <tr>
         <td bgcolor=#F7F7F7> 주민등록번호<font color=red> *</font></td>
         <td bgcolor=white>
            <input type=text name=ssn1 size=6 maxlength=6 value="" placeholder="******"> - 
            <input type=text name=ssn2 size=7 maxlength=7 value="" placeholder="*******">
         </td>
      <br><br>
      </tr>
      
      <tr>
      <td algin=center>추가 정보</td>
      </tr>
         <tr>
         <td bgcolor=#F7F7F7>지역</td>
         <td bgcolor=white>
            <select name=job class="formbox">
                <option value="0">선택하세요
                <option value="서울시">서울시
                <option value="경기도">경기도
                <option value="충정도">충정도
                <option value="경상도">경상도
                <option value="전라도">전라도
            </select>
         </td>                
      </tr>      
         <td bgcolor=#F7F7F7> 우편번호</td>
         <td bgcolor=white>
            <table cellspacing=0 cellpadding=0>
               <tr>
                  <td><input type=text name=zip1 size=3 maxlength=3 > -
                           <input type=text name=zip2 size=3 maxlength=3>
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td bgcolor=#F7F7F7> 주소</td>
         <td bgcolor=white><input type=text name=addr size=50 maxlength=60 value=""></td>
      </tr>
      <tr>
         <td bgcolor=#F7F7F7> 전화번호</td>
         <td bgcolor=white>
            <input type=text name=tel1 size=4 maxlength=4 value=""> - 
            <input type=text name=tel2 size=4 maxlength=4 value=""> -
            <input type=text name=tel3 size=4 maxlength=4 value="">
         </td>
      </tr>
      <tr>
         <td bgcolor=#F7F7F7 >이메일</td>
         <td bgcolor=white valign=middle>
            <input type=text name=email size=30 maxlength=30 value="" placeholder="E-mail"></td>
      </tr>
      
      <tr>
         <td colspan=3 align=center><font color=red>* </font><font color=black>은 반드시 입력해주세요.</font>&nbsp;&nbsp;<br/>
            <input type="button" name="formcheck" value="가   입" OnClick="form_check()">
            <input type="reset" value="취  소">
         </td>
      </tr>
   </table>
   </div>
   </form>
   </center>
</BODY>
</HTML>