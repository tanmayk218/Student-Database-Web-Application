<%@page import="contents.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Details</title>
<style>
table, th, td {
    border: 5px solid rgb(80,120,80);
    border-collapse: collapse;
}

h1 { text-shadow: 5px 5px 0px grey; font-family: tahoma, helvetica, sans-serif; color:blue; font-size: 40px;}

h2 { font-family: tahoma, helvetica, sans-serif; color:rgb(80,120,80); font-size: 30px;}
h3 { font-family: tahoma, helvetica, sans-serif; color:rgb(80,120,80); font-size: 20px;}
h4 { font-family: tahoma, helvetica, sans-serif; color:rgb(80,120,80); font-size: 15px;}
</style>
</head>
<body style="background-color:#d6d6d6;">

<p>&nbsp;</p>
<p>&nbsp;</p>

				
<h1 style="LINE-HEIGHT:10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department of Computer Science</h1></p>
<p>&nbsp;</p>
<hr style="height:20px; border:none;color:blue;background-color:rgb(80,120,80);">
<%
	StudentBean studentBean = (StudentBean)session.getAttribute("studentDetailsBean");
	String studentID = (String) request.getAttribute("studentID");
%>
 <h3>Welcome to the Student Details Page</h3>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <h4>The Student details you requested are: </h4>
 
 <table border="1">
 	<tr>
 		<td>First Name</td>
 		<td><%=studentID%></td>
 	</tr>
 	<tr>
 		<td>First Name</td>
 		<td><%=studentBean.getName() %></td>
 	</tr>
 	
 	<tr>
 		<td>Address</td>
 		<td><%=studentBean.getStraddr() %></td>
 	</tr>
 	<tr>
 		<td>Zip Code</td>
 		<td><%=studentBean.getZip() %></td>
 	</tr>
 	<tr>
 		<td>City</td>
 		<td><%=studentBean.getCity()%></td>
 	</tr>
 	<tr>
 		<td>State</td>
 		<td><%=studentBean.getState()%></td>
 	</tr>
 	<tr>
 		<td>Tel No</td>
 		<td><%=studentBean.getTel()%></td>
 	</tr>
 	<tr>
 		<td>Email ID</td>
 		<td><%=studentBean.getEmail()%></td>
 	</tr>
 	<tr>
 		<td>High School Month</td>
 		<td><%=studentBean.getMonths()%></td>
 	</tr>
 	<tr>
 		<td>High School Year</td>
 		<td><%=studentBean.getYear()%></td>
 	</tr>
 	<tr>
 		<td>URL</td>
 		<td><%=studentBean.getUrl()%></td>
 	</tr>
 	<tr>
 		<td>Date of Survey</td>
 		<td><%=studentBean.getDate()%></td>
 	</tr>
 	<tr>
 		<td>Thing Liked on Campus</td>
 		<td><%=studentBean.getLikeUni()%></td>
 	</tr>
 	<tr>
 		<td>Things Interested in GMU</td>
 		<td><%=studentBean.getLearn()%></td>
 	</tr>
 	<tr>
 		<td>Likelihood of Recommending University</td>
 		<td><%=studentBean.getReco()%></td>
 	</tr>
 	<tr>
 		<td>Additional Comments</td>
 		<td><%=studentBean.getAdcom()%></td>
 	</tr>	
 </table>
</body>
</html>