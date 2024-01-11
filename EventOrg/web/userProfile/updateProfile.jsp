<%-- 
    Document   : updateProfile
    Created on : 11-Jan-2024, 6:53:37 PM
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Styled Button Clicks</title>
        <style>
            body {
                margin: 0 auto;
                display: flex;
                align-items: center;
                justify-content: center;
            }

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
                color: #fff;

                background: #3cb0fd;
                /* Change the background color for selected buttons */
                /* Change the text color for selected buttons */
            }

            .interestBtn:hover {
                background: #3cb0fd;
                cursor: pointer;
                background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
                background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
                background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
                background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
                background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
                text-decoration: none;
            }

            .InterestContainer {
                width: 50vw;
                display: none;
            }

            .cent {
                text-align: center;
            }

            .userInput {
                margin-left: 25%;
                height: 30px;
                width: 400px;
            }

            .intersets {
                display: flex;
                justify-content: center;
                text-align: center;
                flex-wrap: wrap;
                gap: 8px;
            }

            .explore,
            .discard {
                box-sizing: border-box;
                margin-top: 30px;
                -webkit-border-radius: 28;
                -moz-border-radius: 28;
                border-radius: 28px;
                font-family: Arial;
                font-size: 20px;
                border: none;
                /* color: #ffffff; */
                /* background: #FF0000; */
                color: black;
                background: #84de72;
                padding: 10px 20px 10px 20px;
                text-decoration: none;
                transition: all 0.3s;
            }

            .explore:hover {
                color: white;
                background: rgb(67, 218, 67);

                cursor: pointer;
                /* background: #f07676; */
                text-decoration: none;
            }

            .discard {
                background-color: rgb(236, 84, 84);
            }

            .discard:hover {
                background: rgb(234, 97, 38);

            }

            .updateProfContainer {
                width: 100vw;
                height: 100vh;
                background-color: rgb(104, 51, 51);
            }

            .popup {
                padding: 1rem;
                border-radius: 1rem;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                display: flex;
                flex-direction: column;
                background-color: white;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                opacity: 1;
                animation: fadeIn  0.6s ease-in-out forwards;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }

                to {
                    opacity: 1;
                }
            }

            .popup.close {
                animation: fadeOut 0.5s ease-in-out forwards;
            }

            @keyframes fadeOut {
                from {
                    opacity: 1;
                }

                to {
                    opacity: 0;
                }
            }
        </style>
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

        <!--<div class="updateProfContainer">-->
        <!--Hello-->
        <button class="" onclick="popUp()">Update</button>
        <!--</div>-->

        <div class="InterestContainer">

            <div class="user-details">
                <label for="name">Name</label>
                <input type="text" id="name">
            </div>

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
                <button class="explore" id="submit">Save Changes</button>
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

    //         pushing into this array
            let arr = [];
            javascriptArray.forEach(function (ele) {
                arr.push(ele);
            });
            
//              let myArr = ["cloud","oop","dsa"];
//              console.log(JSON.stringify(myArr));
              



            document.addEventListener('DOMContentLoaded', function ()
            {
                const interestButtons = document.querySelectorAll('.interestBtn');

                interestButtons.forEach(button => {
                    const value = button.value;

                    // Check if the button should be initially selected
                    if (arr.includes(value)) {
                        button.classList.add('selected');
                    }

                    button.addEventListener('click', () => {
                        // Toggle the 'selected' class for styling
                        button.classList.toggle('selected');

                        // Update the global array
                        if (button.classList.contains('selected')) {
                            arr.push(value);
                        } else {
                    }

                    button.addEventListener('click', () => {
                        // Toggle the 'selected' class for styling
                        button.classList.toggle('selected');

                        // Update the global array
                            const index = arr.indexOf(value);
                            if (index !== -1) {
                                arr.splice(index, 1);
                            }
                        }

                         console.log('Selected interests:', selectedInterests);
                    });
                });
            )});

            let name = document.getElementById('name').value;
            let newInterests = JSON.stringify(arr);
            
            let str = "";
            arr.forEach(function (ele) {
                str+= ele+" ";
            });
                            
             console.log("arr is ");
             console.log(arr);
            console.log("**");
            console.log(str);
            console.log("**");
            
//             hamare changes
            let data = {
                name:"hellloo",
                intArr : "str"
            };
            
            console.log(data);

//              sending request to update servlet
            $(document).ready(function () {
                $('#submit').click(function (event) {


                    $.ajax({
                        url: "../UpdateProfile",
                        type: 'POST',
                        data: data,
                        dataType: 'text', // Expect text response
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                      
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            console.log("SomeThing went Wrong .. Please Try Again !");
                        }
                    });
                });
            });

        </script>



    </body>
</html>