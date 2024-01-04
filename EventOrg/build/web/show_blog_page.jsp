

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.dao.UserDao" %>
<%@page errorPage="error_page.jsp" %>

<% 
    User user=(User)session.getAttribute("currentuser");
    if(user==null){
    response.sendRedirect("login.jsp");
    }

%>

<%
    int postid=Integer.parseInt(request.getParameter("post_id"));
    PostDao d=new PostDao(ConnectionProvider.getConnection());
    
    Post p=d.getPostByPostId(postid);
    int uid=p.getUserId();
    
    UserDao ud=new UserDao(ConnectionProvider.getConnection());
    User postuser=ud.getUserById(uid);
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %></title>
        
        <!--        css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background{
               clip-path: polygon(50% 0%, 83% 0, 100% 0, 100% 94%, 81% 91%, 50% 95%, 22% 93%, 0 94%, 0 0, 20% 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
                
                
            }
            
            .post-user-info{
                font-size: 20px;
                font-weight: 200;
            }
            .row-user{
                border: 1px solid aqua;
                padding-top: 15px;
            }
            
            body{
                background: url(img/back.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            

        </style>
        
        
        
    </head>
    <body>
        
                
<!--        Start of navbar    -->
        
            <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Tech Blog</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#"> <span class="fa fa-home">Home</span></a>
              </li

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                    <span class="fa fa-hashtag"></span> Categories
                </a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="#">Programming Language</a>
                  <a class="dropdown-item" href="#">Project</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Data Structure</a>
                </div>
              </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-handshake-o"></span>Contact</a>
              </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-model"><span class="fa fa-plus-square"></span></span>Do Post</a>
              </li>
              
              </ul>
              <ul class="navbar-nav mr-right">
                  <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-model"><span class="fa fa-user-circle"></span><%=user.getName()%></a>
              </ul>
             
              <ul class="navbar-nav mr-right">
                  <a class="nav-link" href="LogoutServlet"><span class="fa fa-user"></span>Log out</a>
              </ul>
          </div>
        </nav>

<!--       End of navbar-->

<!--            Main content-->

        <div class="container text-center">
            <div class="row my-2">
                
                <div class="col-md-8 offset-md-2">
                    
                    <div class="card">
                        
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%= p.getpTitle() %></h4>
                        </div>
                        
                        <div class="card-body">
                            
                            <img src="blog_pic/<%= p.getpPic() %>" class="card-img-top my-2" style="max-width: 350px; max-height:350px">
                            
                            <div class="row my-3 row-user">
                                
                                <div class="col-md-8">
                                    <p class="post-user-info"><a href="#"><%=postuser.getName() %></a> has posted :</p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"><%= p.getpDate().toLocaleString() %></p>
                                </div>
                                
                            </div>
                            
                            <p class="post-content"><%= p.getpContent() %></p>
                            <br><br>
                            
                            <div class="post-code">
                                <pre><%= p.getpCode() %></pre>
                            </div>
                            
                        </div>
                            
                        <div class="card-footer  text-center">
                            
                            <% 
                                LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                                int count=ld.countLikeOnPost(p.getPid());
                            %>
                            
                            <a href="#" onclick="doLike(<%= p.getPid() %>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-up"></i><span class="like-counter"><%=count %></span></a>
                            <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                        </div>
                            
                            
                        
                    </div>
                    
                </div>
            </div>
        </div>

<!--                end of main content-->
        

            <!-- Profile Modal -->
            <div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header primary-background text-white text-center">
                    <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <div class="container text-center">
                          <img class="img-fluid" src="pics/<%=user.getProfile()%>" style="max-width: 150px">
                          <br>
                          
                          <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
                          
<!--                          details-->
                        <div id="profile-detais">
                        <table class="table">
                            
                            <tbody>
                              <tr>
                                <th scope="row">ID</th>
                                <td><%=user.getId()%></td>
                                
                              </tr>
                              <tr>
                                <th scope="row">Email</th>
                                <td><%=user.getEmail()%></td>
                                
                              </tr>
                              <tr>
                                <th scope="row">Gender</th>
                                <td><%=user.getGender()%></td>
                                
                              </tr>
                            </tbody>
                          </table>
                        </div>
                                
<!--                                profile edit-->
                        <div id="profile-edit" style="display: none">
                            
                            <h3 class="mt-2">Please Edit Carefully </h3>
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID</td>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>New Profile</td>
                                        <td>
                                            <input type="file" name="image" class="form-control">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td><input class="form-control" name="user_name" type="text" value="<%=user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><input class="form-control" name="user_email" type="email" value="<%=user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td><input class="form-control" name="user_password" type="password" value="<%=user.getPassword()%>"></td>
                                    </tr>
                                     <tr>
                                        <td>Gender</td>
                                        <td><%=user.getGender()%></td>
                                    </tr>
                                </table>
                                    <div class="container">
                                        <button class="btn btn-outline-primary" type="submit">Save</button>
                                    </div>
                            </form>
                            
                        </div>

                      </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                  </div>
                </div>
              </div>
            </div>
<!--            end of profile model                       -->
                
<!--                add post model-->

            
                <!-- Modal -->
                <div class="modal fade" id="add-post-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        
                          <form id="add-post-form" action="AddPostServlet" method="post">
                              
                              <div class="form-group">
                                  <select class="form-control" name="cid">
                                      <option selected disabled>---Select Category---</option>
                                      <% 
                                        PostDao postd=new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list=postd.getCategories();
                                        
                                        for(Category c :list)
                                        {
                                      %>
                                      <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                  
                                  <% }%>
                              </select>
                              </div>
                              
                              <div class="form-group">
                                  <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control">
                              </div>
                              
                              <div class="form-group">
                                  <textarea name="pContent" style="height: 150px" class="form-control" placeholder="Enter your content"></textarea>
                              </div>
                              <div class="form-group">
                                  <textarea name="pCode" style="height: 150px" class="form-control" placeholder="Enter your Program (if any)"></textarea>
                              </div>
                              
                              <div class="form-group">
                                  <label>Select Image</label><br>
                                  <input name="pic" type="file">
                              </div>
                              <div class="container text-center">
                                  <button type="submit" class="btn btn-outline-primary">Post</button>
                              </div>
                          </form>
                          
                      </div>
                      
                    </div>
                  </div>
                </div>
                
<!--                end post model-->
        
        
        <!--        javaScript-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        <script>
            $(document).ready(function() {
                
                let editStatus=false;
                
                $('#edit-profile-button').click(function() {
                    
                    if(editStatus==false){
                        $("#profile-detais").hide();
                        $("#profile-edit").show();
                        editStatus=true;
                        $(this).text("Back");
                    }
                    else{
                        $("#profile-detais").show();
                        $("#profile-edit").hide();
                        editStatus=false;
                        $(this).text("Edit");
                    }
                    
            });
        });
        </script>
        
<!--         add post js-->

<script>
    $(document).ready(function(e) {
    
    $("#add-post-form").on("submit",function(event) {
        // this function call when submit is click 
        event.preventDefault();
        
        let form =new FormData(this);
        
        $.ajax({
            url: "AddPostServlet",
            type: 'POST',
            data: form,
            
            success: function (data, textStatus, jqXHR) {
                     console.log(data);   
                     if(data.trim()==='done'){
                         swal("Good job!", "Saved Successfully !", "success").then((value) => {
                                      window.location="profile.jsp";
                                    });
                     }
                     else{
                         swal("Error!", "SomeThing went wrong !", "error");
                     }
                },
            error: function (jqXHR, textStatus, errorThrown) {
                     swal("Error!", "SomeThing went wrong !", "error");   
            },
            processData: false,
            contentType: false
        });
    });
});
</script>

    </body>
</html>
