document.addEventListener('DOMContentLoaded', function () {
    document.querySelector('.postEvent').addEventListener('click', function (event) {
        event.preventDefault(); // Prevents the form from submitting

        // Fetch input values and store them in an object
        var eventData = {
            eventName: document.getElementById('ename').value,
            eventDate: document.getElementById('edate').value,
            location: document.getElementById('Location').value,
            startTime: document.getElementById('start-time').value,
            endTime: document.getElementById('end-time').value,
            speaker: document.getElementById('speaker').value,
            registrationStartDate: document.getElementById('RSdate').value,
            registrationEndDate: document.getElementById('REdate').value,
            eventDescription: document.getElementById('description').value
        };

        // Log the object to the console
        console.log(eventData);

        $.ajax({
            url: "../PostEvent",
            type: 'POST',
            data: eventData,
            dataType: 'text', // Expect text response
            success: function (data, textStatus, jqXHR) {
                console.log(data);

                if (data.trim() === 'Done') {
                    swal({
                        title: "Event Posted Successfully !!",
                        text: "Thank You.",
                        icon: "success",
                        button: "OK"
                    }).then((value) => {

//                        calling for python
                        getRecommendations(eventData.eventDescription);
//                        window.location = "../adminProfile/index.jsp";
                    });
                } else {
                    swal(data);
                }


            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
                swal("SomeThing went Wrong .. Please Try Again !");
            }
        });
    });
});



function getRecommendations(interestInput) {
    // Collect input data from the form
//    const interestInput = document.getElementById('interestInput').value;
    // You can collect more data from other form elements as needed

    // Create an object with the collected input data
    const inputData = {
        interest: interestInput,
        // Add more properties for additional input data
    };

    // Make an HTTP request to the Python API endpoint with input data
    fetch('http://127.0.0.1:5000/get_recommendations', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(inputData),
    })
            .then(response => response.json())
            .then(data => {
                // Process and display the recommendations in your JSP page
                console.log(data);
                callForRecommendations(data);
                // Example: Display recommendations in an alert
//                alert('Recommendations:\n' + JSON.stringify(data, null, 2));
            })
            .catch(error => console.error('Error:', error));
}


function callForRecommendations(interest)
{


//    var desObj = {interes : interest};

    $.ajax({
        url: "../Recommendation",
        type: 'POST',
        data:  JSON.stringify(interest),
        dataType: 'text', // Expect text response
        success: function (data, textStatus, jqXHR) {
            window.location = "../adminProfile/index.jsp";
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
        }
    });
}

function logout() {
    // Perform any additional logout actions if needed

    // Redirect to the specified URL
    window.location.href = '../land/index.html';
}