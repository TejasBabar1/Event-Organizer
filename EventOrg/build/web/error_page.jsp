

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry SomeThing Went Wrong</title>
        
          <!--        css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 94%, 82% 92%, 59% 95%, 35% 93%, 0 94%, 0 0, 20% 0);
            }
        </style>  
        
    </head>
    <body>
     

        
        <div class="container text-center">
            <img src="img/warning.png" class="img-fluid ">
            <h3>Sorry! SomeThing went Wrong</h3>
            <%= exception %>
            <br>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
        </div>
        
    </body>
</html>
