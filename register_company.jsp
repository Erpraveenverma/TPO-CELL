<%@ page contentType = "text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 
<% 
   String company_name=request.getParameter("company_name");
   String since=request.getParameter("since");
   String contact_no=request.getParameter("contact_no");
   String email_id=request.getParameter("email"); 
   String location=request.getParameter("location");
   String company_website=request.getParameter("company_website");
   String description="";
   String facebook="";
   String twitter="";
   String google="";
   String linkedin="";
   String password="";
   String status="unverified";
%> 
<% 
try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();	
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();
	
	int i=st.executeUpdate("insert into company_data(name,since,email,location,contact_no,website,description,facebook,twitter,google,linkedin,password,status)values('"+company_name+"','"+since+"','"+email_id+"','"+location+"','"+contact_no+"','"+company_website+"','"+description+"','"+facebook+"','"+twitter+"','"+google+"','"+linkedin+"','"+password+"','"+status+"')");

%>
   <form action="information_send.jsp" method="post">
    <input type="hidden" name="email" value="<%=email_id%>" />
    <button type="hidden" id="qq" value="Login" style="display: none;"></button>
    </form>
    <script type="text/javascript">
     document.getElementById("qq").click();
    </script>

<%
	//response.sendRedirect("information_send.jsp");
    connection.close();
}catch(Exception ex){
	out.println(ex);
    out.println("Unable to connect to database.");
}
%>

</body> 
</html>
