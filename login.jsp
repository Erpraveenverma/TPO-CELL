<%@ page contentType = "text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 




<% String email=request.getParameter("email"); 
String password=request.getParameter("password"); 
String user=request.getParameter("user");

%> 
<% 
if(user.equals("Company"))
{
try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();

    String sql ="SELECT email,password,name from company_data where email='"+email+"' and password='"+password+"'";
	ResultSet rs= st.executeQuery(sql);
	
	if(rs.next())
	{
		String ID=rs.getString("email");
        session.setAttribute("id",ID);
        String user1=rs.getString("name");
        session.setAttribute("user",user1); 
		response.sendRedirect("company_profile.jsp");
		
	}
	else
	{
		out.println("invalid info.....");
		response.setHeader("Refresh", "1;url=home.html");
	}
	
    connection.close();
}catch(Exception ex)
{
    out.println("Unable to connect to database.");
}

}

else
{
	if(user.equals("Student"))
	{

try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();

    String sql ="SELECT email,password,department,name from student_data where email='"+email+"' and password='"+password+"'";
	ResultSet rs= st.executeQuery(sql);
	
	if(rs.next())
	{
		String ID=rs.getString("email");
        session.setAttribute("id",ID);
        String department1=rs.getString("department");
        session.setAttribute("department",department1);
        String user1=rs.getString("name");
        session.setAttribute("user",user1); 
		response.sendRedirect("student_profile.jsp");
		
	}
	else
	{
		out.println("invalid info.....");
		response.setHeader("Refresh", "1;url=home.html");
	}
	
    connection.close();
}catch(Exception ex)
{
    out.println("Unable to connect to database.");
}

}

else
	{

	try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();

    String sql ="SELECT email,password from admin where email='"+email+"' and password='"+password+"'";
	ResultSet rs= st.executeQuery(sql);
	
	if(rs.next())
	{
		
		
		response.sendRedirect("admin_verify_company.jsp");
		
	}
	else
	{
		out.println("invalid info.....");
		response.setHeader("Refresh", "1;url=home.html");
	}
	
    connection.close();
}catch(Exception ex)
{
    out.println("Unable to connect to database.");
}

}

}
%>


</body> 
</html>

