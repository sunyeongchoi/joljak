<%@ page import="java.sql.*"%>

<%

    request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리



     Class.forName("com.mysql.jdbc.Driver"); // mysql 연동

     String url = "jdbc:mysql://localhost:3306/shxdb"; // mysql 데이터베이스명

     String mysql_id = "root";   // mysql id값

     String mysql_pw = "960201";   // mysql pw값



     // String board_no = request.getParameter("board_comment_no");    // 넘어온 글제목 값 저장
     //int board_no = Integer.parseInt(request.getParameter("board_no")); //넘어온 글번호 저장
     
     String board_comment_writer = request.getParameter("board_comment_writer"); // 넘어온 글내용 값 저장
     
     String board_comment_content = request.getParameter("board_comment_content"); // 넘어온 글내용 값 저장
     
     board_comment_content = board_comment_content.replace("\r\n","<br>");
     
     String board_number = request.getParameter("board_number"); // 넘어온 글번호 값 저장
     

   //  String board_date = request.getParameter("board_comment_date"); // 넘어온 글내용 값 저장
     
     
  

     try{

       Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw); //실제연동시도



       String sql = "insert into board_comment(board_comment_writer, board_comment_content, board_number) values(?,?,?)"; // insert 쿼리문

       PreparedStatement pstmt = conn.prepareStatement(sql);



       pstmt.setString(1, board_comment_writer);

       pstmt.setString(2, board_comment_content);
       
    pstmt.setString(3, board_number);
       



       pstmt.execute();
       
       %>
       <!--수정 완료 창 띄운 후에 수정된 게시글 상세보기로 이동 -->

  <script>

   alert("댓글 작성 완료 되었습니다");


  </script>
       <% 

       pstmt.close();

     }catch(SQLException e){

       out.println(e.toString());

     }
 
     
     //response.sendRedirect("list.jsp");
   

%> 