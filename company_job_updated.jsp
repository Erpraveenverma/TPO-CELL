<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 
<% 
    String jid=request.getParameter("jid");
	String job_title=request.getParameter("job_title");
   String description=request.getParameter("description");
   String salary=request.getParameter("salary");
   String date=request.getParameter("date");
   String skill=request.getParameter("skill");
   String address=request.getParameter("address");
   

  %> 
<% 
try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();	
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();
	
	int i=st.executeUpdate("update job_data set job_title='"+job_title+"',description='"+description+"',salary='"+salary+"',date='"+date+"',skill='"+skill+"',address='"+address+"' where job_id='"+jid+"'");
	
    response.sendRedirect("company_manage_jobs.jsp");
    connection.close();
}catch(Exception ex){
	out.println(ex);
    out.println("Unable to connect to database.");
}
%>

</body> 
</html>
