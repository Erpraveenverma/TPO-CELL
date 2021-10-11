<%@ page contentType = "text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 
<% 
   String ID=(String)session.getAttribute("id");
   String contact_no=request.getParameter("contact");
   String website=request.getParameter("website");
   String description=request.getParameter("description");
   String facebook=request.getParameter("facebook");
   String google=request.getParameter("google");
   String twitter=request.getParameter("twitter");
   String linkedin=request.getParameter("linkedin");
%> 
<% 
try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();	
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();
	
	int i=st.executeUpdate("update company_data set contact_no='"+contact_no+"',website='"+website+"',description='"+description+"',facebook='"+facebook+"',twitter='"+twitter+"',google='"+google+"',linkedin='"+linkedin+"' where email='"+ID+"'");
	response.sendRedirect("company_profile.jsp");
    
    connection.close();
}catch(Exception ex){
	out.println(ex);
    out.println("Unable to connect to database.");
}
%>

</body> 
</html>
