<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
 

<html>
<head><title>play</title></head>
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
color : #003580;
border-color:#e9da63; <!--바뀐부분-->
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

div{
float: left;
height : 60px;
width : 400px;
border : 4px solid #1b5ac2;
background : #ffffff;
}

input{
font-size : 16px;
width : 325px;
padding : 10px;
border : 0px;
outline : none;
float : left;
}

button{
width : 50px;
height : 100%;
border : 0px;
background : #1b5ac2;
outline : none;
float : right;
color : #ffffff
}

fieldset{
width:250px;
border-width:5px;
border-style:double;
color : #003580;
}
         
.main{
    background-color: white;
    border-style:double;
    border: 1px solid white;
    width: 720px;
    height: 200px;
}
   
.main_common{
    display:inline-table;
    width: 33%;
    height: 100%;
    border: 1px solid white;
}
.content {
    display: table-cell;
    vertical-align: middle;
    font-family : '휴먼엽서체';
    text-align: center;
    width: 100%;
}
.max-small {
    width: auto; height: auto;
    max-width: 150px;
    max-height: 200px;
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
<body>

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
<fieldset name = "condition">
<legend>조건검색</legend>
 <form action="p_output.jsp" method="post">
 	<select name="check">
 	<option value="midhigh">중/고등학생</option>
 	<option value="college">대학생</option>
 	<option value="sordier">군인</option>
 	<option value="multiple">다자녀</option>
 	<option value="preview">프리뷰</option>
 	<option value="national">국가유공자</option>
 	<option value="disabled">장애인</option>
 	<option value="again">재관람</option>
 	</select>
 	<input type=image src="images/select.png" value="조건선택완료" >
 </form>
</fieldset>
<table width = "100%" border = "1">
<%
	//1. JDBC 드라이버 로딩
	//Class.forName("oracle.jdbc.driver.OracleDriver");
	  Class.forName("com.mysql.jdbc.Driver");
      Connection conn = null; // DBMS와 Java연결객체
      Statement stmt = null; // SQL구문을 실행
      ResultSet rs = null; // SQL구문의 실행결과를 저장   
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost:3306/tickets_db";
            String dbUser = "root";
            String dbPass = "960201";
            String query = "select * from tickets_db.tickets";
            
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            
            // 3. Statement 생성
            stmt = conn.createStatement();
            
            // 4. 쿼리 실행
            rs = stmt.executeQuery(query);
            
            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
            	     
%>
	  <br/>
      <tr>
      <div class="main">
      <div class="main_1 main_common">
      	<p class="content" height="100%">
      		<a href="https://ticket.melon.com/concert/index.htm?genreType=GENRE_ART"><img class='max-small' src="<%= rs.getString("m_img") %>" /></a>
      	</p>
      </div>
       <div class="main_2 main_common">
      	<p class="content">
      		<%= rs.getString("m_name") %><br/>
            <%= rs.getString("s_name") %><br/>
            <%= rs.getString("p_name") %>
        </p>
      </div>
       <div class="main_3 main_common">
      	<p class="content">
      		<%= rs.getString("price") %>
      	</p>
      </div>    
      </tr>
<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. 사용한 Statement 종료
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            // 7. 커넥션 종료
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
      </table>
</body>
</html>