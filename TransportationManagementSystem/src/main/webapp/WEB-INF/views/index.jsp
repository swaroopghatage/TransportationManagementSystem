<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>

<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>YRC Transport</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- Top Background Image Wrapper -->

<div class="bgded overlay" style="background-image:url('images/demo/backgrounds/c.jpg');"> 
  <!-- ################################################################################################ -->
  <div class="wrapper row0">
    <div id="topbar" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div class="fl_left"> 
        <!-- ################################################################################################ -->
        <ul class="nospace">
          <li><i class="fas fa-phone"></i> +00 (123) 456 7890</li>
          <li><i class="far fa-envelope"></i> transproject4848@gmail.com</li>
        </ul>
        <!-- ################################################################################################ -->
      </div>
      <div class="fl_right"> 
        <!-- ################################################################################################ -->
        <ul class="nospace">
          <li><a href="<spring:url value='/'/>"><i class="fas fa-home"></i></a></li>
          <li><a href="<spring:url value='/admin/contact'/>" title="Help Centre"><i class="fas fa-life-ring"></i></a></li>
          <li><a href="<spring:url value='/admin/login'/>"><i class="fas fa-sign-in-alt"></i></a></li>
       <!--    <li><a href="#" title="Sign Up"><i class="fas fa-edit"></i></a></li> -->
        </ul>
        <!-- ################################################################################################ -->
      </div>
      <!-- ################################################################################################ -->
    </div>
  </div>
  <!-- ################################################################################################ -->
  <div class="wrapper row1">
    <header id="header" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div id="logo" class="fl_left">
        <h1><a href="index.html">YRC</a></h1>
      </div>
      <!-- ################################################################################################ -->
      <nav id="mainav" class="fl_right">
        <ul class="clear">
          <li class="active"><a href="<spring:url value='/'/>">Home</a></li>
          
          <li><a class="drop" href="#">Login</a>
            <ul>
            <li><a href="<spring:url value='/admin/login'/>">Admin Login </a></li>
              <li><a href="<spring:url value='/customer/login'/>">Customer Login And Register</a></li>
              <li><a href="<spring:url value='/driver/login'/>">Driver Login And Register</a></li>
            </ul>
          </li>
          <li><a href="<spring:url value='/admin/about'/>">AboutUs</a></li>
                
          <li><a href="<spring:url value='/admin/contact'/>">Contact Us</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </header>
  </div>
<!-- ################################################################################################ -->
  <div id="pageintro" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <article class="center">
      <h3 class="heading underline">YRC Transport System</h3>
      <p>The logistics company you can rely on</p>
      <footer><a class="btn"  href="<spring:url value='/admin/about'/>">MORE ABOUT US</a></footer>
    </article>
    <!-- ################################################################################################ -->
  </div>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">Services</h6>
    </div>
    <ul class="nospace group overview btmspace-80">
      <li class="one_quarter">
        <article><a href="#"><i class="fas fa-eraser"></i></a>
          <h6 class="heading"><a href="#">1-3 DAYS TRANSIT TIME</a></h6>
          <p>
Save on storage charges with YRC Transport. We provide 1-3 days shipping transit time to major sectors around the world - that's one of the fastest transit times!</p>
          
        </article>
      </li>
      <li class="one_quarter">
        <article><a href="#"><i class="fas fa-rocket"></i></a>
          <h6 class="heading"><a href="#">ALL OVER INDIA</a></h6>
          <p>
Our network spans all over India. With over 10 years of logistics expertise, YRC Transport will ensure that your shipments reach their destination quickly and safely.</p>
         
        </article>
      </li>
      <li class="one_quarter">
        <article><a href="#"><i class="fas fa-hand-holding-heart"></i></a>
          <h6 class="heading"><a href="#">24/7 CUSTOMER SUPPORT</a></h6>
          <p>
Benefit from end-to-end tracking with YRC Transport - We're the only express courier service that provides 24/7 phone support to our customers.</p>
  
        </article>
      </li>
      <li class="one_quarter">
        <article><a href="#"><i class="fas fa-rocket"></i></a>
          <h6 class="heading"><a href="#">Service Quality </a></h6>
          <p>Award winning service quality & continued support of our esteemed customers</p>
      
        </article>
      </li>
    </ul>
    <footer class="center"><a class="btn" href="#">Our Services</a></footer>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<div class="wrapper row2">
  <article class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">Solutions We Provide</h6>
    </div>
    <ul class="nospace group figures btmspace-80">
      <li class="one_third first">
        <figure><img class="imgstyle" src="images/demo/trans.jpg" alt="">
          <figcaption><em>01</em> <a href="#">Fleet Management</a></figcaption>
        </figure>
      </li>
      <li class="one_third">
        <figure><img class="imgstyle" src="images/demo/supply.jpg" alt="">
          <figcaption><em>02</em> <a href="#">Supply Chain Management</a></figcaption>
        </figure>
      </li>
      <li class="one_third">
        <figure><img class="imgstyle" src="images/demo/package.jpg" alt="" >
          <figcaption><em>03</em> <a href="#">Packaging</a></figcaption>
        </figure>
      </li>
    </ul>
    
    <!-- ################################################################################################ -->
  </article>
</div>
<!-- ################################################################################################ -->
<div class="bgded overlay startlt light" style="background-image:url('images/demo/backgrounds/misn.jpg');">
  <section id="segment" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="two_third">
      <h6 class="heading underline font-x2">Our accomplishments are who we are.</h6>
      <p class="btmspace-50">YRC Transports Limited is a leading 3PL solutions provider with over a decade of experience. We have a strong presence across the country</p>
      <article><a href="#"><i class="fas fa-flag-checkered"></i></a>
        <h6 class="heading">Our Vision</h6>
        <p>To become the Premier Company that cuts across various segments and emerges as the torchbearer of each segment that it ventures into.</p>
 
      </article>
      <article><a href="#"><i class="fas fa-recycle"></i></a>
        <h6 class="heading">Our Mission</h6>
        <p>To provide the highest quality service to our customers by continuously increasing cost efficiency and maintaining delivery deadlines. To encourage our workforce to continuously strive for quality and excellence in everything they do. To promote team work and create work environment that encourages talent and brings out the best in our employees.</p>
    
      </article>
    </div>
    <!-- ################################################################################################ -->
  </section>
</div>
<!-- ################################################################################################ -->

<div class="wrapper bgded overlay" style="background-image:url('images/demo/backgrounds/redtrk.jpg');">
  <section id="testimonials" class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="center btmspace-80">
      <h6 class="heading underline font-x2">Testimonials </h6>
    </div>
    <ul class="nospace group btmspace-80">
      <li class="one_third first">
        <blockquote>YRC delivers, hands down, the best freight management abilities
			</blockquote>
        <!-- <figure class="clear"><img class="circle" src="images/demo/60x60.png" alt=""> -->
          <figcaption>
            <h6 class="heading">Mr. Amar Patil</h6>
            <em>— Solution Architect in the Manufacturing Industry</em></figcaption>
        </figure>
      </li>
      <li class="one_third">
        <blockquote>YRC is a very robust and highly configurable transportation management system. We have been able to develop system integrations with multiple carriers for rate integration, shipment execution and track and trace.</blockquote>
      
          <figcaption>
            <h6 class="heading">Mr. Rohit Gupta</h6>
            <em>— Global Head of Supply Chain Management in the Services Industry</em></figcaption>
        </figure>
      </li>
      <li class="one_third">
        <blockquote>The YRC solution has great capability and flexibility, which is a significant reason we purchased, implemented, and continue to continually improve our business.</blockquote>
       
          <figcaption>
            <h6 class="heading">Mr. Anil Adani</h6>
            <em>— Business Intelligence Director in the Manufacturing Industry</em></figcaption>
        </figure>
      </li>
    </ul>
    <footer class="center"><a class="btn" href="<spring:url value='/admin/contact'/>">Contact Us</a></footer>
    <!-- ################################################################################################ -->
  </section>
</div>
<!-- ################################################################################################ -->
<div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="center btmspace-50">
      <h6 class="heading">YRC Transport</h6>
      <nav>
        <ul class="nospace inline pushright uppercase">
          <li><a href="<spring:url value='/'/>"><i class="fas fa-lg fa-home"></i></a></li>
          <li><a href="<spring:url value='/admin/about'/>">About</a></li>
          <%-- <li><a href="<spring:url value='/admin/contact'/>">Contact</a></li> --%>
          <li><a href="#">Terms</a></li>
          <li><a href="#">Privacy</a></li>
          <li><a href="#">Cookies</a></li>
          <li><a href="#">Disclaimer</a></li>
        </ul>
      </nav>
    </div>
    <!-- ################################################################################################ -->
    <hr class="btmspace-50">
    <!-- ################################################################################################ -->
    <div class="group">
      <div align="left">
        <h6 class="heading">Reach Us At</h6>
        <ul class="nospace btmspace-30 linklist contact">
          <li><i class="fas fa-map-marker-alt"></i>
            <address>
            Akurdi Railway St. Road, Akurdi, 
             Postcode - 411 033
            </address>
          </li>
          <li><i class="fas fa-phone"></i> +01 (463) 258 7890</li>
          <li><i class="far fa-envelope"></i> transproject4848@gmail.com</li>
        </ul>
        <ul class="faico clear">
          <li><a class="faicon-facebook" href="#"><i class="fab fa-facebook"></i></a></li>
          <li><a class="faicon-google-plus" href="#"><i class="fab fa-google-plus-g"></i></a></li>
          <li><a class="faicon-linkedin" href="#"><i class="fab fa-linkedin"></i></a></li>
          <li><a class="faicon-twitter" href="#"><i class="fab fa-twitter"></i></a></li>
          <li><a class="faicon-vk" href="#"><i class="fab fa-vk"></i></a></li>
        </ul>
      </div>
      
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>

<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2021 - All Rights Reserved - <a href="#">YRC Transport</a></p>
    
    <!-- ################################################################################################ -->
  </div>
</div>

<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>