<%-- 
    Document   : adminresume
    Created on : 26 Nov, 2018, 1:24:23 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
             body{
               background: rgb(217, 217, 217);
               font-family: sans-serif;
               font-size: 20px;
            }
           
            h1,h3{
                text-align: centre;
                padding-left: 5%;
                color: rgb(230, 46, 0);
            }
             .wrapper{
                margin:0 auto;
                max-width: 100%;
                width: 98%;
                background: rgb(245, 245, 240);
                border:1px solid #878E63;
            }
             #logo{
                width: 100px;
                height: 100px;
            }
            nav ul{
                list-style: none;
                margin: 0;
                padding-left: 300px;
            }
            nav ul li{
                float:left;
                border:1px solid rgb(230, 46, 0);
                width:25%;
            }
            nav ul li a{
                background: rgb(0, 0, 0);
                display: block;
                padding: 5% 12%;
                font-weight: bold;
                font-size: 18px;
                color:rgb(230, 172, 0);
                text-decoration: none;
                text-align: center;
            }
            nav ul li a:hover, nav ul li .active a{
                background-color:rgb(230, 172, 0) ;
                color:rgb(0, 0, 0) ;
            }
             </style>
    </head>
    <body>
        <div id="wrapper">
            <header>
                <a href="images/logo.png"><center><img id="logo" src="images/logo.png" alt="internship" title="internship"/></center></a> 
                 <h1 style="font-size:100px;font-family: chiller;text-align: center;" >INTERNSHIP</h1>
            </header>
           
            <nav>
                <ul>
                   <li class='active'><a href="account.jsp">Account Details</a></li>
                   <li><a href="comp.jsp">Company Details</a></li> 
                   <li><a href="adminresume.jsp">Resume Details</a></li>
                </ul>
            </nav> <br><br>
        </div>
        <%@page import="java.sql.*"%>
        <%@page import="javax.sql.*"%>
        <%
        
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/intern?useSSL=false","root","root");
        %>
        <table align="center" cellpadding="4" cellspacing="5" border="1">
            
            <tr class="hey">
                <td>First Name<br></td>
                <td>Last Name<br></td>
                <td>email<br></td>
                <td>Phone number<br></td>
                <td>Address<br></td>
                <td>Gender<br></td>
                <td>Job Type<br></td>
                <td>preferences<br></td>
                <td>File Uploaded<br></td>
                <td>Company name<br></td>
               
            </tr>
        <%
            try{
            
        String Query="select * from resum";
        PreparedStatement psm=con.prepareStatement(Query);
        
        ResultSet rs=psm.executeQuery();
        while(rs.next()){
            
        
        %>
        <tr class="hey1">
            <td><%=rs.getString("firstname")%></td>
            <td><%=rs.getString("lastname")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("phnum")%></td>
            <td><%=rs.getString("address")%></td>
            <td><%=rs.getString("gender")%></td>
            <td><%=rs.getString("jobtype")%></td>
            <td><%=rs.getString("prefer")%></td>
            <td><%=rs.getString("fileuploaded")%></td>
            <td><%=rs.getString("companyname")%></td>
            
        </tr>
        <%
            }
     }
   catch(Exception e){
     e.printStackTrace();
out.println("unable to connect to database");
     }

        %>
      
    </body>
</html>
