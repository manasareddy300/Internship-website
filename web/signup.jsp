<%-- 
    Document   : signup
    Created on : 17 Nov, 2018, 5:58:55 PM
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
        <%@ page import ="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
        <% 
            String username=request.getParameter("username");
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String password=request.getParameter("password");
            String cpassword=request.getParameter("cpassword");
            String email=request.getParameter("email");
            String phnum=request.getParameter("phnum");
            String gender=request.getParameter("gender");
            
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/intern?useSSL=false","root","root");
        
              CallableStatement calstat=con.prepareCall("{call signup(?,?,?,?,?,?,?,?)}");
            
            calstat.setString(1,username);
            calstat.setString(2,firstname);
            calstat.setString(3,lastname);
            calstat.setString(4,password);
            calstat.setString(5,cpassword);
            calstat.setString(6,email);
            calstat.setString(7,phnum);
            calstat.setString(8,gender);
            
            ResultSet rs= calstat.executeQuery();
            con.close();
            calstat.close();
            //out.println("your data has been inserted into table.");
            response.sendRedirect("index.html");
           %>
    </body>
</html>
