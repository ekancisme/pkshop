<%@page import="Invoice.InvoiceDTO"%>
<%@page import="Invoice.InvoiceDAO"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page import="Cart.CartDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="Cart.CartDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>HienSneaker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
  </head>
  <body>
 <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
           
        %>    
<%-- searh bar --%>
  <div class="site-wrap">
    <header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="MainController" method="POST" class="site-block-top-search">
                    <span class="icon icon-search2"></span>
                    <input type="text" name="search" class="form-control border-0" placeholder="Search">
                    <input type="hidden" name="action" value="Search">
              </form>
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div>
                <a href="home.jsp">
                    <img style="width: 50%; padding: -100px" src="images/logo2.jpg">
                </a>
              </div>
            </div>
<%--login-cart-update account information -logout--%>
        <div class="col-6 col-md-4 order-3 order-md-3 text-right">
            <form action="MainController" method="POST">
            <div class="site-top-icons">
              <ul>
                <% if(loginUser == null) { %>
                  <li><a href="login.jsp"><span class="icon icon-person"></span> Login</a></li>
                  <li><a href="register.jsp"><span class="icon icon-person"></span> Register</a></li>
                <% } else { %>
                  <li><a href="LogoutController"></span>LOG OUT</a></li>
                  <li><a href="update.jsp"><span class="icon icon-person"></span></a></li>
                  <li>
                  <a href="cart.jsp" class="site-cart">
                    <span class="icon icon-shopping_cart"></span>
                    
                  </a>
                </li> 
                <% } %>
                  
                
                <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
              </ul>
            </div> 
            </form>    
        </div>

          </div>
        </div>
      </div> 
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li><a href="home.jsp">Home</a></li>
            <li class="has-children">
              <a href="shop.jsp">Shop</a>
              
              <ul class="dropdown" style="list-style-type: none;">
                    <form action="MainController" method="POST">
                        <li><a href="SearchCategoriesController?category=Adidas" class="d-flex">Adidas</a></li>
                        <li><a href="SearchCategoriesController?category=Nike" class="d-flex">Nike</a></li>
                        <li><a href="SearchCategoriesController?category=MLB" class="d-flex">MLB</a></li>
                    </form>
                </ul>
            </li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="update.jsp">Account</a></li>
            
          </ul>
        </div>
      </nav>
    </header>
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="home.jsp">Home</a> <span class="mx-2 mb-0">/</span><a href="shop.jsp">Shop</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>
          
                
<div class="site-section">
    <%
    CartDAO cartDAO = new CartDAO();
    List<CartDTO> cartList = null;
    
    if (loginUser != null) {
        
        String userID = loginUser.getUserID(); 
        cartList = cartDAO.getCart(userID);
        session.setAttribute("cartList", cartList);

    }
    
%>      
    <div class="container">
        <div class="row mb-5">
            <div class="col-md-12" >
                <div class="site-blocks-table">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="product-thumbnail">Image</th>
                                <th class="product-name">Product</th>
                                <th class="product-price">Price</th>
                                <th class="product-quantity">Quantity</th>
                                <th class="product-total">Total</th>
                                <th class="product-remove">Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% float totalCost = 0; 
                            
                            String invId = (String) session.getAttribute("invId");
                            if (invId == null) {
                                invId = "INV-" +  new Random().nextInt(10000);
                                session.setAttribute("invId", invId);
                            }
                            if (cartList != null) { %>
                                 <% for (CartDTO cart : cartList) { 
                                    cart.setInvId(invId);
                                    cartDAO.updateInvId(cart);
                                    totalCost += cart.getTotalPrice();%>
                                <form class="col-md-12"  action="MainController" method="POST">    
                                    <tr>
                                        <td class="product-thumbnail">
                                            <img src="images/<%=cart.getImage()%>" alt="Image" class="img-fluid">
                                        </td>
                                        <td class="product-name">
                                            <h2 class="h5 text-black"><%=cart.getSneakerID()%></h2>
                                        </td>
                                        <td><%=cart.getPrice()%></td>
                                        <td>
                                            <div class="input-group" style="max-width: 120px;">
                                                <input type="hidden" name="cartId" value="<%=cart.getCartId()%>">
                                                <input type="text" name="quantity"  value="<%=cart.getQuantity()%>">
                                                    
                                                <button name="action" value="Change" type="submit" class="btn btn-success btn-sm mt-1">Update</button>
                                                
                                            </div>
                                        </td>
                                        <td><%=cart.getTotalPrice()%></td>
                                        <td> 
                                            <input type="hidden" name="cartId" value="<%=cart.getCartId()%>">
                                            <button name="action"value="Remove" class="btn btn-danger btn-sm">X</button>
                                        </td>
                                    </tr>
                                </form>    
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
  




        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
             
              <div class="col-md-6">
                <a href="shop.jsp" class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</a>
            </div>
              <div class="col-md-6 mb-3 mb-md-0">
               <%
                        String message = (String) request.getAttribute("message");
                        if (message == null) {
                            message = "";
                        }
                    %>
                    <div class="d-flex justify-content-center">
                        <h3 style="color: red;"><%= message %></h3>
                    </div>  
              </div>
            </div>
            
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                    
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                  </div>
                </div>
                
                <div class="row mb-5">
                    <div class="col-md-6">
                        <span class="text-black">Total</span>
                    </div>
                    <div class="col-md-6 text-right">
                        <strong class="text-black">$<%=totalCost%></strong>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                    <% 
                    InvoiceDAO dao = new InvoiceDAO();
                    boolean invoiceExists = dao.invoiceExists(invId);
                    if (!invoiceExists && totalCost > 0) { 
                        InvoiceDTO invoice = new InvoiceDTO();
                        invoice.setInvId(invId);
                        invoice.setUserID(loginUser.getUserID());
                        invoice.setTotal(totalCost);
                        invoice.setDateBuy("null"); // You might want to set this to the current date instead
                        invoice.setGmail("null"); // You might want to set this to the user's actual email
                        invoice.setAddress("null"); // You might want to set this to the user's actual address

                        // Store the invoice in the session
                        session.setAttribute("invoice", invoice);
                    %>
                    <div>
                        <a href="checkout.jsp" class="btn btn-dark btn-lg py-3 btn-block">Go to Checkout</a>
                    </div>     
                    <% 
                    } else  { request.setAttribute("message", "Cannot checkout");

                    }%>
           
        
    </div>
</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

     <footer class="site-footer bg-dark border-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5 mb-lg-0">
            <div class="row">
              <div class="col-md-12">
                <h3 class="footer-heading mb-4">Navigations</h3>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="register.jsp">Create new account</a></li>
                    <li><a href="login.jsp">Login</a></li>
                  <li><a href="home.jsp">Menu</a></li>
                  
                </ul>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="shop.jsp">Shop</a></li>
                 
                  <li><a href="about.jsp">About</a></li>
                  
                </ul>
              </div>
              
            </div>
          </div>
          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
            
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Contact Info</h3>
              <ul class="list-unstyled">
                <li class="address">FPT University</li>
                <li class="phone"><a href="tel://1234567">+12 345 6789</a></li>
                <li class="email">hiennhse180274@fpt.edu.vn</li>
              </ul>
            </div>

            
          </div>
        </div>
        
      </div>
    </footer>
  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>