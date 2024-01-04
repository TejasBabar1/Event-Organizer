

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
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
        <%@include file="normal_navbar.jsp" %>
        <main>
            
            <div class="container">
                
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card">
                        
                        <div class="card-header text-center">
                            <span class="fa fa-3x fa-user-plus"></span><br>
                            Register Here
                            
                        </div>
                        <div class="card-body">
                            
                            <form id="reg-form">
                                
                                <div class="form-group">
                                  <label for="user_name">User Name</label>
                                  <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                  
                                </div>
                                
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                
                                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                   
                                    <label class="btn btn-secondary">
                                        <input type="radio" name="gender" id="Male" value="Male"> Male
                                    </label>
                                    
                                    <label class="btn btn-secondary " style="margin-left: 8px">
                                        <input type="radio" name="gender" id="Female" value="Female"> Female
                                    </label>
                                </div>
                                
                                <br><br>
                                <div class="form-group form-check ">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Terms and Conditions</label>
                                </div>
                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please wait...</h4>
                                </div>
                                
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                       
                    </div>
                </div>
            </div>
            
        </main>
        
        
          <!--        javaScript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        <script>
            $(document).ready(function() {
              
                
                $('#reg-form').on('submit',function(event) {
                    event.preventDefault();
                    
                    let form=new FormData(this);
                    
                    $("submit-btn").hide();
                    $("loader").show();
                    // send register servlet
                    
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        
                        success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("submit-btn").show();
                        $("loader").hide();
                        
                          if(data.trim()==='Done'){
                                swal({
                            title: "Register Successfully !!",
                            text: "Redirecting to login Page",
                            icon: "success",
                            button: "OK"                             
                            }).then((value) => {
                                      window.location="login_page.jsp";
                                    });
                          }
                          else{
                              swal(data);
                          }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                       
                       swal("SomeThing went Wrong .. Please Try Again !"); 
                       
                    },
                    
                    processData: false,
                    contentType: false
                    
                    
                    
                    });
            });
        });
        </script>
    </body>
</html>
