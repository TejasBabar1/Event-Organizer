<%-- 
    Document   : index
    Created on : 06-Jan-2024, 2:26:08 AM
    Author     : tejas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.event.entities.Event" %>
<%@page import="com.event.dao.EventDao" %>
<%@page import="com.event.dao.UserInterestMapDao" %>
<%@page import="com.event.dao.EventInterestMappingDao" %>
<%@page import="java.util.List" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.event.entities.User" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AI Powered Event Organizer</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="vendors/owl-carousel/css/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/css/owl.theme.default.css">
        <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="vendors/aos/css/aos.css">
        <link rel="stylesheet" href="css/style.min.css">
        <link rel="stylesheet" href="cssForCard.css">
    </head>

    <body id="body" data-spy="scroll" data-target=".navbar" data-offset="100">
        <header id="header-section">
            <nav class="navbar navbar-expand-lg pl-3 pl-sm-0" id="navbar">
                <div class="container">
                    <div class="navbar-brand-wrapper d-flex w-100">
                        <!--<img src="images/Group2.svg" alt="">-->
                        <img src="../land/images/brand-log.png" alt="brand" width="150px" class="pb-2">

                        <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="mdi mdi-menu navbar-toggler-icon"></span>
                        </button> 
                    </div>
                    <div class="collapse navbar-collapse navbar-menu-wrapper" id="navbarSupportedContent">
                        <ul class="navbar-nav align-items-lg-center align-items-start ml-auto">
                            <li class="d-flex align-items-center justify-content-between pl-4 pl-lg-0">
                                <div class="navbar-collapse-logo">
                                    <!--<img src="images/Group2.svg" alt="">-->
                                    <img src="../land/images/brand-log.png" alt="brand" width="150px" class="pb-2">

                                </div>
                                <button class="navbar-toggler close-button" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="mdi mdi-close navbar-toggler-icon pl-5"></span>
                                </button>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#header-section">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#features-section">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#digital-marketing-section">Overview</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#contact-details-section">Contact</a>  
                            </li>

                            <!-- hello user name  -->
                            <li class="nav-item btn-contact-us" >
                                <%
                                    User cur =(User) session.getAttribute("user");
                                %>
                                <div class="profile">Hello<br> <%= cur.getName() %> </div> 
                            </li>

                            <li class="nav-item btn-contact-us pl-4 pl-lg-0">
                                <a href="../login/index.html"><button class="btn btn-danger">Log Out →</button></a>
                            </li>
                        </ul>
                    </div>
                </div> 
            </nav>   
        </header>

        <div class="banner" >
            <div class="container">
                <h1 class="font-weight-semibold text-capitalize">Get Yourself Ready for upcoming events ! .</h1>
                <h6 class="font-weight-normal text-muted pb-3">Paricipate in events and grasp knowledge from professionals.</h6>
                <div>
                    <button class="btn btn-opacity-light mr-1" id="#features-section">Explore Events... </button>
                </div>
                <img src="images/Group171.svg" alt="" class="img-fluid">
            </div>
        </div>

        <div class="content-wrapper">
            <div class="container">
                <!-- Recommended event -->
                <section class="features-overview" id="features-section" >
                    <div class="content-header">
                        <h2>Recommended Events</h2>
                        <h6 class="section-subtitle text-muted">Below events changes as per your interests specified.</h6>
                    </div>


                    <div class="card-container">


                        <%
                            // Get the current session
    //                        HttpSession session = request.getSession();

                            // Retrieve the user object from the session
                            User currentUser = (User) session.getAttribute("user");

                            // Check if the user is logged in
                            if (currentUser != null) {
                                // Use the currentUser object as needed
                                String username = currentUser.getName();
                                int userid=currentUser.getId();
                            
                            
                                UserInterestMapDao userInterestMapDao = new UserInterestMapDao(ConnectionProvider.getConnection());

                                // Retrieve the interest IDs for the user
                                List<Integer> interestIds = userInterestMapDao.getInterestByUserId(userid);
                            
                            
                                EventInterestMappingDao eventInterestMappingDao = new EventInterestMappingDao(ConnectionProvider.getConnection());

                                // Retrieve the event IDs for the given interest IDs
                                List<Integer> eventIds = eventInterestMappingDao.getEventIdsByInterestIds(interestIds);


                                EventDao eventdao=new EventDao(ConnectionProvider.getConnection());
                                List<Event> events=eventdao.getEventsByEventIds(eventIds);
                    
                                    if(events.size()==0){
                                        out.println("<h3 class='display-3 text-center'>No post in This Category</h3>");
                        
                                    }
    
                                    for(Event e : events){
                        
                            
                        %>
                        <!-- new code starts -->

                        <div class="eventCard">
                            <div class="tour-info">
                                <div class="tour-details">
                                    <!-- title , description, date, venue, time, speaker, price -->
                                    <h4 class="tour-price"><%= e.getEvent_name() %></h4>
                                    <h4 class="tour-name"><%= e.getEvent_date() %></h4>
                                    <h4 class="tour-name"><%= e.getSpeaker() %></h4>
                                    <h4 class="tour-name"><%= e.getLocation() %></h4>
                                    <h4 class="tour-name"><%= e.getTime() %></h4>
                                </div>

                                <div class="description">
                                    <%
                                           String desc = e.getDescription();
                                           int len = Math.min(desc.length(),500);
                                    %>
                                    <%= desc.substring(0,len)+"..." %>
                                </div>
                            </div>

                            <button class="btn-red">
                                Register
                            </button>
                        </div>
                        <%
                                            }
                                            } else {
                                                // User is not logged in, handle accordingly
                                                response.sendRedirect("login.jsp"); // Redirect to the login page or show a login form
                                            }
                        %>

                    </div>
                </section>
                <!-- new code ends -->
            </div>  




            <br>
            <!-- upcoming events  -->
            <section class="case-studies" id="case-studies-section">
                <div class="row grid-margin">
                    <div class="col-12 text-center pb-5 pt-4">
                        <h2>Upcoming Events</h2>
                        <h6 class="section-subtitle text-muted">Register for event to participate</h6>
                    </div>


                    <div class="card-container">

                        <% 
    
                            EventDao d=new EventDao(ConnectionProvider.getConnection());
                            List<Event> events=d.getAllEvent();
                    
    
                    
    
                            if(events.size()==0){
                                out.println("<h3 class='display-3 text-center'>No post in This Category</h3>");
                        
                            }
    
                            for(Event e : events){
                        
                            
                        %>
                        <!-- new code starts -->

                        <div class="eventCard">
                            <div class="tour-info">
                                <div class="tour-details">
                                    <!-- title , description, date, venue, time, speaker, price -->
                                    <h4 class="tour-price"><%= e.getEvent_name() %></h4>
                                    <h4 class="tour-name"><%= e.getEvent_date() %></h4>
                                    <h4 class="tour-name"><%= e.getSpeaker() %></h4>
                                    <h4 class="tour-name"><%= e.getLocation() %></h4>
                                    <h4 class="tour-name"><%= e.getTime() %></h4>
                                </div>

                                <div class="description">
                                    <%
                                           String desc = e.getDescription();
                                           int len = Math.min(desc.length(),500);
                                    %>
                                    <%= desc.substring(0,len)+"..." %>
                                </div>
                            </div>

                            <button class="btn-red">
                                Register
                            </button>
                        </div>

                        <!-- new code starts -->

                        <!--                    
                        
                        
                        <% } %>
    
                            </div>
                        <!-- new code ends -->
                    </div>
            </section>  

            <!-- info of clubs     -->
            <section class="customer-feedback" id="feedback-section">
                <div class="row">
                    <div class="col-12 text-center pb-5">
                        <h2>Explore Our Clubs.</h2>
                        <h6 class="section-subtitle text-muted m-0">Check out your interested clubs available.</h6>
                    </div>
                    <div class="owl-carousel owl-theme grid-margin">
                        <div class="card customer-cards">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="images/it.jpg" width="89" height="89" alt="" class="img-customer">
                                    <p class="m-0 py-3 text-muted">ITSA is a Club managed by students of Information Technology Department.</p>
                                    <div class="content-divider m-auto"></div>
                                    <h6 class="card-title pt-3">ITSA</h6>
                                    <h6 class="customer-designation text-muted m-0">An IT students organization</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card customer-cards">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="images/cs.jpg" width="89" height="89" alt="" class="img-customer">
                                    <p class="m-0 py-3 text-muted">ACES, a Organization of Computer Science students.</p>
                                    <div class="content-divider m-auto"></div>
                                    <h6 class="card-title pt-3">ACES</h6>
                                    <h6 class="customer-designation text-muted m-0">Association of Computer students</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card customer-cards">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="images/mech.jpg" width="89" height="89" alt="" class="img-customer">
                                    <p class="m-0 py-3 text-muted">An Organization of Mechanical Department Students</p>
                                    <div class="content-divider m-auto"></div>
                                    <h6 class="card-title pt-3">MECHA</h6>
                                    <h6 class="customer-designation text-muted m-0">Mechanical Association</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card customer-cards">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="images/electrical.jpg" width="89" height="89" alt="" class="img-customer">
                                    <p class="m-0 py-3 text-muted">EESA</p>
                                    <div class="content-divider m-auto"></div>
                                    <h6 class="card-title pt-3">An Organization of Electrical Students</h6>
                                    <h6 class="customer-designation text-muted m-0">Electrical Engineering Students Association</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card customer-cards">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="images/entc.jpg" width="89" height="89" alt="" class="img-customer">
                                    <p class="m-0 py-3 text-muted">ETSA, a helpful Organization managed by ENTC Students.</p>
                                    <div class="content-divider m-auto"></div>
                                    <h6 class="card-title pt-3">ETSA</h6>
                                    <h6 class="customer-designation text-muted m-0">ENTC Students Association</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="contact-details" id="contact-details-section">
                <h2 class="text-center py-4">Contact Us</h2>
                <div class="row text-center text-md-left">
                    <div class="col-12 col-md-6 col-lg-3 grid-margin">
                        <!--<img src="images/Group2.svg" alt="" class="pb-2">-->
                        <img src="../land/images/brand-log.png" alt="brand" width="150px" class="pb-2">

                        <div class="pt-2">
                            <p class="text-muted m-0">contact@eventminds.com</p>
                            <p class="text-muted m-0">906-179-8309</p>
                        </div>         
                    </div>
                    <div class="col-12 col-md-6 col-lg-3 grid-margin">
                        <h5 class="pb-2">Get in Touch</h5>
                        <p class="text-muted">Don’t miss any updates of our new templates and extensions.!</p>

                    </div>
                    <div class="col-12 col-md-6 col-lg-3 grid-margin">
                        <h5 class="pb-2">Our Guidelines</h5>
                        <a href="#"><p class="m-0 pb-2">Terms</p></a>   
                        <a href="#" ><p class="m-0 pt-1 pb-2">Privacy policy</p></a> 
                        <a href="#"><p class="m-0 pt-1 pb-2">Cookie Policy</p></a> 
                        <a href="#"><p class="m-0 pt-1">Discover</p></a> 
                    </div>
                    <div class="col-12 col-md-6 col-lg-3 grid-margin">
                        <h5 class="pb-2">Our address</h5>
                        <p class="text-muted">Parvati Darshar Road<br>Swargate, Pune</p>
                        <div class="d-flex justify-content-center justify-content-md-start">
                            <a href="#"><span class="mdi mdi-facebook"></span></a>
                            <a href="#"><span class="mdi mdi-twitter"></span></a>
                            <a href="#"><span class="mdi mdi-instagram"></span></a>
                            <a href="#"><span class="mdi mdi-linkedin"></span></a>
                        </div>
                    </div>
                </div>  
            </section>

            <!-- footer  -->
            <footer class="border-top">
                <p class="text-center text-muted pt-4">Copyright © 2023<a href="#" class="px-1">EventMinds</a>All rights reserved.</p>
            </footer>
        </div>

        <script src="vendors/jquery/jquery.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.min.js"></script>
        <script src="vendors/owl-carousel/js/owl.carousel.min.js"></script>
        <script src="vendors/aos/js/aos.js"></script>
        <script src="js/landingpage.js"></script>
    </body>
</html>