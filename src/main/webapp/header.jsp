
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(document).ready(function() {
    $("#logout").on('click', function(e) {
        e.preventDefault();
       $.ajax({
                    type: 'POST',
                    url: '/api/auth/signout',
                    crossDomain: true,
                     xhrFields: { 'withCredentials': true },
                     headers: {
                              'Accept': 'application/json',
                              'Content-Type': 'application/json'
                          },
                      success: function(result, status, jqXHR) {
                            window.location.href = '/';
                           // $.cookie("name", null, { path: '/' });
                         }
                });
    });
 });
</script>

<style>
.header-bar {
    display: flex;
    justify-content: space-between;
    min-height: 100px;
    width: 100%;
    background: lightsteelblue;
}
#logout {
    margin-left: auto;
    padding: 35px;
    font-weight: bold;
    }
.avatar {
  vertical-align: middle;
  width: 90px;
  height: 90px;
  margin: 15px;
  border-radius: 50%;
  border: 2px solid grey;
  background: lightgrey;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 25px;
  font-weight: bold;
}
</style>

<div class="header-bar">
<div class="avatar">U</div>
<a href="/signout" id="logout">Log Out</a>
</div>
