<%-- 
    Document   : comp
    Created on : 25 Nov, 2018, 8:28:50 PM
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
           
             .add input[type = "submit"]{
            border:0;
            background: none;
            display:block;
            margin:20px auto;
            text-align: center;
            border:2px solid #cc0000;
            padding: 10px 50px;
            outline:none;
            color: black;
            border-radius: 30px;
            transition: 0.25s;
            cursor: pointer;
        }
        .add input[type = "submit"]:hover{
            background: #cc0000;
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
             <form action="add.html" class="add" method="post">
                 <b><input type="submit" name="submit" value="+Add"></b>
        </form>
        </div>
        <%@page import="java.sql.*"%>
        <%@page import="javax.sql.*"%>
        <%
        
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/intern?useSSL=false","root","root");
        %>
        <table align="center" cellpadding="4" cellspacing="5" border="1">
            
            <tr class="hey">
                <td>Company id<br></td>
                <td>Company Name<br></td>
                <td>Location<br></td>
                <td>Duration<br></td>
                <td>Stipend<br></td>
                <td>Posted on<br></td>
                <td>Apply by<br></td>
                <td>Available internships<br></td>
                <td>Perks<br></td>
                <td>Skills required<br></td>
                <td>Description<br></td>
            </tr>
        <%
            try{
            
        String Query="select * from comp1";
        PreparedStatement psm=con.prepareStatement(Query);
        
        ResultSet rs=psm.executeQuery();
        while(rs.next()){
            
        
        %>
        <tr class="hey1">
            <td><%=rs.getString("id")%></td>
            <td><%=rs.getString("companyname")%></td>
            <td><%=rs.getString("location")%></td>
            <td><%=rs.getString("duration")%></td>
            <td><%=rs.getString("stipend")%></td>
            <td><%=rs.getString("post")%></td>
            <td><%=rs.getString("apply")%></td>
            <td><%=rs.getString("interns")%></td>
            <td><%=rs.getString("perk")%></td>
            <td><%=rs.getString("skill")%></td>
            <td><%=rs.getString("descr")%></td>
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
