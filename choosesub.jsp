

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!doctype html>
<!--[if lt IE 7]> <html class="ie6 oldie"> <![endif]-->
<!--[if IE 7]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8]>    <html class="ie8 oldie"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Untitled Document</title>
<link href="boilerplate.css" rel="stylesheet" type="text/css">
<link href="file:///C|/xampp/htdocs/testsimulation/testsimule.css" rel="stylesheet" type="text/css">
<link href="css/test.css" rel="stylesheet" type="text/css"/>

<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="respond.min.js"></script>
</head>
<body>
    <%
        HttpSession session1=request.getSession(false);
        if(session1==null)
        {
            response.sendRedirect("index.html");
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
           <div id="Content">
               
              <h1>Choose a Subject!!!</h1>
              <form id="register" action="display.jsp" method="post" style="padding-left: 30%;padding-bottom: 20%">
                  
                  <p><input type="radio" value="usp" name="group1"/><label>UNIX SYSTEM PROGRAMMING</label></p><br/>
                  <p><input type="radio" value="wt" name="group1"/><label>WEB PROGRAMMING</label></p><br/>
                  <p><input type="radio" value="dbms" name="group1"/><label>DATABASE MANAGEMENT SYSTEM</label></p><br/>
                  <p><span>&nbsp;</span><input type="submit" class="submit" name="submit" id="submit" value="Submit"/></p>
              </form>
              
           </div>
           <div id="Footer">
           </div>
       </div>
        </div>
	</div>
</body>
</html>
