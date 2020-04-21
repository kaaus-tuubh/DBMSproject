<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!doctype html>
<html>
 <head><title>Student Login  </title>
 <link rel="stylesheet" href="css/new01.css">
 <link rel="stylesheet" href="css/bootstrap.min.css">

 </head>
 <body class="bg" link="blue">
 <br>
 &nbsp&nbsp<a href="LoginAdmin.jsp">Teacher Login</a>
 
 <form method="post" action="login">

 <div class="container back">
      <div class = "container">
     <div align=center>
<div class="input-tag">STUDENT LOGIN<br>
 <input  type="text" name="RegID" placeholder="Student ID">
 
<input type="password" name="Pass_word" placeholder="Password">

</div>
      <span>
  	<input type="submit" value="Submit" class="btn btn-info"> 
  	<input type="reset" value = "Reset" class="btn btn-info"> 
      </span>



<div class="row">
<div class="col-md-3"></div>
<div class="col-md-3">
	<div class="icon">
	<div class="link-1">No login yet ? &nbsp<a href="Signup.jsp"> Sign Up</a></div></div>
</div>

<div class="col-md-3">
	<div class="link-1"><a href=#>FORGOT PASSWORD ?</a></div>
</div>

<div class="col-md-3"></div>

</div>
</div>
 
  </div></div>
  </form>
  </body>
  </html>