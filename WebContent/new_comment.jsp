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
    	
    	
    	function writeCheck()
    	  { alert("언제하고자냐");
    	  <!-- var form = document.writeform;
    	   
    	   if( !form.board_comment_writer.value )   // form 에 있는 name 값이 없을 때
    	   {
    	    alert( "닉네임을 적어주세요" ); // 경고창 띄움
    	    form.board_comment_writer.focus();   // form 에 있는 name 위치로 이동
    	    return;
    	   }
    	   
    	  
    	  if( !form.board_comment_content.value )
    	   {
    	    alert( "내용을 적어주세요" );
    	    form.board_comment_content.focus();
    	    return;
    	   }
    	  
    	  
    	 
    	  form.submit();-->
    	  }
    	 
    	 
    	

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

.cc{
	display: table-cell;
    vertical-align: middle;
    font-family : '휴먼엽서체';
    font-weight: bold;
    text-align: center;
    width: 100%;
}
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


 

   <%

    Class.forName("com.mysql.jdbc.Driver"); // mysql 연동

    String url = "jdbc:mysql://localhost:3306/shxdb"; // mysql 데이터베이스명

    String mysql_id = "root"; // mysql id

    String mysql_pw = "960201"; // mysql pw



    int num = Integer.parseInt(request.getParameter("board_no")); //num은 글번호



    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);

      Statement stmt = conn.createStatement();



      String sql = "select board_title, board_content, board_writer, board_link, board_no from board where board_no="+num;

      ResultSet rs = stmt.executeQuery(sql);

      if(rs.next()){

        String board_title = rs.getString(1);

        String board_content = rs.getString(2);
        
        String board_writer = rs.getString(3);
        
        String board_link = rs.getString(4);
        
        String board_no = rs.getString(5);

  %>

  
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



    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도

      Statement stmt = conn.createStatement();

      String totalSql = "select count(*) from board_comment;";  // 총 글갯수를 찾는 sql문

      ResultSet rs = stmt.executeQuery(totalSql);



      if(rs.next()){            // 결과가 있다면 true값을 반환합니다

        total = rs.getInt(1);   // total에 전체 글 갯수 값 대입

      }



      // total은 나중에 페이징 처리시 사용



      String listSql = "select board_comment_no, board_comment_content, board_comment_writer, board_comment_date , board_number from board_comment order by board_comment_no desc;"; // 전체 리스트를 가져오는 sql문

      rs = stmt.executeQuery(listSql);

	

      // try catch에서 오류가없을시에 출력되는 내용입니다

  %>
<p class="cc"> 당신의 선의 어린 댓글은 작성자에게 큰 힘이 됩니다. </p>
 


  <%

  // total이 0일때, 곧 게시글이 아무것도 없을때 출력되는 내용입니다.

    if(total==0){

  %>


   <%

  // total이 0이 아닐때 변수를 선언해주고 출력되는 내용을 순서에 맞게 대입하는 내용입니다.

    } else{

      while(rs.next()){ //rs값이 있을때까지 반복합니다.

        int board_comment_no = rs.getInt(1);           // sql문의 첫번째 컬럼내용을 담습니다.

        String board_comment_content = rs.getString(2);   // sql문의 두번째 컬럼내용을 담습니다.

        String board_comment_writer = rs.getString(3); // sql문의 세번째 컬럼내용을 담습니다.
        
        String board_comment_date = rs.getString(4); // sql문의 네번째 컬럼내용을 담습니다.
        
        String board_number = rs.getString(5);



  // 실제 리스트가 출력되는 부분 입니다.

  
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

          alert( "내용을 적어주세요"  );

          insertFrm.board_comment_content.focus();

          return;

         }


        opener.location.reload();
        insertFrm.submit();
        
        self.close();
        
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

</head>

<body>

  <form name="insertFrm" id="insertFrm" action="comment_insert.jsp">

    <table class="body">
		
		글번호 : <%=num %>
      <tr>

        <th>닉네임</th>

        <td><input type="text" id="board_comment_writer" name="board_comment_writer" style="width:200px"></td>

      </tr>

      <tr>

        <th>내용</th>

        <td><textarea id="board_comment_content" name="board_comment_content" style="width:800px" ></textarea></td>

      </tr>

    </table>
<td><input type="text" value=<%=num %> id="board_number" name="board_number" style="width:000px"></td>
  </form>

  <div class="Btn">
	
    <input type="button" value="등록" id="insert" OnClick="javascript:Insert();">

  </div>

</body>

</html>
