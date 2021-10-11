<%@ page contentType = "text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 
<% String name=request.getParameter("name"); 
   String email=request.getParameter("email");
   String rollno=request.getParameter("rollno");
   String password=request.getParameter("password");
   String department=request.getParameter("department"); 
   String contact=request.getParameter("Contact_no");
   String description="";
   String facebook="";
   String twitter="";
   String google="";
   String linkedin="";
   String website="";
  %> 
<% 
try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();	
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();
	int i=st.executeUpdate("insert into student_data(name,email,roll_no,password,department,contact_no,description,facebook,twitter,google,linkedin,website)values('"+name+"','"+email+"','"+rollno+"','"+password+"','"+department+"','"+contact+"','"+description+"','"+facebook+"','"+twitter+"','"+google+"','"+linkedin+"','"+website+"')");
	out.println("You have successfully registered!!");
    
    connection.close();
}catch(Exception ex){
	out.println(ex);
    out.println("Unable to connect to database.");
}
%>

</body> 
</html>
