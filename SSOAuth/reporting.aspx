<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sisense SSO JWT demo</title>
</head>
<body>
    <h1>Reporting!</h1>
    <p>This page contains an iFrame with Sisense embedded in it. It should open up on the main page, with the user you provided in the previous page.</p>
    <button id="logout">Log out</button>
    <br/>
    <div>
        <iframe id="frame1" style="width:100%;height:500px" src="http://reporting.motigra.com:8081/app/main#/home"></iframe>
    </div>
    <script
      src="https://code.jquery.com/jquery-3.1.1.min.js"
      integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
      crossorigin="anonymous"></script>
    <script src="js.cookie.js"></script>
    <script>

    </script>
</body>
</html>
