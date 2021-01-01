<%@ page import="java.sql.*"%>

<%

    request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리



     Class.forName("com.mysql.jdbc.Driver"); // mysql 연동

     String url = "jdbc:mysql://localhost:3306/shxdb"; // mysql 데이터베이스명

     String mysql_id = "root";   // mysql id값

     String mysql_pw = "960201";   // mysql pw값



     String board_title = request.getParameter("board_title");    // 넘어온 글제목 값 저장
     
     String board_writer = request.getParameter("board_writer"); // 넘어온 글내용 값 저장
     
     String board_link = request.getParameter("board_link"); // 넘어온 글내용 값 저장

     String board_content = request.getParameter("board_content"); // 넘어온 글내용 값 저장
     
     board_content = board_content.replace("\r\n","<br>");
     
     
  

     try{

       Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw); //실제연동시도



       String sql = "insert into board(board_title, board_writer, board_link, board_content) values(?,?,?,?)"; // insert 쿼리문

       PreparedStatement pstmt = conn.prepareStatement(sql);



       pstmt.setString(1, board_title);

       pstmt.setString(2, board_writer);
       
       pstmt.setString(3, board_link);
       
       pstmt.setString(4, board_content);



       pstmt.execute();

       pstmt.close();

     }catch(SQLException e){

       out.println(e.toString());

     }
 
     
     response.sendRedirect("list.jsp");
   

%> 