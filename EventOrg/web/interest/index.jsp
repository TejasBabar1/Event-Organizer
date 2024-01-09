<%-- 
    Document   : index
    Created on : 07-Jan-2024, 1:08:08 PM
    Author     : tejas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.event.entities.User" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>AI Powered Event Organizer</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="../land/vendors/owl-carousel/css/owl.carousel.min.css">
        <link rel="stylesheet" href="../land/vendors/owl-carousel/css/owl.theme.default.css">
        <link rel="stylesheet" href="../land/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="../land/vendors/aos/css/aos.css">
        <link rel="stylesheet" href="../land/css/style.min.css">

        <style>

            .interestBtn {
                -webkit-border-radius: 28;
                -moz-border-radius: 28;
                border-radius: 28px;
                font-family: Arial;
                color: #0d0c0d;
                font-size: 15px;
                background: #e5e7e8;
                padding: 10px 20px 10px 20px;
                text-decoration: none;
                border: none;
            }

            .interestBtn.selected {
                background: #3cb0fd;
                /* Change the background color for selected buttons */
                color: #fff;
                /* Change the text color for selected buttons */
            }

            .interestBtn:hover {
                background: #3cb0fd;
                background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
                background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
                background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
                background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
                background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
                text-decoration: none;
            }

            .interest-container {
                display: flex;
                flex-direction: column;
                justify-content: center;
                text-align: center;
                margin-bottom: 3rem;
                padding-bottom: 2rem;
            }

            .cent {
                margin: 0 auto;
            }


            .intersets {
                width: 60%;
                margin: 0 auto;
                display: flex;
                flex-direction: row;
                justify-content: center;
                text-align: center;
                flex-wrap: wrap;
                gap: 8px;
            }

            .explore {
                margin-top: 30px;
                -webkit-border-radius: 28;
                -moz-border-radius: 28;
                border-radius: 28px;
                border: none;
                font-family: Arial;
                color: #ffffff;
                font-size: 20px;
                background: #FF0000;
                padding: 10px 20px 10px 20px;
                text-decoration: none;
            }

            .explore:hover {
                cursor: pointer;
                background: #f07676;
                text-decoration: none;
            }
            .uname
            {
                margin-left: 30px;
            }

            .logo-pvg
            {
                font-size: 2rem;
                color: #FF0000;
                position: relative;
                letter-spacing: 2px;
                text-transform: uppercase;
                top: 6px;
            }
        </style>


    </head>

    <body id="body" data-spy="scroll" data-target=".navbar" data-offset="100">
        <header id="header-section">
            <nav class="navbar navbar-expand-lg pl-3 pl-sm-0" id="navbar">
                <div class="container">
                    <div class="navbar-brand-wrapper d-flex w-100">
                        <!--                        <img src="images/Group2.svg" alt="">-->
                        <img src="../land/images/brand-log.png" alt="brand" width="150px" class="pb-2">

                        <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                                aria-label="Toggle navigation">
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
                                <button class="navbar-toggler close-button" type="button" data-toggle="collapse"
                                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">
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

                            <li class="nav-item btn-contact-us" >
                                <%
                                    User cur =(User) session.getAttribute("user");
                                %>
                                <div class="profile">Hello<br> <%= cur.getName() %> </div> 
                            </li>

                            <!--                            <li class="nav-item btn-contact-us pl-4 pl-lg-0">
                                                            <a href="../login/index.html"><button class="btn btn-info">Log-out</button></a>
                                                        </li>-->


                        </ul>
                    </div>
                </div>
            </nav>
        </header>


        <div class="content-wrapper">
            <div class="container">

                <section class="case-studies" id="case-studies-section">
                    <div class="interest-container">

                        <div class="col-12 text-center pb-5 pt-4">
                            <h2>Area(s) of interests</h2>
                        </div>

                        <div class="intersets">
                            <input type="button" class="interestBtn" value="Artificial Intelligence(AI)">
                            <input type="button" class="interestBtn" value="Deep Learning">
                            <input type="button" class="interestBtn" value="Blockchain">
                            <input type="button" class="interestBtn" value="Data Science">
                            <input type="button" class="interestBtn" value="Machine Learning">
                            <input type="button" class="interestBtn" value="Big Data Analytics">
                            <input type="button" class="interestBtn" value="DSA">
                            <input type="button" class="interestBtn" value="Web">
                            <input type="button" class="interestBtn" value="Cloud">
                            <input type="button" class="interestBtn" value="AR/VR">
                            <input type="button" class="interestBtn" value="Cyber Security">
                            <input type="button" class="interestBtn" value="Quantum Computing">
                            <input type="button" class="interestBtn" value="Robotics">
                            <input type="button" class="interestBtn" value="Internet Of things (IOT)">
                            <input type="button" class="interestBtn" value="Electric vechicles">
                            <input type="button" class="interestBtn" value="Sports">
                            <input type="button" class="interestBtn" value="Gaming and Entertainment">
                            <input type="button" class="interestBtn" value="Art & Drama">
                            <input type="button" class="interestBtn" value="Electric vechicles">
                            <input type="button" class="interestBtn" value="Social and Networking">
                            <input type="button" class="interestBtn" value="Marketing">
                            <input type="button" class="interestBtn" value="Finance">
                            <input type="button" class="interestBtn" value="UI/UX Design">
                            <input type="button" class="interestBtn" value="Electronics and Embedded Systems">
                            <input type="button" class="interestBtn" value="3D Printing & Manufacturing">
                            <input type="button" class="interestBtn" value="Higher Studies">

                        </div>

                        <div class="cent">
                            <button class="explore" id="submitInterests">Explore Events</button>
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
                            <a href="#">
                                <p class="m-0 pb-2">Terms</p>
                            </a>
                            <a href="#">
                                <p class="m-0 pt-1 pb-2">Privacy policy</p>
                            </a>
                            <a href="#">
                                <p class="m-0 pt-1 pb-2">Cookie Policy</p>
                            </a>
                            <a href="#">
                                <p class="m-0 pt-1">Discover</p>
                            </a>
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

                <footer class="border-top">
                    <p class="text-center text-muted pt-4">Copyright © 2023<a href="https://www.bootstrapdash.com/"
                                                                              class="px-1">EventMinds</a>All rights reserved.</p>
                </footer>
                <!-- Modal for Contact - us Button -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalLabel">Contact Us</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="Name">Name</label>
                                        <input type="text" class="form-control" id="Name" placeholder="Name">
                                    </div>
                                    <div class="form-group">
                                        <label for="Email">Email</label>
                                        <input type="email" class="form-control" id="Email-1" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="Message">Message</label>
                                        <textarea class="form-control" id="Message" placeholder="Enter your Message"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="../land/vendors/jquery/jquery.min.js"></script>
        <script src="../land/vendors/bootstrap/bootstrap.min.js"></script>
        <script src="../land/vendors/owl-carousel/js/owl.carousel.min.js"></script>
        <script src="../land/vendors/aos/js/aos.js"></script>
        <script src="../land/js/landingpage.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <!-- Include Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


        <script>
            // Declare the array globally
            const selectedInterests = [];
            document.addEventListener('DOMContentLoaded', function () {
                const interestButtons = document.querySelectorAll('.interestBtn');
                interestButtons.forEach(button => {
                    button.addEventListener('click', () => {
                        const value = button.value;
                        // Toggle the 'selected' class for styling
                        button.classList.toggle('selected');
                        // Update the global array
                        if (button.classList.contains('selected')) {
                            selectedInterests.push(value);
                        } else {
                            const index = selectedInterests.indexOf(value);
                            if (index !== -1) {
                                selectedInterests.splice(index, 1);
                            }
                        }

                        console.log('Selected interests:', selectedInterests);
                    });
                });
            });

//            submitting interests
            $(document).ready(function () {
                $('#submitInterests').click(function (event) {


                    $.ajax({
                        url: "../AddInterests",
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(selectedInterests),
                        dataType: 'text', // Expect text response
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "Done") {
                                window.location = "../userProfile/index.jsp";
                            } else {

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            swal("SomeThing went Wrong .. Please Try Again !");
                        }
                    });
                });
            });

        </script>


    </body>

</html>