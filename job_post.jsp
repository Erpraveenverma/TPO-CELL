<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 
<% 
    int n=0;
	String job_title=request.getParameter("job_title");
   String description=request.getParameter("description");
   String email=request.getParameter("email");
   String job_type=request.getParameter("job_type");
   String department=request.getParameter("department"); 
   String salary=request.getParameter("salary");
   String date=request.getParameter("date");
   String skill=request.getParameter("skill");
   String job_location=request.getParameter("job_location");
   String address=request.getParameter("address");
   

  %> 
<% 
try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();	
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();
    ResultSet rs3=st.executeQuery("select max(job_id) from job_data");
    try
        {
    if(rs3.next())
    {
        n=Integer.parseInt(rs3.getString(1));
        n++;
       
    }
    
        }
        catch(Exception e)
        {
            n=1;
        }
	
	int i=st.executeUpdate("insert into job_data values('"+job_title+"','"+description+"','"+email+"','"+job_type+"','"+department+"','"+salary+"','"+date+"','"+skill+"','"+job_location+"','"+address+"',"+n+")");
	
    response.sendRedirect("company_post_new.jsp");
    connection.close();
}catch(Exception ex){
	out.println(ex);
    out.println("Unable to connect to database.");
}
%>

</body> 
</html>
