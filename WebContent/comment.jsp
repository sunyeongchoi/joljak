<%@ page import="java.sql.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<html>

 <head>
 
 <title>코멘트</title>

    <meta charset="UTF-8">

    <meta name="description" content="">

    <meta name="keywords" content="">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>


    <script language = "javascript"> // 자바 스크립트 시작
    	$(document).ready(function(){
    		$("#update").click(function(){
    			var board_no =  $("#board_no").val();
    			location.href="update.jsp?board_no="+board_no;
    		});
    	});
    
    	$(document).ready(function(){
    		$("#delete").click(function(){
    			var board_no =  $("#board_no").val();
    			location.href="delete.jsp?board_no="+board_no;
    		});
    	});
    	
    	$(document).ready(function(){
    		$("#list").click(function(){
    			location.href="list.jsp"
    		});
    	});
    	
    	

   </script>
   
   
 <style>
  a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: none;}



h1{
background-color : white;
font-family : '나눔고딕';
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
  overflow-x: hidden;  
}


 nav{
  width: 100%;
  display: flex;
  justify-content: center;
  position: relative;
  background: linear-gradient(90deg, #051937, #004d7a, #008793, #00bf72, #a8eb12);
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
  color: rgba(255,255,255,0.85);
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

 .search{
height : 60px;
width : 400px;
border : 4px solid #1b5ac2;
background : #ffffff;
}

 .search input{
font-size : 16px;
width : 325px;
padding : 10px;
border : 0px;
outline : none;
float : left;
}

 .search button{
width : 50px;
height : 100%;
border : 0px;
background : #1b5ac2;
outline : none;
float : right;
color : #ffffff
}

</style>


 <style>

      .body{

        width:1100px;

        margin:50px auto 0;

        text-align: center;

      }



      .body, .body td, .body th{ border-collapse: collapse; border:1px solid black; box-sizing: border-box;}

      .body th{background-color: #e3e3e3;}

      .Btn{margin:30px auto 0; width:100px;}

    </style>



</head>


 
<body>

<h1><a href="index.html">Ticket Yellow</a></h1>
 
<nav role="navigation">
  <ul class ="menubar">
    <li><a href="index.html">홈</a></li>
	<li><a href="musical.jsp">뮤지컬</a></li>	
	<li><a href="play.jsp">연극</a></li>
	<li><a href="list.jsp">사용자참여</a></li>
	<li><a href="login.html">login</a></li>
	<li><a href="join.html">회원가입</a></li>
  </ul>
 </nav>
<br /><br /><br />

 </body>
   <%

    Class.forName("com.mysql.jdbc.Driver"); // mysql 연동

    String url = "jdbc:mysql://localhost:3306/shxdb"; // mysql 데이터베이스명

    String mysql_id = "root"; // mysql id

    String mysql_pw = "1120"; // mysql pw



    int num = Integer.parseInt(request.getParameter("board_no"));
    //int num2 = Integer.parseInt(request.getParameter("board_number"));
	//String num2 = request.getParameter("board_number");
	

    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);

      Statement stmt = conn.createStatement();



      String sql = "select board_title, board_content, board_writer, board_link from board natural join board_comment where board_no="+num;

      ResultSet rs = stmt.executeQuery(sql);

      if(rs.next()){

        String board_title = rs.getString(1);

        String board_content = rs.getString(2);
        
        String board_writer = rs.getString(3);
        
        String board_link = rs.getString(4);
        
      //  String board_number = rs.getString(5);

  %>

  <table class="body">

    <tr>

      <th style="height:40px;">글제목</th>

      <td><%=board_title%></td>

    </tr>
    
    <tr>

      <th style="height:30px;">글쓴이</th>

      <td><%=board_writer%></td>

    </tr>
    
    <tr>

      <th style="height:30px;">링크</th>

      <td><a href="<%=board_link%>"><%=board_link%></a></td>
      
       


    </tr>

    <tr>

      <th style="height:200px;">글내용</th>

      <td style="text-align:left; padding-left:15px"><%=board_content%></td>
     
      
      

    </tr>

  </table>
 <input type="hidden" id="board_no" value="<%=num%>">

  <%

      rs.close();

      stmt.close();

      conn.close();

      }

    }catch(SQLException e){

      out.println(e.toString());

    }

  %>



<!-- 덧글 리스트 -->


  <%

    int total = 0;
  String num2 = request.getParameter("board_number");
  	
  //String num2 = request.getParameter("board_number");


    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도

      Statement stmt = conn.createStatement();

      String totalSql = "select count(*) from board_comment;";  // 총 글갯수를 찾는 sql문

      ResultSet rs = stmt.executeQuery(totalSql);
      //String num2 = request.getParameter("board_number");

      if(rs.next()){            // 결과가 있다면 true값을 반환합니다

        total = rs.getInt(1);   // total에 전체 글 갯수 값 대입

      }



      // total은 나중에 페이징 처리시 사용



      // String listSql = "select board_comment_no, board_comment_content, board_comment_writer, board_comment_date from board_comment WHERE board_number=17 order by board_comment_no desc;"; // 전체 리스트를 가져오는 sql문
String listSql = "select board_comment_no, board_comment_content, board_comment_writer, board_comment_date, board_number from board_comment join board WHERE board_number=board_no order by board_comment_no desc;";
      rs = stmt.executeQuery(listSql);


      // try catch에서 오류가없을시에 출력되는 내용입니다

  %>
   <p> </p>

     <div class="btnDiv">

    <input type="button" id="update" value="수정">

    <input type="button" id="delete" value="삭제">
    
    <input type="button" id="list" value="목록">

  </div>
  <p> </p>

<p>♡ 댓글 ♡</p>
  <table class="body" bgcolor="skyblue">

    <tr style="bgcolor:red;">


      <th style="width:20%;">댓글쓴이</th>
      
      <th style="width:60%;">내용</th>

      <th style="width:20%;">작성일자</th>

    <tr>



  <%

  // total이 0일때, 곧 게시글이 아무것도 없을때 출력되는 내용입니다.

    if(total==0){

  %>

    <tr>

      <td>댓글이 존재하지 않습니다</td>
 
    </tr>

   <%

  // total이 0이 아닐때 변수를 선언해주고 출력되는 내용을 순서에 맞게 대입하는 내용입니다.

    } else{
      while(rs.next()){ //rs값이 있을때까지 반복합니다.

        int board_comment_no = rs.getInt(1);           // sql문의 첫번째 컬럼내용을 담습니다.

        String board_comment_content = rs.getString(2);   // sql문의 두번째 컬럼내용을 담습니다.

        String board_comment_writer = rs.getString(3); // sql문의 세번째 컬럼내용을 담습니다.
        
        String board_comment_date = rs.getString(4); // sql문의 네번째 컬럼내용을 담습니다.
        
    int board_number = rs.getInt(5); // sql문의 네번째 컬럼내용을 담습니다.


  // 실제 리스트가 출력되는 부분 입니다.

  
  %>
    <tr>
    <% 
    if(num==board_number){
%>
      <td><%=board_comment_writer%></a></td>
      <td ><%=board_comment_content%></a></td>
	 <td><%=board_comment_date%></td>

    </tr>
 <%};
 %>
 
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
  
  <p>     </p>
   <p>     </p>
   
   </html>
<!-- 댓글쓰기창 -->
<html>

<head>

   <title>게시판 테스트</title>

    <meta charset="UTF-8">

    <meta name="description" content="">

    <meta name="keywords" content="">

    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>

    <script language = "javascript"> // 자바 스크립트 시작



      function Insert()

        {

        var insertFrm = document.insertFrm;

        if( !insertFrm.board_comment_writer.value ){

          alert( "닉네임을 적어주세요" );

          insertFrm.board_comment_writer.focus();

          return;

         }



        if( !insertFrm.board_comment_content.value ){

          alert( "내용을 적어주세요" );

          insertFrm.board_comment_content.focus();

          return;

         }



        insertFrm.submit();

        }



   </script>

    <style>

      .body{

        width:1100px;

        margin:50px auto 0;

        text-align: center;

      }

      .body, .body td, .body th{ border-collapse: collapse; border:1px solid black; box-sizing: border-box;}

      .body th{width:242px; padding:10px 0;}

      .body td{padding:10px 0;}

      #board_title{width:730px; height:17px;}

      #board_content{width:730px; height:100px;}

      .Btn{margin:30px auto 0; width:100px;}

    </style>
    <script type="text/javascript">


function popupOpen(){

	var popUrl = "new_comment.jsp?board_no=<%=num%>";	//팝업창에 출력될 페이지 URL

	var popOption = "width=1200, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}



</script>



<a href="javascript:popupOpen();" > 댓글 다시려면 클릭! </a>
  <p>     </p>
   <p>     </p>

</head>


</html>
