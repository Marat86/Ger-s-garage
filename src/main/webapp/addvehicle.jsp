<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<form action="addVehicle" method="post">
		<fieldset>
            <legend>Vehicle details</legend>
            	<label>Make: <br/><input type="text" name="make" placeholder="BMW, Mercedes, Volkswagen ..."/></label><br/>
            	<label>Model: <br/><input type="text" name="model" placeholder="X5, 500E, Tiguan..."/></label><br/>
            	<label>Vehicle plate: <br/><input type="text" name="vehiclePlate"/></label><br/>
            	<fieldset>
            		<legend>Engine type</legend>
            					
    					<input id="petrol" type="radio" name="engineType" value="petrol" checked="checked">
    					<label for="petrol">Petrol</label><br/>
    					
    					<input id="disiel" type="radio" name="engineType" value="disiel">
    					<label for="disiel">Disiel</label><br/>
    					
    					<input id="electric" type="radio" name="engineType" value="electric">
    					<label for="electric">Electric</label><br/>
    					
    					<input id="hybrid" type="radio" name="engineType" value="hybrid">
    					<label for="hybrid">Hybrid</label>
            					
        			</fieldset><br/>
        			<input type="submit" value="submit">
        	</fieldset>
        	
	</form>
	
</body>
</html>