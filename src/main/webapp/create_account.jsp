<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body>
       <div align="left">
       <form action="SignUp" method="post">
       
       		<fieldset>
           		<legend>User identification</legend>
           
               		<table>
                    	<tr>
                        	<td>First name: </td>
                        	<td><input type="text" name="fname" required='required'></td>
                   		</tr>
                    	<tr>
                        	<td>Surname: </td>
                        	<td><input type="text" name="surname" required='required'></td>
                    	</tr>
                   	 	<tr>
                        	<td>Password: </td>
                        	<td><input type="password" name="password" required='required'></td>
                   		</tr>
                    	<tr>
                        	<td>Confirm Password: </td>
                        	<td><input type="password" name="cnfpassword" required='required'></td>
                    	</tr>
                     	<tr>
                        	<td>Licence: </td>
                        	<td><input type="text" name="licence" required='required'></td>
                    	</tr>
                    	<tr>
                        	<td>Email: </td>
                        	<td><input type="text" name="email" required='required'></td>
                    	</tr>
                    	<tr>
                        	<td>Phone number: </td>
                        	<td><input type="text" name="phone" required='required'></td>
                    	</tr>
                    	<!-- 
                    	<tr>
                        	<td>Gender: </td>
                        	<td><input type="radio" name="gender" value="male" required='required'>Male</td>
                        	<td><input type="radio" name="gender" value="female" required="required">Female</td>
                    	</tr>
                    	-->
                    	<tr>
                        	<td>Birthday: </td>
                        	<td><input type="date" name="birthday" required='required'></td>
                    	</tr>
                	</table>
            
            	</fieldset>
            	<!--  
            	<fieldset>
            		<legend>Vehicle details</legend>
            			<label>Make: <br/><input type="text" name="make" placeholder="BMW, Mercedes, Volkswagen ..."/></label><br/>
            			<label>Model: <br/><input type="text" name="model" placeholder="X5, 500E, Tiguan..."/></label><br/>
            			<label>Vehicle plate: <br/><input type="text" name="vehiclePlate"/></label><br/>
            			<fieldset>
            		<legend>Engine type</legend>
            			<input type="radio" name="enginType" value="petrol" checked="checked"/>Petrol <br/>
            			<input type="radio" name="enginType" value="disiel"/>Disiel <br/>
            			<input type="radio" name="enginType" value="electric"/>Electric<br/>
            			<input type="radio" name="enginType" value="hybrid"/>Hybrid
            		</fieldset>
            	</fieldset> -->
            	<input type="submit" value="Login">
        </form>
        </div>
        <script>
            function validate_password() {

                var pass = document.getElementById('pass').value;
                var confirm_pass = document.getElementById('confirm_pass').value;
                if (pass != confirm_pass) {
                    document.getElementById('wrong_pass_alert').style.color = 'red';
                    document.getElementById('wrong_pass_alert').innerHTML
                        = '☒ Use same password';
                    document.getElementById('create').disabled = true;
                    document.getElementById('create').style.opacity = (0.4);
                } else {
                    document.getElementById('wrong_pass_alert').style.color = 'green';
                    document.getElementById('wrong_pass_alert').innerHTML =
                        '🗹 Password Matched';
                    document.getElementById('create').disabled = false;
                    document.getElementById('create').style.opacity = (1);
                }
            }


        </script>
</body>
</html>