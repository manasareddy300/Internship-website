<%-- 
    Document   : index
    Created on : 19 Nov, 2018, 11:01:35 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            
            
            if(username!=null)
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/intern?useSSL=false","root","root");
  
                    String Query="select * from signup where username=? and password=?";
                    PreparedStatement psm=conn.prepareStatement(Query);
                    psm.setString(1, username);
                    psm.setString(2, password);
                    ResultSet rs=psm.executeQuery();
                    
                    if(rs.next())
                    {
                        response.sendRedirect("home.html");
                    }
                    else
                    {
                        out.println("Login failed! Please enter a valid username and password.");
                    }
                
             
            }
        %>
        
    </body>
</html>
