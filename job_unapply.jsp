<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 
<% 
try {
    String job_id=request.getParameter("jid");
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();	
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();
    
    int i=st.executeUpdate("DELETE FROM applied_job WHERE  job_id='"+job_id+"'");
	 response.sendRedirect("student_applied_jobs.jsp");
    
    connection.close();
}catch(Exception ex){
	out.println(ex);
    out.println("Unable to connect to database.");
}
%>

</body> 
</html>
