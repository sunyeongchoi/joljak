<%@ page import="java.sql.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

    <title>게시판 테스트</title>

    <meta charset="UTF-8">

    <meta name="description" content="">

    <meta name="keywords" content="">

    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>

    <script language = "javascript"> // 자바 스크립트 시작
       $(document).ready(function(){
          $("#update").click(function(){
             $("#updateFrm").submit();
          });
       });

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
  <%

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/shxdb";

    String mysql_id = "root";

    String mysql_pw = "1120";



    int num = Integer.parseInt(request.getParameter("board_no"));



    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);

      Statement stmt = conn.createStatement();



      String sql = "select board_title, board_content, board_writer, board_link from board where board_no="+num;

      ResultSet rs = stmt.executeQuery(sql);

      if(rs.next()){

        String board_title = rs.getString(1);

        String board_content = rs.getString(2);
        
        String board_writer = rs.getString(3);
        
        String board_link = rs.getString(4);

  %>

  <table class="body">
  <form id="updateFrm" action="updateProc.jsp">

    <tr>

      <th style="height:40px;">글제목</th>

      <td><input type="text" style="width:1000px;" name="board_title" id="board_title" value="<%=board_title %>"></td>

    </tr>

    <tr>

      <th style="height:200px;">글내용</th>

       <td><textarea name="board_content" id="board_content" style="width:1000px; height:200px;"><%=board_content%></textarea></td>

    </tr>
    
        <tr>

      <th style="height:30px;">닉네임</th>

       <td><textarea name="board_writer" id="board_writer" style="width:300px;"><%=board_writer %></textarea></td>

    </tr>
    
        <tr>

      <th style="height:30px;">링크</th>

       <td><textarea name="board_link" id="board_link" style="width:1000px;"><%=board_link%></textarea></td>

    </tr>

  </table>
  <input type="hidden" id="board_no" name="board_no" value="<%=num %>">
<form>
  <%

      rs.close();

      stmt.close();

      conn.close();

      }

    }catch(SQLException e){

      out.println(e.toString());

    }

  %>



  <div class="btnDiv">

    <input type=image src="images/write.png" id="update" value="수정완료">

  </div>

</body>

</html> 