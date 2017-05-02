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
        <script src="js/timer.js"></script>
    </head>
    <body>
        
        <% 
            
            HttpSession session1=request.getSession(false);
            if(session1==null)
            {
                response.sendRedirect("index.html");
            }
   
            Connection con=null;
            Statement st,st1,st2,st3,st4;
            ResultSet result=null, result1=null;
            String query, query1, query2, query3, query4;
            String sub;
            int id=0;
                   
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
                st1=con.createStatement();
         
                
                sub=request.getParameter("group1");
                query = "select * from "+sub+" where status='n'";
                result = st.executeQuery(query);
                if (!result.next()){
                    query1 = "update "+sub+" set status='n'";
                    st1.executeUpdate(query1);
                }
                result.close();
                st1.close();
                st.close();
                
                st2=con.createStatement();
                query2 = "select * from(select * from "+sub+" where status = 'n' ORDER BY dbms_random.value)where rownum<=1";
                result1 = st2.executeQuery(query2);
                result1.next();
                id=result1.getInt("id");
                st3=con.createStatement();
                query3 = "update "+sub+" set status='y' where id="+id;
                st3.executeUpdate(query3);
                st3.close();
                
                query4="update student set subject='"+sub+"', id="+id+" where usn='"+session1.getAttribute("USN")+"'";
                st4=con.createStatement();
                st4.executeUpdate(query4);                
               
                
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
           <div id="Content" style="padding-bottom: 500px;">
               <div id="time" style="color:#fff;padding-left: 80%;font-size: 48px;"></div><br><br><br>
               <%
                   out.print("<p style=\"padding-left:10%\">"+result1.getString("question")+"</p>");
                  ;
                   result1.close();
               %>
           </div>
           <div id="Footer">
           </div>
       </div>
        </div>
	</div>
    </body>
</html>
