<%-- 
    Document   : me
    Created on : Apr 26, 2017, 10:39:11 PM
    Author     : Khushi
--%>
<%@ page import="java.io.*,java.sql.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
        <%  
            Connection con=null;
            Statement st;
            ResultSet result;
            String name=request.getParameter("name");
            String usn=request.getParameter("USN");
            String sem=request.getParameter("Sem");
            String dept=request.getParameter("Department");
           
            String query = "insert into student (\"name\", \"usn\", \"sem\", \"dept\")  values('"+name+"','"+usn+"','"+ sem+"','"+dept+"')";
            try{
                Class.forName("oracle.jdbc.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","me","bec");
            }catch(SQLException e)
            {
                out.print(e);
            }catch(ClassNotFoundException e1)
            {
                out.print(e1);
            }
            try{
               st=con.createStatement();
               st.executeUpdate(query);
               result=st.executeQuery("select * from student");
                    while(result.next()){ 
        %>
            <TABLE BORDER="1">
                <TR>
                    <TH>ID</TH>
                    <TH>Name</TH>
                </TR>
                <TR>
                    <TD> <%= result.getString(1) %> </TD>
                    <TD> <%= result.getString(2) %> </TD>
                </TR>
            </TABLE>
        <% 
            } 
               st.close();
               result.close();
               con.close();
            }catch(Exception e) { }
        %>
    </body>
</html>
