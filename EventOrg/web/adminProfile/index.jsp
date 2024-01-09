<%-- 
    Document   : index
    Created on : 06-Jan-2024, 11:09:55 AM
    Author     : tejas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.event.entities.Event" %>
<%@page import="com.event.dao.EventDao" %>
<%@page import="java.util.List" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>AI Powered Event Organizer</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="vendors/owl-carousel/css/owl.carousel.min.css">
        <link rel="stylesheet" href="vendors/owl-carousel/css/owl.theme.default.css">
        <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="vendors/aos/css/aos.css">
        <link rel="stylesheet" href="css/style.min.css">
        <link rel="stylesheet" href="cssForCard.css">

        <link rel="stylesheet" href="postEvent.css">

<!--        <style>
            .logo-pvg{
                font-size: 2rem;
                color: #FF0000;
                position: relative;
                letter-spacing: 2px;
                text-transform: uppercase;
                top: 6px;
            }
        </style>-->
    </head>

    <body id="body" data-spy="scroll" data-target=".navbar" data-offset="100">
        <header id="header-section">
            <nav class="navbar navbar-expand-lg pl-3 pl-sm-0" id="navbar">
                <div class="container">
                    <div class="navbar-brand-wrapper d-flex w-100">
                        <!--                        <img src="images/Group2.svg" alt="">-->
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
                                    <img src="../land/images/brand-log.png" width="150px" class="pb-2">

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
                                <div class="profile">Hello<br> Admin</div> 
                            </li>

                            <li class="nav-item btn-contact-us pl-4 pl-lg-0">

                                <!--<button class="btn btn-danger" onclick="logout()">Log Out →</button>-->
                                <a href="../login/index.html"><button class="btn btn-danger">Log Out →</button> </a>
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
                    <button class="btn btn-opacity-light mr-1 text-black" id="#features-section">Explore Events... </button>
                </div>
                <img src="images/Group171.svg" alt="" class="img-fluid">
            </div>
        </div>

        <div class="content-wrapper">
            <div class="container">     

                <!-- upcoming events  -->
                <section class="case-studies" id="case-studies-section">
                    <div class="row grid-margin">
                        <div class="col-12 text-center pb-5 pt-4">
                            <h2>Upcoming Events</h2>
                            <h6 class="section-subtitle text-muted">Register for event to participate</h6>
                        </div>

                        <!-- new code starts -->
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
                                    View Details
                                </button>
                            </div>

                            <!-- new code starts -->

                            <!--                    
                            
                            
                            <% } %>
    
                                </div>
                            <!-- new code ends -->
                        </div>
                        <!-- new code ends -->
                    </div>
                </section>  

                <!-- form for event  -->
                <div class="row justify-content-center">
                    <div class="col-12 text-center pt-4">
                        <h2>Organize a new Event with us !</h2>
                        <h6 class="section-subtitle text-muted">Fill the event details below.</h6>
                    </div>
                    <div class="col-md-7">
                        <div class="card">
                            <h2 class="card-title text-center">Add Event</a></h2>
                            <div class="card-body py-md-4">
                                <form _lpchecked="1">
                                    <div class="form-group">
                                        <label for="ename">Event name / Title </label>
                                        <input type="text" class="form-control" id="ename" placeholder="Event name">
                                    </div>
                                    <div class="form-group">
                                        <label for="edate">Event date</label>
                                        <input type="date" class="form-control" id="edate" placeholder="Event Date">
                                    </div>

                                    <div class="form-group">
                                        <label for="Location">Location</label>
                                        <input type="text" class="form-control" id="Location" placeholder="Location of Event">
                                    </div>


                                    <div class="form-group">
                                        <label for="start-time">Start Time</label>
                                        <input type="time" class="form-control" id="start-time">
                                    </div>

                                    <div class="form-group">
                                        <label for="end-time">End Time</label>
                                        <input type="time" class="form-control" id="end-time">
                                    </div>

                                    <div class="form-group">
                                        <label for="speaker">Speaker</label>
                                        <input type="text" class="form-control" id="speaker" placeholder="Speaker">
                                    </div>

                                    <div class="form-group">
                                        <label for="RSdate">Regestration Start</label>
                                        <input type="date" class="form-control" id="RSdate" placeholder="Regestration Start">
                                    </div>
                                    <div class="form-group">
                                        <label for="REdate">Regestration End</label>
                                        <input type="date" class="form-control" id="REdate" placeholder="Regestration End">
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Event description</label>
                                        <textarea class="form-control" id="description" cols="30" rows="5"> </textarea>
                                    </div>

                                    <div class="d-flex align-items-center">
                                        <button class="btn btn-primary postEvent">Post Event</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <br>
                <br>

                <section class="contact-details" id="contact-details-section">
                    <h2 class="text-center py-4">Contact Us</h2>
                    <div class="row text-center text-md-left">
                        <div class="col-12 col-md-6 col-lg-3 grid-margin">
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
                            <p class="text-muted">Parvati Darshan Road<br>Swargate, Pune</p>
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
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <!-- Include Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script><!-- comment -->

        <script src="postEvent.js"></script>
        <script src="vendors/jquery/jquery.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.min.js"></script>
        <script src="vendors/owl-carousel/js/owl.carousel.min.js"></script>
        <script src="vendors/aos/js/aos.js"></script>
        <script src="js/landingpage.js"></script>


    </body>
</html>