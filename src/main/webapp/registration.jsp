<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
      <meta charset="utf-8">
      <title>Log in with your account</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="/css/common.css" rel="stylesheet">
  </head>

  <body>
  <div class="container">
  <div class="heading"> New User Sign Up Form </div>
  <form id="form">
<div class="home">
  <div>
  <div class="field">
  User Name <input id="username" name="username" type="text" class="form-control" placeholder="Username"
                       autofocus="true"/>
  </div>

   <div class="field">
    Phone Number <input id="phone" name="phone" type="text" class="form-control" placeholder="phone number"
                                             autofocus="true"/>
    </div>
  <div class="field">
  Email <input id="email" name="email" type="text" class="form-control" placeholder="email"
                                                      autofocus="true"/>
      </div>

  </div>



  <div>
  <div class="field">
     Enter Password <input id="password" name="password" type="password" class="form-control" placeholder="Password"/>
        </div>
   <div class="field">
   Date of Birth <br/>
   <input type="date" id="dob" name="dob" />
      </div>
     <div class="field">
      Address:<br/>
             <textarea id="address" placeholder="address"></textarea>
        </div>

    </div>

    <div>
    <div class="field">
                      Repeat Password <input id="repeatpassword" name="repeatpassword" type="password" class="form-control" placeholder="repeat password"/>
        </div>

   <div class="field">
     Sex:<br>
        	<label for="M">Male</label>
               <input type="radio" name="gender" id="M" value="M"><br>
           <label for="F">Female</label>
              <input type="radio" name="gender" id="F" value="F">
    </div>
     </div>

</div>
<div class="d-flex justify-content-around">
 <button class="btn btn-lg btn-primary btn-block" type="button" id="apply">Apply</button>
   <button class="btn btn-lg btn-secondary btn-block" type="reset" id="reset">Reset</button>
 </div>
</form>
</div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
     // this is the id of the form
     $("#apply").click(function(e) {
                e.preventDefault();
        var username = $('#username').val();
        var password = $('#password').val();
        var email = $('#email').val();
        var phone = $('#phone').val();
        var gender = $('input[name="gender"]:checked').val();
        var dob = $('#dob').val()?.replace('/', '-');
        var address = $('#address').val();

        if (username && password && phone && gender && dob) {
            $.ajax({
                         type: 'POST',
                         url: '/api/auth/signup',
                         crossDomain: true,
                         xhrFields: { 'withCredentials': true },
                         headers: {
                                 'Accept': 'application/json',
                                 'Content-Type': 'application/json'
                             },
            	         dataType: 'json',
                         data: JSON.stringify({
                           username,
                           email,
                           password,
                           "role": ["user"],
                           phone,
                           gender,
                           dob,
                           address
                            }),
                       success: function(result, status, jqXHR) {
                               var cookies = jqXHR.getResponseHeader('Set-Cookie');
                               window.location.href = '/';
                         }
                     });
        } else {
            alert('Please fill required fields');
        }
        return false;
     });

     </script>
     <style>
     .container {
         padding: 20px 30px;
       }
       .heading {
         color: green;
         font-size: 30px;
       }
       .home {
         display: flex;
         margin: 10px 20px;
         justify-content: space-around;
       }
       .field {
        margin: 30px 0px 32px 0px;
       }
     </style>
  </body>
</html>
