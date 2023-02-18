<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
      <title>Log in with your account</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.home {
padding: 20px 40px;
width: 70%;
margin: 0 auto;
}
       .field {
        margin: 30px 0px 32px 0px;
        min-width: 26%;
        display: inline-block;
       }
     </style>

</head>
<body>

<jsp:include page="header.jsp"  />

<h1>
<p style="background-color:LightGray;color:green">Employee Management Page</p>
</h1>

<div class="home">

<form id="form">

<div class="field">
    <label for="Name">Name (FirstName LastName): *</label>
    <input  id="name" name="Name">
</div>

<div class="field">
   <label for="Salary">Salary: *</label>
   <input  id="salary" name="Salary">
</div>

 <div class="d-flex justify-content-around">
  <button class="btn btn-lg btn-primary " type="button" id="apply">Apply</button>
    <button class="btn btn-lg btn-secondary " type="reset" id="reset">Reset</button>
  </div>
</form>
  </div>

  <h4> Previously saved employees list:</h4>

<table id="employees">
  <tr>
    <th>SI #</th>
    <th>Full Name</th>
    <th>Salary</th>
  </tr>

  <c:forEach var="emp" items="${employeesList}" varStatus="loop">
          <tr>
              <td> ${loop.count} </td>
              <td> ${emp.name} </td>
              <td> ${emp.salary} </td>
              <td>
              <button class="btn edit" data-id="${emp.id}" onclick="onEdit(${emp.id})">Edit</button>
              <button class="btn delete" data-id="${emp.id}" onclick="onDelete(${emp.id})">Delete</button>
              </td>
            </tr>
    </c:forEach>

</table>

<script>
function onEdit(id) {
alert('on edit click', id);
}
function onDelete(id) {
alert('on delete click', id);
}
     // this is the id of the form
     $("#apply").click(function(e) {
        e.preventDefault();
        var name = $('#name').val();
        var salary = $('#salary').val();


        if (name && salary) {
            $.ajax({
                         type: 'POST',
                         url: '/myapp/employeepage',
                         crossDomain: true,
                         xhrFields: { 'withCredentials': true },
                         headers: {
                                 'Accept': 'application/json',
                                 'Content-Type': 'application/json'
                             },
            	         dataType: 'json',
                         data: JSON.stringify({
                           name,
                           salary,
                            }),
                       success: function(result, status, jqXHR) {
                               var cookies = jqXHR.getResponseHeader('Set-Cookie');
                               //refresh the page to get latest data
                               window.location.reload();
                         }
                     });
        } else {
            alert('Please fill required fields');
        }

     });
     </script>
</body>
</html>
