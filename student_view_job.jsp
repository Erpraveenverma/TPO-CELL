<%@ page contentType = "text/html" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>JCD TPO</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="CreativeLayers">

	<!-- Styles -->
	<link rel="stylesheet" type="text/css" href="css/bootstrap-grid.css" />
	<link rel="stylesheet" href="css/icons.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/responsive.css" />
	<link rel="stylesheet" type="text/css" href="css/chosen.css" />
	<link rel="stylesheet" type="text/css" href="css/colors/colors.css" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<!-- <link rel="stylesheet" href="css/font-awesome.min.css" /> -->
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
	
</head>
<body>

<% 
	
	String user=(String)session.getAttribute("user");
	String ID=(String)session.getAttribute("id");
	String department1=(String)session.getAttribute("department");
	String jid=request.getParameter("jid");

	String job_title="";
	String description="";
	String email="";
	String job_type="";
	String department="";
	String salary="";
	String date="";
	String skill="";
	String job_location="";
	String address="";

try {

    String connectionURL = "jdbc:mysql://localhost:3306/tpo";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "");
	Statement st=connection.createStatement();

    String sql ="SELECT * from job_data where job_id='"+jid+"'";
	ResultSet rs= st.executeQuery(sql);

	while(rs.next())
		{ 
			job_title=rs.getString(1);
			description=rs.getString(2);
			email=rs.getString(3);
			job_type=rs.getString(4);
			department=rs.getString(5);
			salary=rs.getString(6);
			date=rs.getString(7);
			skill=rs.getString(8);
			job_location=rs.getString(9);
			address=rs.getString(10);

		}	
		connection.close();
		}
								catch(Exception ex){
    							out.println("Unable to connect to database.");
								out.println(ex);}
	%>


<div class="page-loading">
	<img src="images/loader.gif" alt="" />
	<span>Skip Loader</span>
</div>

<div class="theme-layout" id="scrollup">
	
	
	
	<header class="stick-top">
		<div class="menu-sec">
			<div class="container">
				<div class="logo">
					<a href="index.html" title=""><img src="images/resource/logo.png" alt="" /></a>
				</div><!-- Logo -->
				<div class="my-profiles-sec">
					<span><%=user %> <i class="la la-bars"></i></span>
				</div>
				
				<nav>
					<ul>
						<li >
							<a href="home.html" title="">Home</a>
						</li>
						<li >
							<a href="about_us.html" title="">About Us</a>
						</li>
						<li >
							<a href="contact_us.html" title="">Contact Us</a>
						</li>
						<li >
							<a href="gallary.html" title="">Gallary</a>
						</li>
					</ul>
				</nav><!-- Menus -->
			</div>
		</div>
	</header>

	<section class="overlape">
		<div class="block no-padding">
			<div data-velocity="-.1" style="background: url(images/resource/mslider1.jpg) repeat scroll 50% 422.28px transparent;" class="parallax scrolly-invisible no-parallax"></div><!-- PARALLAX BACKGROUND IMAGE -->
			<div class="container fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner-header">
							<h3>Welcome <%=user %></h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="block no-padding">
			<div class="container">
				 <div class="row no-gape">
				 	<aside class="col-lg-3 column border-right">
				 		<div class="widget">
				 			<div class="tree_widget-sec">
				 				<ul>
				 					<li><a href="student_profile.jsp" title=""><i class="la la-file-text"></i>My Profile</a></li>
									
									<li><a href="student_applied_jobs.jsp" title=""><i class="la la-paper-plane"></i>Applied Job</a></li>
									<li><a href="student_job_alert.jsp" title=""><i class="la la-user"></i>Job Alerts</a></li>
									
									<li><a href="student_change_password.jsp" title=""><i class="la la-flash"></i>Change Password</a></li>
									<li><a href="logout.jsp" title=""><i class="la la-unlink"></i>Logout</a></li>
				 				</ul>
				 			</div>
				 		</div>
				 		<div class="widget">
				 			<div class="skill-perc">
				 				<h3>Skills Percentage </h3>
				 				<p>Put value for "Cover Image" field to increase your skill up to "15%"</p>
				 				<div class="skills-bar">
				 					<span>85%</span>
				 					<div 
				 						class="second circle" 
				 						data-size="155"
				 						data-thickness="60">
								    </div>
				 				</div>
				 			</div>
				 		</div>
				 	</aside>
				 	<div class="col-lg-9 column">
				 		<div class="padding-left">
					 		<div class="profile-title">
					 			<h3>Job Details</h3>
					 			
					 			
					 		</div>
					 		<div class="profile-form-edit">
					 			<form >
					 				<div class="row">
					 					<div class="col-lg-12">
					 						<span class="pf-title">Job Title</span>
					 						<div class="pf-field">
					 							<input type="text" placeholder="Job Title" name="job_title" value="<%=job_title %>" required readonly/>
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						<span class="pf-title">Description</span>
					 						<div class="pf-field">
					 							<textarea name="description" required readonly>
					 								<%=description %>
					 							</textarea>
					 						</div>
					 					</div>
					 					<div class="col-lg-6">
					 						<span class="pf-title">Email</span>
					 						<div class="pf-field">
					 							<input type="text" value="<%=ID %>" name="email" required readonly/>
					 						</div>
					 					</div>
					 					
					 					<div class="col-lg-6">
					 						<span class="pf-title">Job Type</span>
					 						<div class="pf-field">
					 							<input type="text" value="<%=job_type %>" name="job_type" required readonly/>
					 						</div>
					 					</div>
					 					<div class="col-lg-6">
					 						<span class="pf-title">Department</span>
					 						<div class="pf-field">
					 							<input type="text" value="<%=department %>" name="department" required readonly/>
					 						</div>
										</div>
					 					<div class="col-lg-6">
					 						<span class="pf-title">Salary</span>
					 						<div class="pf-field">
					 							<input type="text" name="salary" value="<%=salary %>" required readonly/>
					 						</div>
					 					</div>
					 					
					 					<div class="col-lg-12">
					 						<span class="pf-title">Application Deadline Date</span>
					 						<div class="pf-field">
					 							<input type="text" placeholder="01.11.207"  class="form-control datepicker" name="date" value="<%=date %>" required readonly/>
					 						</div>
					 					</div>
					 					<div class="col-lg-6">
					 						<span class="pf-title">Skill Requirments</span>
					 						<div class="pf-field">
					 							<input type="text" name="skill" value="<%=skill %>" required readonly/>
					 						</div>
					 					</div>
					 					<div class="col-lg-6">
					 						<span class="pf-title">Job Location</span>
					 						<div class="pf-field">
					 							<input type="text" value="<%=job_location %>" name="job_location" required readonly/>
					 						</div>
					 					</div>
					 					<div class="col-lg-12">
					 						<span class="pf-title">Complete Address</span>
					 						<div class="pf-field">
					 							<textarea name="address" required readonly>
					 								<%=address %>
					 							</textarea>
					 						</div>
					 					</div>

					 				</div>
					 			
					 			</form>
					 		</div>
					 		
					 		
					 	</div>
					</div>
				 </div>
			</div>
		</div>
	</section>

		<footer>
		<div class="block">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 column">
						<div class="widget">
							<div class="about_widget">
								<div class="logo">
									<a href="index.html" title=""><img src="images/resource/logo.png" alt="" /></a>
								</div>
								<span>Barnala Road Near Sirsa Jail Sirsa,(Haryana).</span>
								<span>7494963626</span>
								<span>info@jcd.com</span>
								<div class="social">
									<a href="#" title=""><i class="fa fa-facebook"></i></a>
									<a href="#" title=""><i class="fa fa-twitter"></i></a>
									<a href="#" title=""><i class="fa fa-linkedin"></i></a>
								</div>
							</div><!-- About Widget -->
						</div>
					</div>
					<div class="col-lg-4 column">
						<div class="widget">
							<h3 class="footer-title">Frequently Asked Questions</h3>
							<div class="link_widgets">
								<div class="row">
									<div class="col-lg-6">
										<a href="#" title="">Privacy & Seurty </a>
										<a href="#" title="">Terms of Serice</a>
										<a href="#" title="">Communications </a>
										<a href="#" title="">Referral Terms </a>
										<a href="#" title="">Lending Licnses </a>
										<a href="#" title="">Disclaimers </a>	
									</div>
									<div class="col-lg-6">
										<a href="#" title="">Support </a>
										<a href="#" title="">How It Works </a>
										<a href="#" title="">Contact Us</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2 column">
						<div class="widget">
							<h3 class="footer-title">Options</h3>
							<div class="link_widgets">
								<div class="row">
									<div class="col-lg-12">
										<a href="#" title="">Home</a>	
										<a href="#" title="">About US</a>	
										<a href="#" title="">Gallary</a>		
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 column">
						<div class="widget">
							<div class="download_widget">
								<a href="#" title=""><img src="images/resource/dw1.png" alt="" /></a>
								<a href="#" title=""><img src="images/resource/dw2.png" alt="" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom-line">
			<span>?? 2018 JCD All rights reserved.</span>
			<a href="#scrollup" class="scrollup" title=""><i class="la la-arrow-up"></i></a>
		</div>
	</footer>

</div>

<div class="profile-sidebar">
	<span class="close-profile"><i class="la la-close"></i></span>
	<div class="can-detail-s">
		<div class="cst"><img src="images/resource/es1.png" alt="" /></div>
		<h3><%=user %></h3>
		<span><i>Student</i> at JCD</span>
		<p><a href="#"><%=ID %></a></p>
		<p><%=department1 %></p>
		<p><i class="la la-map-marker"></i>Sirsa / Haryana</p>
	</div>
	<div class="tree_widget-sec">
		<ul>
			<li><a href="student_profile.jsp" title=""><i class="la la-file-text"></i>My Profile</a></li>
			
			<li><a href="student_applied_jobs.jsp" title=""><i class="la la-paper-plane"></i>Applied Job</a></li>
			<li><a href="student_job_alert.jsp" title=""><i class="la la-user"></i>Job Alerts</a></li>
			
			<li><a href="student_change_password.jsp" title=""><i class="la la-flash"></i>Change Password</a></li>
			<li><a href="logout.jsp" title=""><i class="la la-unlink"></i>Logout</a></li>
		</ul>
	</div>
</div><!-- Profile Sidebar -->
<script src="js/jquery.min.js" type="text/javascript"></script>
<script data-cfasync="false" src="js/email-decode.min.js"></script>
<script src="js/modernizr.js" type="text/javascript"></script>
<script src="js/script.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/wow.min.js" type="text/javascript"></script>
<script src="js/slick.min.js" type="text/javascript"></script>
<script src="js/parallax.js" type="text/javascript"></script>
<script src="js/select-chosen.js" type="text/javascript"></script>
<script src="js/jquery.scrollbar.min.js" type="text/javascript"></script>
<script src="js/circle-progress.min.js" type="text/javascript"></script>
<script src="js/tag.js" type="text/javascript"></script>
<script src="js/maps3.js" type="text/javascript"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYc537bQom7ajFpWE5sQaVyz1SQa9_tuY&sensor=true&libraries=places"></script>


</body>
</html>

