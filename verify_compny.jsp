<%@ page contentType = "text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.security.SecureRandom" %> 

<html> 
<head>  
<title>JSP Page</title> 
</head> 
<body> 
   <%! 
   public String generateRandomPassword(int len)
    {
        // ASCII range – alphanumeric (0-9, a-z, A-Z)
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
 
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();
 
        // each iteration of the loop randomly chooses a character from the given
        // ASCII range and appends it to the `StringBuilder` instance
 
        for (int i = 0; i < len; i++)
        {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }
 
        return sb.toString();
    }
   %>
<% 
   String password=generateRandomPassword(8);
   String EID=request.getParameter("EID");
   String status="verified";
%> 

<% 
try {
    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance();	
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();
	
	int i=st.executeUpdate("update company_data set status='"+status+"',password='"+password+"' where email='"+EID+"'");
   if(i==1)
   {
  // session.setAttribute("email",EID);
   // session.setAttribute("p",password);  
  // response.sendRedirect("verification.jsp");
     %>
     <form action="verification.jsp" method="post">
    <input type="hidden" name="password" value="<%=password%>"/>
    <input type="hidden" name="email" value="<%=EID%>" />
    <button type="hidden" id="qq" value="Login" style="display: none;"></button>
    </form>
    <script type="text/javascript">
     document.getElementById("qq").click();
    </script>

    <% 
    }
    connection.close();
}catch(Exception ex){
	out.println(ex);
    out.println("Unable to connect to database.");
}
%>

</body> 
</html>
