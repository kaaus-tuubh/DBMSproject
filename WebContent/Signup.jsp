<!DOCTYPE html>
<html>
<head>
<title>Sign Up ! </title>
<script>
function validateForm() {
  var x = document.forms["myForm"]["firstname"].value;
  var y = document.forms["myForm"]["middlename"].value;
  var z = document.forms["myForm"]["lastname"].value;
  var e = document.forms["myForm"]["email"].value;
  var c = document.forms["myForm"]["contact"].value;
  var p = document.forms["myForm"]["pwd"].value;
  var rp = document.forms["myForm"]["rpwd"].value;
  var reg = document.forms["myForm"]["regid"].value;
  var ay = document.forms["myForm"]["admyear"].value;
  
  var letters = /^[A-Za-z]+$/;
  var letterNumber = /^[0-9a-zA-Z]+$/;
  var num=/^[0-9]{4}$/;

  if (x == "") {
    alert("First Name must be filled out");
    return false;
  }

  if(x.match(letters))
  {
 
  }
   else
   {
     alert("First Name should contain alphabets only");
     return false;
   }

  if (y == "") {
    alert("Middle Name must be filled out");
    return false;
  }
  if(y.match(letters))
  {
      
  }
   else
   {
     alert("Middle Name should contain alphabets only");
     return false;
   }

  
  if (z == "") {
    alert("Last Name must be filled out");
    return false;
  }

  if(z.match(letters))
  {
     
  }
   else
   {
     alert("Last Name should contain alphabets only");
     return false;
   }
   if (e == "") {
    alert("Email must be filled out");
    return false;
  }
  if (c == "") {
    alert("Contact must be filled out");
    return false;
  }
  if(c.length!=10)
  {
    alert("Mobile Number must contain 10 digits");
    return false;

  }
  if (p == "") {
    alert("Password must be filled out");
    return false;
  }
  if (rp == "") {
    alert("Re-Enter Password must be filled out");
    return false;
  }
  if(p!= rp)
  {
    alert("Password and Re-Enter Password must be same");
    return false;
  }
  if (reg == "") {
    alert("Registration ID must be filled out");
    return false;
  }
  if(reg.match(letterNumber))
  {
 
  }
   else
   {
     alert("Reg ID must contain only numbers and alphabets");
     return false;
   }
  if (ay == "") {
    alert("Admission year must be filled out");
    return false;
  }

  if(ay.match(num))
  {
 
  }
   else
   {
     alert("Enter correct Admission Year");
     return false;
   }
  
  return true;

  
}
</script>

<style>

input[type=email],input[type=number],input[type=text],input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #5bc0de;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: 1px solid;
  border-color: #46b8da;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #46b8da;
}

fieldset{
  margin-top: 100px;
  margin-bottom: 100px;
  margin-right: 400px;
  margin-left: 400px;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

label {
	font-family: "Consolas";

}
</style>
</head>
<body>


<div>
<fieldset>

  <form name="myForm" onsubmit="return validateForm();" action = "Signup" method="post">
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your first name..">
	<br><br>
    <label for="mname">Middle Name</label>
    <input type="text" id="mname" name="middlename" placeholder="Your middle name..">
    <br><br>
    <label for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name.."> 
    <br><br>
	<label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Your email..">
    <br><br>
	<label for="contact">Mobile No</label>
    <input type="number" id="contact" name="contact" placeholder="Your contact.."  >
    <br><br>
    <label for="pwd">Create Password</label>
    <input type="password" id="pwd" name="pwd" placeholder="Create Password..">
    <br><br>
    <label for="rpwd">Re-Enter-Password</label>
    <input type="password" id="rpwd" name="rpwd" placeholder="Re Enter Password..">
   <br><br>
    <label for="regid">RegID</label>
    <input type="text" id="regid" name="regid" placeholder="Enter Registration Id..">
    <br><br>
    <label for="admyear">Admission Year</label>
    <input type="number" id="admyear" name="admyear" placeholder="Enter Admission Year..">
     
    <input type="submit" value="Submit" >
  </form>
</fieldset>
</div>

</body>
</html>
