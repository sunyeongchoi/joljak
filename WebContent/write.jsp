<%@ page import="java.sql.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>

    <meta charset="UTF-8">

    <meta name="description" content="">

    <meta name="keywords" content="">

    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>

    <script language = "javascript"> // 자바 스크립트 시작

   </script>
  <style>
  a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: none;}



h1{
background-color :none;
font-family : '휴먼엽서체';
text-align : left;
}

   body {
  margin: 0;
  padding: 0;
  font-family: "Roboto", serif;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
   font-family:"돋움";
  overflow-x: hidden;  
  background-color :#ffffff; <!--전체 색깔 -->
 
}


 nav{
  width: 100%;
  display: flex;
  justify-content: center;
  position: relative;
    background: linear-gradient(90deg, #eb8484, #e48a56, #fff60f, #e6dd00, #a8eb12);
}

ul, li {
  margin: 0;
  padding: 0;
  list-style: none;
  
}

 .menubar li {
  float: left;
  position: relative;
}

 .menubar a {
  font-size: 0.85rem;
  <!--color: rgba(255,255,255,0.85);-->
  color : #003580;
  text-align: center;
  text-decoration: none;
  letter-spacing: 0.05em;
  display: block;
  padding: 14px 36px;
  border-right: 1px solid rgba(0,0,0,0.15);
  text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
}

 .li:nth-child(1) a {
  border-left: 1px solid rgba(0,0,0,0.15);
}



.menubar li:hover .second {
  opacity: 1;
  visibility: visible;
}

fieldset{
width:250px;
border-width:5px;
border-style:double;
}
<!--검색
 .search{
height : 20px;
width : 400px;
border : 2px solid #199a37;
background : #ffffff;
}

 .search input{
font-size : 16px;
width : 325px;
height : 20px;
border : 0px;
outline : none;
float : left;
}

 .search button{
width : 50px;
height : 100%;
border : 0px;
background : #199a37;
outline : none;
float : right;
color : #ffffff
}
-->
</style>
<script type="text/javascript">







</script>

 <style>

      .body{

        width:1100px;

        margin:50px auto 0;

        text-align: center;
        background-color :#ffffff;
        
       

      }



      .body, .body td, .body th{ border-collapse: collapse; border:1px solid black; box-sizing: border-box; }

      .body th{background-color: #d0cc83;}

      .Btn{margin:30px auto 0; width:100px;}

    </style>



</head>
<body>
<!--  <div class = "search">
   <input type = "text" placeholder="검색어입력">
   <button>검색</button>
</div> -->

<h1 ><a href="index.html"><img src="images/logo.png" alt="My Image"></a></h1> <!-- 타이틀 -->
 
<nav role="navigation" >
  <ul class ="menubar">
    <li><a href="index.html" style="color: black">홈</a></li>
   <li><a href="musical.jsp" style="color: black">뮤지컬</a></li>   
   <li><a href="play.jsp" style="color: black">연극</a></li>
   <li><a href="list.jsp" style="color: black">사용자참여</a></li>
   <li><a href="login.html" style="color: black">login</a></li>
   <li><a href="join.html" style="color: black">회원가입</a></li>
  </ul>
 </nav>
<br /><br /><br />

<script>

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.board_link.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "링크를 적어주세요" ); // 경고창 띄움
    form.link.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
  
  if( !form.board_title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.board_content.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
  
  if( !form.board_writer.value )
  {
   alert( "닉네임을 적어주세요" );
   form.memo.focus();
   return;
  }
 
  form.submit();
  }
 </script>
</body>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <head>
 <title>글쓰기</title>
 </head>
 <body>
<table>
<form name=writeform method=post action="insert.jsp">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>글쓰기</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="board_title" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">닉네임</td>
      <td><input name="board_writer" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">링크</td>
      <td><input name="board_link" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="board_content" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=image src="images/insert.png" value="등록" OnClick="javascript:writeCheck();">
       <input type=image src="images/cancel.png" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
</body>
 </html>