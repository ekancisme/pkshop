<%@page import="user.UserDTO"%>
<%@page import="user.UserError"%>
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
                
                  <li><a href="login.jsp"><span class="icon icon-person"></span> Login</a></li>
                  
                
                  
                
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
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Contact</strong></div>
        </div>
      </div>
    </div>  
<%--register --%>
    <div class="site-section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-12 text-center">
        <h2 class="h3 mb-3 text-black">Register Account</h2>
      </div>
      <div class="col-md-7 mx-auto">

        <form action="MainController" method="POST">
        <%
            UserError userError= (UserError)request.getAttribute("USER_ERROR");
            if(userError== null){
                userError= new UserError();
            }
        %>    
          <div class="p-3 p-lg-5 border">
            <div class="form-group row">
              <div class="col-md-6">
                <label for="userID" class="text-black">User ID <span class="text-danger">*</span></label>
                <input type="text" placeholder="UserID" class="form-control" id="userID" name="userID">
                <span class="text-danger"><%= userError.getUserID() %></span></br>
              </div>
              <div class="col-md-6">
                <label for="fullName" class="text-black">Full Name <span class="text-danger">*</span></label>
                <input type="text" placeholder="Full Name" class="form-control" id="fullName" name="fullName">
              </div>
            </div>
            <div class="form-group row">
              <div class="col-md-12">
                <label for="gmail" class="text-black">Email <span class="text-danger">*</span></label>
                <input placeholder="Ex: nguyenvana@gmail.com" type="text" class="form-control" id="roleID" name="gmail">
              </div>
            </div>
            <div class="form-group row">
              <div class="col-md-12">
                <label for="address" class="text-black">Address <span class="text-danger">*</span></label>
                <input placeholder="Ex: 55 Le Duan Street" type="text" class="form-control" id="roleID" name="address">
              </div>
            </div>
            <div class="form-group row">
              <div class="col-md-12">
                <label for="password" class="text-black">Password <span class="text-danger">*</span></label>
                <input placeholder="Password" type="password" class="form-control" id="password" name="password">
                
              </div>
            </div>
            <div class="form-group row">
              <div class="col-md-12">
                <label for="confirm" class="text-black">Confirm Password <span class="text-danger">*</span></label>
                <input placeholder="Confirm Password" type="password" class="form-control" id="confirm" name="confirm">
                <span class="text-danger"><%= userError.getConfirm()%></span></br>
              </div>
                
            </div>
            <div class="form-group row">
              <div class="col-lg-12">
                <input type="submit" class="btn btn-info btn-lg btn-block" name="action"value="Register">
              </div>
            </div>

          </div>
        </form>
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