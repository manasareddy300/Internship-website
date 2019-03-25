x<%-- 
    Document   : add
    Created on : 25 Nov, 2018, 11:46:54 PM
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
            String id=request.getParameter("id");
            String companyname=request.getParameter("companyname");
            String location=request.getParameter("location");
            String duration=request.getParameter("duration");
            String stipend=request.getParameter("stipend");
          
            String interns=request.getParameter("interns");
            String perk=request.getParameter("perk");
            String skill=request.getParameter("skill");
            String descr=request.getParameter("descr");
            
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/intern?useSSL=false","root","root");
        
              CallableStatement calstat=con.prepareCall("{call comp(?,?,?,?,?,?,?,?,?)}");
              
            calstat.setString(1,id);
            calstat.setString(2,companyname);
            calstat.setString(3,location);
            calstat.setString(4,duration);
            calstat.setString(5,stipend);
            
            calstat.setString(6,interns);
            calstat.setString(7,perk);
            calstat.setString(8,skill);
            calstat.setString(9,descr);
            
            ResultSet rs= calstat.executeQuery();
            con.close();
            calstat.close();
            //out.println("your data has been inserted into table.");
            response.sendRedirect("adminhome.html");
           %>
    </body>
</html>
