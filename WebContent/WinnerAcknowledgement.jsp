<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="contents.DataBean"%>
<%@page import="contents.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Winner Acknowledgement JSP</title>
<style type = "text/css">
em { font-weight: bold; color: black }
h1 { text-shadow: 5px 5px 0px grey; font-family: tahoma, helvetica, sans-serif; color:blue; font-size: 40px;}
.h41 { font-family: tahoma, helvetica, sans-serif; color:rgb(80,120,80)}
.h31 { font-family: tahoma, helvetica, sans-serif; color:rgb(80,120,80); font-size:20px;}
.p1  { font-size: 15pt; font-family: arial, sans-serif; padding-left:5cm; padding-right:5cm; text-align: center;}

.image { height: 90px; width: 120px; position:fixed; bottom: 0px; right: 10px; }
.image2 { height:130px; width: 185px; position:absolute; top: 40px; left: 10px; }

td { text-align: center;}





h1 { text-shadow: 5px 5px 0px grey; font-family: tahoma, helvetica, sans-serif; color:blue; font-size: 40px;}

h2 { font-family: tahoma, helvetica, sans-serif; color:rgb(80,120,80); font-size: 30px;}
h3 { font-family: tahoma, helvetica, sans-serif; color:rgb(80,120,80); font-size: 20px;}
h4 { font-family: tahoma, helvetica, sans-serif; color:rgb(80,120,80); font-size: 15px;}


p { margin-left: 5cm; margin-right: 5cm; text-align: justify;}

.list { margin-left: 5cm; margin-right: 2cm;}

 
li { margin-left: 2cm; margin-right: 2cm;}

ul { margin-left: 0cm;margin-right: 2cm; }


.font1 { margin-left: 5cm; margin-right: 2cm; font-size: 25px;}

.font2 { margin-left: 5cm; margin-right: 2cm; font-size: 20px;}
	</style>

</head>
<body style="background-color:#d6d6d6;">
<%@ taglib prefix="s" uri="/struts-tags" %>
<p>&nbsp;</p>
<p>&nbsp;</p>

				
<h1 style="LINE-HEIGHT:10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department of Computer Science</h1></p>
<p>&nbsp;</p>
<hr style="height:20px; border:none;color:blue;background-color:rgb(80,120,80);">
<%
		StudentBean studentBean = (StudentBean) session.getAttribute("studentBean");
		DataBean databean = (DataBean) session.getAttribute("dataBean");
		ArrayList<String> studentList = (ArrayList<String>) session.getAttribute("studentIDList");
%>
	
	<h3>Winner Acknowledgement</h3>
	<h4>Thank You, ${name} for completing the survey</h4>
	<h4>Congratulations ${name}, you have won 2 movie tickets</h4>
	<h4>Mean: <%= databean.getMean() %></h4>
	<h4>Standard Deviation: <%= databean.getStandardDeviation() %></h4>
	<h4>Information has been saved successfully</h4><hr>
<form action="populateStudentDetails" name="studentdetails">
<ul>
<% for(int i = 0; i < studentList.size(); i+=1) { %>
 	<li><button class="buttonlink buttonlink:hover" type = "submit" name="studentlinks" value="<%=studentList.get(i) %>"><%= studentList.get(i) %></button></a></li> 
 <%} %>
</ul>
</form>
</body>
</html>