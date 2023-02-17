<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>

<jsp:include page="header.jsp" />
<a href="/myapp/employeepage" style="background-color:pink;">Apply Birth Certificate </a><p>
<a href="/myapp/employeepage" style="background-color:pink;"> View Birth Certificate Application Status</a>
	
    <h1>
<p style="background-color:LightGray;color:green">view birth certificate Application Status</p>
</h1>

<style>
#Birth {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#Birth td, #Birth th {
  border: 1px solid #ddd;
  padding: 8px;
}

#Birth:nth-child(even){background-color: #f2f2f2;}

#Birth tr:hover {background-color: #ddd;}

#Birth th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
<body>

<table id="Birth">
  <tr>
    <th>SI #</th>
    <th>Application Type</th>
    <th>Applied on</th>
    <th>Status</th>
  </tr>

  <c:forEach var="emp" items="${employeesList}" varStatus="loop">
          <tr>
              <td> ${loop.count} </td>
              <td> ${emp.childName} - Birth Certificate</td>
              <td> ${emp.appliedOn} </td>
              <td> ${emp.status} - <button class="btn success" class="download" data-id="${emp.id}" >Download</button></td>
            </tr>
    </c:forEach>
  
</table>
<script>
$('.download').click(function () {
    var bcId = $(this).attr('data-id');
        $.ajax({
                         type: 'GET',
                         url: '/api/downloadbc/' + bcId,
                         crossDomain: true,
                         xhrFields: { 'withCredentials': true },
                       success: function(result, status, jqXHR) {

                         }
                     });

});
</script>

</body>
</html>
