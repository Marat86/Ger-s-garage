<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="com.garage.database.ProductDao" %>
  <%@page import="java.util.List" %>
  <%@page import="com.garage.connection.DbCon" %>
 <%@ page import="garage.*, com.garage.database.*, java.sql.*" %>
 <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="includes/head.jsp"%>
<style type="text/css">
.table tbody td{
	vartical-align: middle;
}
.btn-incre, .btn-dicre{
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%
		if(session.getAttribute("email") == null){// if i use "user" instead of "email" i cannot login . it used to "email"
			response.sendRedirect("login.jsp");
		}
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
		List<Cart> cartProduct = null;
		if(cart_list != null){
			ProductDao pDao = new ProductDao(DbCon.getConnection());
			cartProduct = pDao.getCartProducts(cart_list);
			double total = pDao.getTotalCartPrice(cart_list);
			request.setAttribute("cart_list", cart_list); //lesson 8 9:30 min
			request.setAttribute("total", total);
		}

	%>
<%@include file="includes/navbar.jsp" %>
	
		<div class="container my-3">
		<div class="d-flex py-3"><h3>Total Price: € ${ (total>0)?total:0 }</h3> <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
		<table class="table table=light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			<%
				if(cart_list != null){
					for(Cart c: cartProduct){ %>
						<tr>
						<td><%= c.getName() %></td>
						<td><%= c.getCategory() %></td>
						<td>€<%= c.getPrice() %></td>
						<td>
						<form action="" method="post" class="form-inline">
							<input type="hidden" name="id"value="<%= c.getId() %>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-dicre" href=""><i class="fas fa-minus-square"></i></a>
								<input type="text" name="quantity" class="form-control" value="1" readonly>
								<a class="btn btn-sm btn-incre" href=""><i class="fas fa-plus-square"></i></a>
							</div>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="">Remove</a></td>
					</tr>
					<%}
				}
			%>
			
				
			</tbody>
		</table>
	</div>
	
<%@include file="includes/footer.jsp"%>
</body>
</html>