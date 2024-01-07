
const signupBtn = document.getElementById("signup-btn");
const signinBtn = document.getElementById("signin-btn");
const mainContainer = document.querySelector(".container");

signupBtn.addEventListener("click", () => {
    mainContainer.classList.toggle("change");
});
signinBtn.addEventListener("click", () => {
    mainContainer.classList.toggle("change");
});

let arr = [];
function getUserInterest(id)
{
    const cur = document.getElementById("" + id);
    console.log(cur);
    arr.push(cur.value);
}

$(document).ready(function () {
    $('#send-form').on('submit', function (event) {
        event.preventDefault();

//                to check which radio selected
        let valueOfGender = "";
        const [a, b] = document.getElementsByClassName("gender");
        if (a.checked)
            valueOfGender = a.value;
        else
            valueOfGender = b.value;


        console.log(valueOfGender);

        var formData = {
            name: $('input[name=user_name]').val(),
            email: $('input[name=email]').val(),
            pass: $('input[name=pass]').val(),
            mobile: $('input[name=mobile]').val(),
            gender: valueOfGender,
            branch: $('input[name=branch]').val()
        };

        $.ajax({
            url: "../UserRegister",
            type: 'POST',
            data: formData,
            dataType: 'text', // Expect text response
            success: function (data, textStatus, jqXHR) {
                console.log(data);

                if (data.trim() === 'Done') {
                    swal({
                        title: "Register Successfully !!",
                        text: "Redirecting to login Page",
                        icon: "success",
                        button: "OK"
                    }).then((value) => {
                        window.location = "../interest/index.html";
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



let whologger = "user";




function checkLogger()
{
    const [a, b] = document.getElementsByName("selectLogger");
        if (b.checked)
            whologger = b.value;
        else
            whologger = a.value;
        
    return whologger;
}

$(document).ready(function () {
    $('#login-form').on('submit', function (event) {
        event.preventDefault();

        whologger=checkLogger();

        var formData = {
           
            email: $('input[name=u_email]').val(),
            pass: $('input[name=u_pass]').val(),
            wholog: whologger           
        };
        
        console.log(formData);
        console.log(formData);
        console.log(formData);

        $.ajax({
            url: "../UserLogin",
            type: 'POST',
            data: formData,
            dataType: 'text', // Expect text response
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                console.log(data+"Akash");
                console.log("gfhjdksl");
                

                if (data.trim() === 'user') {
                    window.location = "../userProfile/index.jsp";
                } else if(data.trim() === 'admin'){
                    window.location = "../adminProfile/index.jsp";
                }
                else{
                    swal(data);
                    console.log(data.trim());
                    console.log("Akash");
                }


            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
                swal("SomeThing went Wrong .. Please Try Again !");
            }
        });
    });
});






