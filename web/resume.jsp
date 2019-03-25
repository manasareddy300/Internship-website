<%-- 
    Document   : resume
    Created on : 25 Nov, 2018, 12:54:40 PM
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
            
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String phnum=request.getParameter("phnum");
            String address=request.getParameter("address");
            String gender=request.getParameter("gender");
            String jobtype=request.getParameter("jobtype");
            String prefer=request.getParameter("prefer");
            String fileuploaded=request.getParameter("fileuploaded");
            
            
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/intern?useSSL=false","root","root");
        
              CallableStatement calstat=con.prepareCall("{call resume(?,?,?,?,?,?,?,?,?)}");
              
            
            
            calstat.setString(1,firstname);
            calstat.setString(2,lastname);
            calstat.setString(3,email);
            calstat.setString(4,phnum);
            calstat.setString(5,address);
            calstat.setString(6,gender);
            calstat.setString(7,jobtype);
            calstat.setString(8,prefer);
            calstat.setString(9,fileuploaded);
            ResultSet rs= calstat.executeQuery();
            con.close();
            calstat.close();
            //out.println("your data has been inserted into table.");
            response.sendRedirect("home.html");
           %>
    </body>
</html>
