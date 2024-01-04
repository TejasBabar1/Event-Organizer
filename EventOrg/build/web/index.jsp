

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<!DOCTYPE html>
<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
<!--        css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background{
               clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 94%, 81% 91%, 50% 95%, 22% 93%, 0 94%, 0 0, 20% 0);
            }

        </style>
        
    </head>
    
    
    <body>
        
<!--        navbar-->
<%@include file="normal_navbar.jsp" %>
        
<!--         banner-->

<div class="container-fluid p-0 m-0">
    <div class="jumbotron primary-background text-white banner-background">
        
        <div class="container">
        
            <h4 class="display-4">Welcome To TechBlog</h4>

             <p>Welcome to technical world of technology.
                 A programming language is a system of notation for writing computer programs.Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.
             </p>
<!--             <p>Some languages are defined by a specification document while other languages have a dominant implementation that is treated as a reference. Some languages have both, with the basic language defined by a standard and extensions taken from the dominant implementation being common.</p>-->
        
<a href="register_page.jsp"><button class="btn btn-outline-light btn-lg"><span class="fa fa-bolt"></span> Start ! its Free</button></a>
             <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user fa-spin"></span> Login</a>
        </div>
        
    </div>
    
    <br>
    
    
</div>

<!--cards-->
<div class="container">
    
    <div class="row">
        
        <div class="col-md-4">
            <div class="card" >
               
                <div class="card-body">
                  <h5 class="card-title">JAVA</h5>
                  <p class="card-text">Java is a high-level, general-purpose programming language that is designed to be platform-independent, which means it can run on multiple operating systems without needing to be recompiled. It was originally developed by Sun Microsystems and released in 1995.</p>
                  <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" >
               
                <div class="card-body">
                  <h5 class="card-title">Python</h5>
                  <p class="card-text">Python is a high-level, interpreted programming language that emphasizes code readability and simplicity. It was created by Guido van Rossum and first released in 1991. Python is known for its clear and concise syntax, which makes it easy to learn and write.</p>
                  <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" >
               
                <div class="card-body">
                  <h5 class="card-title">C++</h5>
                  <p class="card-text">C++ is a powerful and versatile programming language that is widely used for developing a wide range of applications, including system software, games, embedded systems, high-performance applications, and more. It is an extension of the C programming language with added features and capabilities.</p>
                  <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        
        <div class="col-md-4">
            <div class="card" >
               
                <div class="card-body">
                  <h5 class="card-title">MySQL</h5>
                  <p class="card-text">MySQL is an open-source relational database management system (RDBMS) that is widely used for managing and storing structured data. It was developed by MySQL AB and is now owned by Oracle Corporation. MySQL is known for its performance, scalability, and ease of use.</p>
                  <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" >
               
                <div class="card-body">
                  <h5 class="card-title">AI</h5>
                  <p class="card-text">AI, short for Artificial Intelligence, refers to the development of computer systems that can perform tasks that would typically require human intelligence. AI encompasses a wide range of techniques and approaches aimed at creating intelligent machines capable of learning, reasoning, problem-solving, and making decisions.</p>
                  <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" >
               
                <div class="card-body">
                  <h5 class="card-title">Networking</h5>
                  <p class="card-text">Networking refers to the practice of connecting and communicating between multiple computer systems or devices to share resources, exchange data, and enable communication. It involves the use of hardware, protocols, and software to establish and maintain connections between devices.

</p>
                  <a href="#" class="btn primary-background text-white">Read More</a>
                </div>
            </div>
        </div>
    </div>
    
</div>
        
<!--        javaScript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    
        <script>
            
            
        </script>
    </body>
</html>
