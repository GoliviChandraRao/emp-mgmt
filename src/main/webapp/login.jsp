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

      <style>
      .home {
        display: flex;
        margin: 10px 20px;
        justify-content: space-around;
      }

      .left-section {
              background: lightskyblue;
              border: 8px dashed white;
              width: 50%;
              border-radius: 5px;
              text-align: center;
              height: 90vh;
        }

       .right-section {
              background: lightskyblue;
            width: 35%;
            border-radius: 5px;
            text-align: center;
            margin: 0 auto;
            height: 40vh;
        }
      </style>
  </head>

  <body>

<div class="home">
  <div class="right-section">
      <div class="container">
        <h2 class="form-heading">Log in</h2>
        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            User Name <input id="username" name="username" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            Password <input id="password" name="password" type="password" class="form-control" placeholder="Password"/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button class="btn btn-lg btn-primary btn-block mt-4" type="submit" id="login">Log In</button>
        </div>
    </div>
  </div>
</div>




    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
     // this is the id of the form
     $("#login").click(function(e) {

         var username = $('#username').val();
         var password = $('#password').val();
         $.ajax({
             type: 'POST',
             url: '/api/auth/signin',
             crossDomain: true,
              xhrFields: { 'withCredentials': true },
              headers: {
                                           'Accept': 'application/json',
                                           'Content-Type': 'application/json'
                                       },
                                   dataType: 'json',
             data: JSON.stringify({ username: username, password: password }),
               success: function(result, status, jqXHR) {
               var cookies = jqXHR.getResponseHeader('Set-Cookie');
                                  console.log(cookies);
                        if (result?.roles?.includes('ROLE_EMPLOYEE')) {
                                window.location.href = '/myapp/employeepage';
                        } else if (result?.roles?.includes('ROLE_HR')) {
                             window.location.href = '/myapp/hrpage';
                         } else {
                                window.location.href = '/myapp/adminpage';
                        }
                          }
         });

     });
     </script>
  </body>
</html>
