<%-- 
    Document   : account
    Created on : 25 Nov, 2018, 7:31:27 PM
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
                .hey{
                    font-size: 20px;
                    font-family: "Trebuchet MS", Helvetica, sans-serif;
                }
                .hey1{
                    font-size: 20px;
                    font-family: "Courier New", Courier, monospace;
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
            </nav> <br><br><br><br><br>
             
        </div>
        <%@page import="java.sql.*"%>
        <%@page import="javax.sql.*"%>
        <%
        
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/intern?useSSL=false","root","root");
        %>
        <table align="center" cellpadding="4" cellspacing="5" border="1">
            <tr>
                
            </tr>
            <tr class="hey">
                <td><b>User Name</b><br></td>
                <td>First Name<br></td>
                <td>Last Name<br></td>
                <td>Password<br></td>
                <td>E-mail<br></td>
                <td>Phone Number<br></td>
                <td>Gender<br></td>
            </tr>
        <%
            try{
            
        String Query="select username,firstname,lastname,password,email,phnum,gender from signup";
        PreparedStatement psm=con.prepareStatement(Query);
        
        ResultSet rs=psm.executeQuery();
        while(rs.next()){
            
        
        %>
        <tr class="hey1">
            <td><%=rs.getString("username")%></td>
            <td><%=rs.getString("firstname")%></td>
            <td><%=rs.getString("lastname")%></td>
            <td><%=rs.getString("password")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("phnum")%></td>
            <td><%=rs.getString("gender")%></td>
        </tr>
        <%
            }
     }
   catch(Exception e){
     e.printStackTrace();
out.println("unable to connect to database");
     }

        %>
      
        </table>
    </body>
</html>