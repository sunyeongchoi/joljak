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
   font-size : 85%;
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

    Class.forName("com.mysql.jdbc.Driver"); // mysql 연동

    String url = "jdbc:mysql://localhost:3306/shxdb"; // mysql 데이터베이스명

    String mysql_id = "root";   // mysql id값

    String mysql_pw = "960201";   // mysql pw값

    int total = 0;



    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도

      Statement stmt = conn.createStatement();

      String totalSql = "select count(*) from board;";  // 총 글갯수를 찾는 sql문
      

      ResultSet rs = stmt.executeQuery(totalSql);



      if(rs.next()){            // 결과가 있다면 true값을 반환합니다

        total = rs.getInt(1);   // total에 전체 글 갯수 값 대입

      }



      // total은 나중에 페이징 처리시 사용



      String listSql = "select board_no, board_title, board_writer, board_date from board order by board_no desc;"; // 전체 리스트를 가져오는 sql문

      rs = stmt.executeQuery(listSql);
    

      // try catch에서 오류가없을시에 출력되는 내용입니다

  %>
전체 글 수 : <%=total %>
  <table class="body" >

    <tr >

      <th>글번호</th>

      <th>글제목</th>
      
      <th>글쓴이</th>

      <th>작성일자</th>

    <tr>



  <%

  // total이 0일때, 곧 게시글이 아무것도 없을때 출력되는 내용입니다.

    if(total==0){

  %>

    <tr>

      <td>게시글이 존재하지 않습니다</td>

    </tr>

   <%

  // total이 0이 아닐때 변수를 선언해주고 출력되는 내용을 순서에 맞게 대입하는 내용입니다.

    } else{

      while(rs.next()){ //rs값이 있을때까지 반복합니다.

        int board_no = rs.getInt(1);           // sql문의 첫번째 컬럼내용을 담습니다.

        String board_title = rs.getString(2);   // sql문의 두번째 컬럼내용을 담습니다.

        String board_writer = rs.getString(3); // sql문의 세번째 컬럼내용을 담습니다.
        
        String board_date = rs.getString(4); // sql문의 네번째 컬럼내용을 담습니다.



  // 실제 리스트가 출력되는 부분 입니다.

  
  %>

    <tr>

      <td><%=board_no%></td>

      <td><a href="Detail.jsp?board_no=<%=board_no%>"><%=board_title%></a></td>
      
      <td><%=board_writer%></a></td>

      <td><%=board_date%></td>

    </tr>
 
 
  <%

      }

    }

    rs.close();

    conn.close();

    stmt.close();

  }catch(SQLException e){

    out.println(e.toString());

  }

  %>

  </table>

</body>
</html>

   
      
        
        
        
<table width="25%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="2" height="3"></td></tr>
  <tr align="center">
  
   <td><input type=image src="images/write.png" value="글쓰기"  alt="My Image" OnClick="window.location='write.jsp'"></td>