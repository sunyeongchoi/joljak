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



</head>

<body>

  <%

    Class.forName("com.mysql.jdbc.Driver"); 

    String url = "jdbc:mysql://localhost:3306/shxdb";

    String mysql_id = "root"; 

    String mysql_pw = "960201"; 



    // 받아온 파라미터 값을 utf-8로 인코딩

    request.setCharacterEncoding("utf-8");



    // 받아온 파라미터 값을 변수에 담는 부분

    String board_no = request.getParameter("board_no");

    String board_title = request.getParameter("board_title");

    String board_content = request.getParameter("board_content");
    
    String board_writer = request.getParameter("board_writer");
    
    String board_link = request.getParameter("board_link");
    board_content = board_content.replace("\r\n","<br>");




    // 데이터 베이스 연동 후 쿼리 적용 하는 부분

    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);



      String sql = "update board set board_title=?, board_content=?,  board_writer=?, board_link=? where board_no=?";

      PreparedStatement pstmt = conn.prepareStatement(sql);



      pstmt.setString(1, board_title);

      pstmt.setString(2, board_content);
      
      pstmt.setString(3, board_writer);
      
      pstmt.setString(4, board_link);
      
      pstmt.setString(5, board_no);



      pstmt.execute();

  %>



  <!--수정 완료 창 띄운 후에 수정된 게시글 상세보기로 이동 -->

  <script>

    alert("수정완료 되었습니다");

    window.location.href = "Detail.jsp?board_no="+<%=board_no%>;

  </script>





  <%

      pstmt.close();

    }catch(SQLException e){

      out.println(e.toString());

    }

  %>

</body>

</html> 