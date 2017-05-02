<%-- 
    Document   : test
    Created on : Apr 27, 2017, 3:00:02 PM
    Author     : Khushi
--%>

<%@ page import="java.io.*,java.sql.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Untitled Document</title>
        <link href="boilerplate.css" rel="stylesheet" type="text/css">
        <link href="file:///C|/xampp/htdocs/testsimulation/testsimule.css" rel="stylesheet" type="text/css">
        <link href="css/test.css" rel="stylesheet" type="text/css"/>

        <script src="respond.min.js"></script>

    </head>
    <body>
        
        <% 
            Connection con=null;
            Statement st;
            ResultSet result=null;
            String query;
            String name;
            String usn;
            String sem;
            String dept;
            int ResultExe=0;
            
            try {
                Class.forName("oracle.jdbc.OracleDriver");
                con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","me","bec");
            }catch(ClassNotFoundException e) {
                out.print(e+"<br/>");
            }
            catch(SQLException e){
                out.print(e+"<br/>");
            }
            try{
                st=con.createStatement();
                
                name=request.getParameter("name");
                usn=request.getParameter("USN");
                sem=request.getParameter("Sem");
                dept=request.getParameter("Department");
                
                
                query = "insert into student values('"+name+"','"+usn+"','"+sem+"','"+dept+"',null,0)";
                ResultExe = st.executeUpdate(query);
                
            }catch(SQLException e){
                out.print(e+"<br/>");
            }
            
            
            
        %>
        
        
        <div class="gridContainer clearfix">
		<div id="LayoutDiv1">
        <div id="Holder">
        	<div id="HeaderContainer">
          		 <div id="Header">
                 	<h1>Random Question Papers!!!</h1>
           		 </div>
           		<div id="Nav">
           		</div>
           	</div>
           <div id="Content" style="padding-bottom: 400px;">
               <%
                   if (ResultExe == 1){
                    out.print("<h1>Registration successful </h1>");
                    out.print("<h3 style=\"color:#FFF;padding-left:45%\"><a href=\"index.html\">click here</a> to login</h3>");
                   }
                   else
                    out.print("<h1>Registration failed</h1>");
               %>
           </div>
           <div id="Footer">
           </div>
       </div>
        </div>
	</div>
    </body>
</html>
