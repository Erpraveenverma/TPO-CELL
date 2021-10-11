<%@ page contentType = "text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 
<% 
   String old_password=request.getParameter("old_password");
   String new_password=request.getParameter("new_password");
   

try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();	
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();
   String sql ="SELECT password from admin where password='"+old_password+"'";
   ResultSet rs= st.executeQuery(sql);
   if(rs.next())
   {
       
     
          int i=st.executeUpdate("update admin set password='"+new_password+"'");
          out.println("Password Updated!!!");
    response.setHeader("Refresh", "1;url=admin_change_password.jsp");
   }
   else
   {
      out.println("Password Mismatch!!! try Again");
    response.setHeader("Refresh", "1;url=admin_change_password.jsp");
   }
	
    connection.close();
}catch(Exception ex){
	out.println(ex);
    out.println("Unable to connect to database.");
}
%>


</body> 
</html>
