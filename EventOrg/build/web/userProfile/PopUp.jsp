<%-- 
    Document   : PopUp
    Created on : 12-Jan-2024, 2:40:16 AM
    Author     : tejas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="com.event.entities.User" %>
<%@page import="com.event.entities.Interest" %>
<%@page import="com.event.dao.InterestDao" %>
<%@page import="com.event.dao.UserInterestMapDao" %>
<%@ page import="java.util.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="PopUp.css">
    </head>
    <body>
        <%

                 List<Interest> javaList = new ArrayList<>();
                User currentUser = (User)session.getAttribute("user");              
               int userid=currentUser.getId();
                            
                InterestDao interestDao = new InterestDao(ConnectionProvider.getConnection());
              
                UserInterestMapDao userInterestMapDao = new UserInterestMapDao(ConnectionProvider.getConnection());

                                   // Retrieve the interest IDs for the user
                List<Integer> interestIds = userInterestMapDao.getInterestByUserId(userid);
             
             
                 for(int id : interestIds){
                 javaList.add(interestDao.getInterestById(id));
               }
             
            

         
        %>
        <div class="updateProfContainer">
            Hello

            <button class="" onclick="popUp()">Update</button>
        </div>
        <div class="InterestContainer">

            <h1 class="cent">Update Profile</h1>

            <form class="user-details">

                <label for="name">Name*</label>
                <input type="text" id="name" class="user-input" required value="<%= currentUser.getName() %>">

                <label for="email">Email*</label>
                <input type="email" id="email" class="user-input" value="<%= currentUser.getEmail() %>" required>

                <label for="number">Mobile*</label>
                <input type="number" id="number" class="user-input" value="<%= currentUser.getMobile() %>" required>

                <label for="branch">Branch*</label>
                <input type="text" id="branch" class="user-input" value="<%= currentUser.getClass_branch() %>" required>

            </form>

            <div class="cent">
                <h2>Area(s) Of Interest</h2>
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
                <button class="explore discard" id="discard" onclick="popUp()">Discard Changes</button>
                <button class="explore" id="submitInterests">Save Changes</button>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <!-- Include Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>

                    // Declare the array globally
                    var javascriptArray = [];

            <% for (Interest interest : javaList) { %>
                    javascriptArray.push("<%= interest.getInterest_name() %>");
            <% } %>


                    function popUp() {

                        const dialogBox = document.getElementsByClassName("InterestContainer")[0];
                        dialogBox.classList.toggle('popup');

                        console.log("inside here");
                    }

                    let selectedInterests = [];
                    javascriptArray.forEach(function (ele) {
                        selectedInterests.push(ele);
                    });


                    document.addEventListener('DOMContentLoaded', function () {
                        const interestButtons = document.querySelectorAll('.interestBtn');

                        interestButtons.forEach(button => {
                            const value = button.value;

                            // Check if the button should be initially selected
                            if (selectedInterests.includes(value)) {
                                button.classList.add('selected');
                            }

                            button.addEventListener('click', () => {
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

                                // console.log('Selected interests:', selectedInterests);
                            });
                        });
                    });

//            submitting interests
                    $(document).ready(function () {
                        $('#submitInterests').click(function (event) {
                            let Uname = document.getElementById('name').value;
                            let email = document.getElementById('email').value;
                            let number = document.getElementById('number').value;
                            let branch = document.getElementById('branch').value;

                            let str = "";
                            str = JSON.stringify(selectedInterests);
//                        console.log("Str is -> "+str);

                            let userData = {'name': Uname, 'email': email, 'number': number, 'branch': branch, 'intArr': str};
                            console.log(userData);

                            $.ajax({
                                url: "../UpdateProfile",
                                type: 'POST',
                                data: userData,
                                dataType: 'text', // Expect text response
                                success: function (data, textStatus, jqXHR) {
                                    if (data.trim() === 'Done') {
                                        swal({
                                            title: "Profile Updated Successfully !!",
                                            icon: "success",
                                            button: "OK"
                                        }).then((value) => {
                                            window.location = "../login/index.html";
                                        });
                                    } else {
                                        swal(data);
                                        console.log(data.trim());
                                    }

                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    swal(jqXHR);
                                }
                            });
                        });
                    });


        </script>
    </body>
</html>
