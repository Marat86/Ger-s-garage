<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">
  <a class="navbar-brand" href="Parts.jsp">E-Commerce Shopping Cart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger px-1">${cart_list.size()}</span></a> <!-- //lesson 9 -->
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="Parts.jsp">Online store</a>
      </li>
      
	<% 
		if(session.getAttribute("email") != null){ %>
		
			
		<li class="nav-item">
          <a class="nav-link disabled" href="orders.jsp">Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="LogOut">Logout</a>
        </li>
        
	<%}else{ %>

      	<li class="nav-item">
        	<a class="nav-link disabled" href="login.jsp">Log in</a>
      	</li>
	<%} %>
    </ul>
  </div>
  </div>
</nav>
