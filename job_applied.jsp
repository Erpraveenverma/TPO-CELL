<%@ page contentType = "text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 


<% String job_id=request.getParameter("jid"); 
	String ID=(String)session.getAttribute("id");
	out.println(ID);

try {
	
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();
	
	int i=st.executeUpdate("insert into applied_job values('"+job_id+"','"+ID+"')");
	response.sendRedirect("student_applied_jobs.jsp");
    


connection.close();
} 
catch(Exception ex){
out.println("Unable to connect to database.");
out.println(ex);
}
%>



</body> 
</html>

