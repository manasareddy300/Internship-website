<%-- 
    Document   : res
    Created on : 26 Nov, 2018, 2:01:26 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <script>
        function validate()
        {
               
    alert("You have successfully entered!");

            }

    </script>
        <style>
        body{
               background: rgb(217, 217, 217);
               font-family: sans-serif;
               font-size: 20px;
            }
            h1,h2,h3{
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
                padding-left: 500px;
            }
            nav ul li{
                float:left;
                border:1px solid rgb(230, 46, 0);
                width:15%;
            }
            nav ul li a{
                background: rgb(0, 0, 0);
                display: block;
                padding: 10% 1%;
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
          
                .hey{
                    font-size: 40px;
                    font-family: "Trebuchet MS", Helvetica, sans-serif;
                }
                .hey1{
                    font-size: 50px;
                    font-family: "Courier New", Courier, monospace;
                }
            </style>
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
                   <li class='active'><a href="home.html">HOME</a></li>
                   <li><a href="intern.jsp">INTERNSHIPS</a></li> 
                   <li><a href="resume.html">RESUME</a></li> 
                </ul>
            </nav>  <br><br><br><br>
        </div>
        <%@page import="java.sql.*"%>
        <%@page import="javax.sql.*"%>
        <%
        String email=request.getParameter("email");
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/intern?useSSL=false","root","root");
        %>
        <table align="center" cellpadding="6" cellspacing="5" border="1">
             <tr>
                
                <td>First Name<br></td>
                <td>Last Name<br></td>
                <td>Email<br></td>
                <td>Phone number<br></td>
                <td>Address<br></td>
                <td>Gender<br></td>
                <td>Job type<br></td>
                <td>Prefer<br></td>
                <td>File<br></td>
                <td>Company name:</td>
             </tr>    
        <%
            try{
            String email1=request.getParameter("email");
        
        String Query="select * from resume where email=?";
        PreparedStatement psm=con.prepareStatement(Query);
        psm.setString(1,email1);
        ResultSet rs=psm.executeQuery();
        while(rs.next()){
            
        
        %>
         
        <form action="resum.jsp">
             <tr>
                 <td><br><input type="text" name="firstname" id="cname" value="<%=rs.getString("firstname")%>"></td>
                <td><br><input type="text" name="lastname" size="50px" id="cname" value="<%=rs.getString("lastname")%>"></td>
                <td><br><input type="text" name="email" size="50px" id="cname" value="<%=rs.getString("email")%>"></td>
                 <td><br><input type="text" name="phnum" size="50px" id="cname" value="<%=rs.getString("phnum")%>"></td>
                 <td><br><input type="text" name="address" size="50px" id="cname" value="<%=rs.getString("address")%>"></td>
                <td><br><input type="text" name="gender" size="50px" id="cname" value="<%=rs.getString("gender")%>"></td>
                <td><br><input type="text" name="jobtype" size="50px" id="cname" value="<%=rs.getString("jobtype")%>"></td>
                <td><br><input type="text" name="prefer" size="50px" id="cname" value="<%=rs.getString("prefer")%>"></td>
                <td><br><input type="text" name="fileuploaded" size="50px" id="cname" value="<%=rs.getString("fileuploaded")%>"></td>
                <td><br><input type="text" name="companyname" placeholder="companyname"></td>
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
       
        <button onclick="validate()">Try it</button>
        </form>
        
    </body>
</html>
