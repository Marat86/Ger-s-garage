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
       <fieldset>
           <legend>User identification</legend>
           <form action="login" method="post">
               <table>
                    <tr>
                        <td>User name: </td>
                        <td><input type="text" name="username" required='required'></td>
                    <tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password" required='required'></td>
                    </tr>
                    <tr>
                        <td>Confirm Password: </td>
                        <td><input type="password" name="cnfpassword" required='required'></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login"></td>
                    </tr>
                </table>
            </form>
            </fieldset>
            <fieldset>
            	<legend>Vehicle details</legend>
            		<label>Make: <br/><input type="text" name="make" placeholder="BMW, Mercedes, Volkswagen ..."/></label><br/>
            		<label>Model: <br/><input type="text" name="model" placeholder="X5, 500E, Tiguan..."/></label><br/>
            		<label>Vehicle plate: <br/><input type="text" name="vehicleplate"/></label><br/>
            		<fieldset>
            			<legend>Engine type</legend>
            			<input type="radio" name="engintype" value="petrol" checked="checked"/>Petrol <br/>
            			<input type="radio" name="engintype" value="disiel"/>Disiel <br/>
            			<input type="radio" name="engintype" value="electric"/>Electric<br/>
            			<input type="radio" name="engintype" value="hybrid"/>Hybrid
            		</fieldset>
            </fieldset>
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