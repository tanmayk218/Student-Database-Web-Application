<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Survey | Department of Computer Science | GMU</title>

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

.multicolumns
{
	-webkit-column-count:3;
	-moz-column-count:3;
	-o-column-count:3;
	column-count:3;

	-webkit-column-gap: 30px;
	-moz-column-gap: 30px;
	-o-column-gap: 30px;
	column-gap: 30px;
	
	-webkit-column-rule: 1px outset black;
	-moz-column-rule: 1px outset black;
	-o-column-rule: 1px outset black;
	column-rule: 1px outset black;
}



</style>



<link rel="stylesheet" href=".\jquery-ui-1.12.1.custom\jquery-ui.css" />

  <script src=".\jquery-ui-1.12.1.custom\external\jquery\jquery.js"></script>
  <script src=".\jquery-ui-1.12.1.custom\jquery-ui.js"></script>





<script type = "text/javascript" src="./jquery-3.1.1.min.js"></script>
<script type = "text/javascript">


$( function() {
    $( document ).tooltip();
  } );



var now = new Date(); 
 var hour = now.getHours();
 var name;

 if ( hour < 12 )
 var time="Morning";

else
 {
 hour = hour - 12; 
 
 if ( hour < 6 )
 time="afternoon";
 else
 time="evening";
 } 
 

if ( document.cookie )
 {
 var myCookie = unescape( document.cookie );
	var cook=document.cookie.split(";");
	
	for(var i=0;i<cook.length;i++)
	{
		var temp=cook[i];
		var cookieTokens=temp.split("=");
		if(cookieTokens[0]=="name")
		{name = cookieTokens[ 1 ];
			break;
		}
		
		else
		{
		name = window.prompt( "Please enter your name", "Tanmay" );
		document.cookie = "name=" + escape( name );
		}
	}
 
 }  
 else
 {
 name = window.prompt( "Please enter your name", "Tanmay" );

 document.cookie = "name=" + escape( name );
 } 


document.writeln("<center><h4>");
document.writeln("Good "+ time +" "+ name + ", welcome to assignment#3" );
document.writeln( "<a href = 'javascript:wrongPerson()'> " +
 "Click here if you are not " + name + "</a>" );
document.writeln("</h4></center>");
 
 
 function wrongPerson()
 {
 
 document.cookie= "name=null;" +" expires=Thu, 09-Mar-17 00:00:01 GMT";

 location.reload();
 }



function calculate(){

$("#jQuerydialog").html("");


var flag = true;
var num = /^[0-9]+$/; 
data = document.getElementById("data").value.split(",");

for(i=0;i<data.length;i++)
{
	if(data[i]<1 || data[i]>100)
	{
	$("#jQuerydialog").append("<li>Please enter numbers only between 1 and 100</li>");
	flag =  false;
	$("#data").val("");
	break;
	}

	if(isNaN(data[i]))
	{
	$("#jQuerydialog").append("<li>Please enter only integer values</li>");
	flag =  false;
	$("#data").val("");
	}
	
	
	
}


if (data.length<10)
{ $("#jQuerydialog").append("<li>Please enter atleast 10 numbers</li>");
flag =  false;
$("#data").val("");
}

else{
sum = 0;

for (i = 0; i < data.length; i++) {
        sum += parseInt(data[i]);
      }

}




if(flag == false)
			{
				$("#jQuerydialog" ).show();
				$("#jQuerydialog").dialog({
					  modal: true
				});
			}
}


function letters()  
  {  
  
	$("#jQuerydialog").html("");
  
  var stid=document.getElementById("stid");
   var aletter = /^[A-Za-z0-9]+$/; 
   if(stid.value.length==0)  
     {  
      $("#jQuerydialog").append("<li>Student ID is required</li>");
	  {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}
	  return false;
     }  
  else if(!(stid.value.match(aletter)))  
     {  
      	  $("#jQuerydialog").append("<li>Student ID should contain only Alphabets and digits</li>");
	  {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}
	  $("#stid").val("");
	  return false;
     }  
  
	var name=document.getElementById("name");
   var letter = /^[A-Za-z]+$/; 
   if(name.value.length==0)  
     {  
      $("#jQuerydialog").append("<li>Username is required</li>");
	  {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}
	  $("#name").val("");
	  return false;
     }  
   else if(!(name.value.match(letter)))  
     {  
      	  $("#jQuerydialog").append("<li>Username should contain only Alphabets</li>");
	  {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}
	  $("#name").val("");
	  return false;
     }  
   	 
	 var straddr=document.getElementById("straddr");
	 var letter1 = /^[0-9a-zA-Z@_&, ]+$/;  
   if(!(straddr.value.match(letter1)) && straddr.value.length!=0)  
     {  
       
     $("#jQuerydialog").append("<li>Street address should contain only alphanumeric characters</li>");  
	  {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}
	  $("#straddr").val("");
	  return false;
     }  
   
   var city=document.getElementById("city");
	 var letter2 = /^[a-zA-Z ]+$/;  
   if(!(city.value.match(letter2)) && city.value.length!=0)  
     {  
       
     $("#jQuerydialog").append("<li>City field should contain only alphabets</li>");
     {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}
     $("#city").val("");
     return false;
     }
	 
	 var state=document.getElementById("state");
	 var letter3 = /^[a-zA-Z ]+$/;  
   if(!(state.value.match(letter3)) && state.value.length!=0)  
     {  
        
	  $("#jQuerydialog").append("<li>State field should contain only alphabets</li>");
	  {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}  
	  $("#state").val("");
	  return false;
     }
	 
	 var zip=document.getElementById("zip");
	 var letter4 = /^[0-9 ]+$/;  
   if(!(zip.value.match(letter4)) && zip.value.length!=0)  
     {  
      
	 $("#jQuerydialog").append("<li>Zip code field should contain only numbers</li>");
	 {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}  
	 $("#zip").val("");
	 return false;
     }
   
	 var email=document.getElementById("email");
	 var re=/^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
	 if(email.value.length==0)  
     {  
      
	  $("#jQuerydialog").append("<li>Email Id is required</li>");
	  
		 {
				$("#jQuerydialog" ).show();
				$("#jQuerydialog").dialog({
					  modal: true
				});
			}
		 $("#email").val("");
		 return false; 
     }
	 else if(!(email.value.match(re)))  
     {  
      
	 $("#jQuerydialog").append("<li>Invalid email format</li>");
	 
	 {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}
	 $("#email").val("");
	 return false;
     }
	 
	 
	 
	 
	 
	 
	 count = 0;
	for(x=0; x<document.form.checkbox.length; x++){
		if(document.form.checkbox[x].checked==true){
		count++
		}
	}
	
	if(count<2){
		
		$("#jQuerydialog").append("<li>You must select atleast 2 checkboxes</li>");
		 {
				$("#jQuerydialog" ).show();
				$("#jQuerydialog").dialog({
					  modal: true
				});
			}  
		 return false;
	}
	
	 count1 = 0;
	for(y=0; y<document.form.learn.length; y++){
		if(document.form.learn[y].checked==true){
		count1++
		}
	}
	
	if(count1==0){
		
		$("#jQuerydialog").append("<li>You must select atleast 1 radio button</li>");
		{
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}  
	 return false;
	}
	 
	
	
	 var year=document.getElementById("year");
	 var aletter4 = /^[0-9]+$/;  
 if(!(year.value.match(aletter4)) && year.value.length!=0)  
   {  
    
	 $("#jQuerydialog").append("<li>Year field should contain only numbers</li>");
	 {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}  
	 $("#year").val("");
	 return false;
   }
 else if (year.value.length!=4) 
 {  
	    
	 $("#jQuerydialog").append("<li>Invalid year</li>");
	 {
			$("#jQuerydialog" ).show();
			$("#jQuerydialog").dialog({
				  modal: true
			});
		}  
	 $("#year").val("");
	 return false;
   }
	
  }

function number(){

var data = document.getElementById("data");
var out = document.getElementById("avg");
var num=data.value;
out.value=num;
}



function auto()
 {
$.ajax({
       url: './zip.json',
       success: function(result, success) {
    	console.log("success"); 
		console.log(result);
   		z1=$("#zip").val();
		for(var i=0;i<result.zipcodes.length;i++)
        { 
			if(z1==result.zipcodes[i].zip)
            {
			document.getElementById("city").value=result.zipcodes[i].city;
			document.getElementById("state").value=result.zipcodes[i].state;
			break;
			}
         }
},
error: function(result, success) {

    console.log(result);

  }
});
}

</script>
</head>
<body style="background-color:#d6d6d6;">



<div class="padded-row">
<div id="cs-logo">

<p>&nbsp;</p>
<p>&nbsp;</p>

				
<h1 style="LINE-HEIGHT:10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department of Computer Science</h1></p>
<p>&nbsp;</p>
<hr style="height:20px; border:none;color:blue;background-color:rgb(80,120,80);">

<div id="jQuerydialog" title="A jQuery UI Dialog" style="display:none"></div>
<h3><center>Please fill the following survey form for your feedback regarding the campus visit</center></h3>
<form method = "POST" autocomplete="on" name="form" id="form" action="processStudentDetails">


<div class="multicolumns">
<center>

Student ID:<font color=red >*</font><br>
<input type = text id="stid" name="stid"  autofocus><br><br><br>

Username:<font color=red >*</font><br>
<input type = text id="name" name="name"><br><br><br>


Enter 10 integers (comma seperated):<br><input type = text name="data" id="data" onblur="calculate()" required><br><br><br>


Street Address:
<br><input type = text id="straddr" name="straddr"><br><br><br>

City:<br><input type = text id="city" name="city"><br><br><br><br>


State:<br><input type = text id="state" name="state"></span><br><br><br><br><br>


Zip:<br><input type = text id="zip" name="zip" onblur="auto()"><br><br><br>

Tel no.:<br><input type = tel placeholder="(XXX) XXX-XXXX" id="tel" name="tel"><br><br><br>

email:<font color=red>*</font><br><input type = email id="email" name="email" placeholder="abc@xyz.com" ><br><br><br>


URL:<br><input type = URL placeholder="http://www.yourURL.com" id="url" name="url"><br><br><br>


Date of Survey:<font color=red>*</font><br><input type = date placeholder="" id="date" name="date" required><br><br><br>

What did you like the most about the campus?<br>

<input type="checkbox" name="checkbox" id="Students" value="Students">
<label for="Students">Students</label>
<input type="checkbox" name="checkbox" id="Location" value="Location">
<label for="Location">Location</label>
<input type="checkbox" name="checkbox" id="Campus" value="Campus">
<label for="Campus">Campus</label>
<input type="checkbox" name="checkbox" id="Atmosphere" value="Atmosphere">
<label for="Atmosphere">Atmosphere</label>
<input type="checkbox" name="checkbox" id="Dorm Rooms" value="Dorm Rooms">
<label for="Dorm Rooms">Dorm Rooms</label>
<input type="checkbox" name="checkbox" id="Sports" value="Sports">
<label for="Sports">Sports</label><br><br><br>

How did you learn about this University?<br>
<td><input type="radio" name="learn" id="Friends" value="Friends">
<label for="Friends">Friends</label>
<input type="radio" name="learn" id="Television" value="Television">
<label for="Television">Television</label>
<input type="radio" name="learn" id="Internet" value="Internet">
<label for="Internet">Internet</label>
<input type="radio" name="learn" id="Other" value="Other">
<label for="Other">Other</label><br><br><br><br>

Additional Comments:<br>
<textarea rows="5" cols="50" id="adcom" name="adcom"></textarea><br><br><br>

Please state your high school graduation month:<br>
<input list ="months" name="months"/>
<datalist id ="months">
<option value = "January">
<option value = "February">
<option value = "March">
<option value = "April">
<option value = "May">
<option value = "June">
<option value = "July">
<option value = "August">
<option value = "September">
<option value = "October">
<option value = "November">
<option value = "December">
</datalist><br><br><br>

Year:<br><input type="text" id="year" name="year"><br><br><br>

Would you recommend this school to others?<br>
<select id="recom" name="reco" required>
 <option value="Very Likely" id="reco">Very Likely</option>
 <option value="Likely" id="reco">Likely</option>
 <option value="Unlikely" id="reco">Unlikely</option>
</select> <br><br><br>

Click 'Submit'  to submit your answers<br><center><input onclick="return letters()" type="submit" id="submit"   name="submit" value="Submit" width="10">&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="Reset" width="10"></center>
<br><br><br>

</table>
</center>
</form>
</div>

Tanmay Kharshikar
<a href="https://www2.gmu.edu/" title="Please visit http://www.gmu.edu for more information."><img src="logo1.png" class="image" alt="Mason logo"></a>
<a href="https://www2.gmu.edu/" title="Please visit http://www.gmu.edu for more information."><img src="logo1.png" class="image2" alt="Mason logo"></a>

</body>
</html>