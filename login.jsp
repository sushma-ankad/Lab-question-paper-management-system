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
            String usn;
            String sem;
            
            String msg=null;
            
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
                usn=request.getParameter("USN");
                sem=request.getParameter("Sem");
                query = "select * from student where usn='"+usn+"' and sem='"+sem+"'";
                
                st=con.createStatement();
                result = st.executeQuery(query);
                 
                if(result.next()){
                    msg = " Login successful";
                    HttpSession session1=request.getSession();
                    session1.setAttribute("USN",usn);
                    
                    response.sendRedirect("choosesub.jsp");
                }
                else
                  msg = "Login failed";
                    
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
                   out.print("<h1>"+msg+"</h1>");
               %>
           </div>
           <div id="Footer">
           </div>
       </div>
        </div>
	</div>
    </body>
</html>
