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
font-family : '�޸տ���ü';
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
   font-family:"����";
  overflow-x: hidden;  
  background-color :#ffffff; <!--��ü ���� -->
 
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
border-color:#e9da63; <!--�ٲ�κ�-->
}
<!--�˻�
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
    font-family : '�޸տ���ü';
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

<h1 ><a href="index.html"><img src="images/logo.png" alt="My Image"></a></h1> <!-- Ÿ��Ʋ -->
 
<nav role="navigation" >
  <ul class ="menubar">
    <li><a href="index.html" style="color: black">Ȩ</a></li>
   <li><a href="musical.jsp" style="color: black">������</a></li>   
   <li><a href="play.jsp" style="color: black">����</a></li>
   <li><a href="list.jsp" style="color: black">���������</a></li>
   <li><a href="login.html" style="color: black">login</a></li>
   <li><a href="join.html" style="color: black">ȸ������</a></li>
  </ul>
 </nav>
<br /><br /><br />
<fieldset name = "condition">
<legend>���ǰ˻�</legend>
 <form action="p_output.jsp" method="post">
 	<select name="check">
 	<option value="midhigh">��/����л�</option>
 	<option value="college">���л�</option>
 	<option value="sordier">����</option>
 	<option value="multiple">���ڳ�</option>
 	<option value="preview">������</option>
 	<option value="national">����������</option>
 	<option value="disabled">�����</option>
 	<option value="again">�����</option>
 	</select>
 	<input type=image src="images/select.png" value="���Ǽ��ÿϷ�" >
 </form>
</fieldset>
<table width = "100%" border = "1">
<%
	//1. JDBC ����̹� �ε�
	//Class.forName("oracle.jdbc.driver.OracleDriver");
	  Class.forName("com.mysql.jdbc.Driver");
      Connection conn = null; // DBMS�� Java���ᰴü
      Statement stmt = null; // SQL������ ����
      ResultSet rs = null; // SQL������ �������� ����   
      try
      {
            String jdbcDriver = "jdbc:mysql://localhost:3306/tickets_db";
            String dbUser = "root";
            String dbPass = "960201";
            String query = "select * from tickets_db.tickets";
            
            // 2. �����ͺ��̽� Ŀ�ؼ� ����
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            
            // 3. Statement ����
            stmt = conn.createStatement();
            
            // 4. ���� ����
            rs = stmt.executeQuery(query);
            
            // 5. ���� ���� ��� ���
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
            // 6. ����� Statement ����
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
   
            // 7. Ŀ�ؼ� ����
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
      </table>
</body>
</html>