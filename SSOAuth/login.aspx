<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DXC.SSOAuth.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
    /*set border to the form*/
      
    form {
        border: 3px solid #f1f1f1;
    }
    /*assign full width inputs*/
      
    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    /*set a style for the buttons*/
      
    .button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }
    /* set a hover effect for the button*/
      
    button:hover {
        opacity: 0.8;
    }
    /*set extra style for the cancel button*/
       
      
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }
    /*set image properties*/
      
    img.avatar {
        width: 40%;
       
    }
    /*set padding to the container*/
      
    .container {
        padding: 16px;
    }
    /*set the forgot password text*/
      
    span.psw {
        float: right;
        padding-top: 16px;
    }
    /*set styles for span and cancel button on small screens*/
      
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="max-width:40%;text-align:center;margin:0px auto;">

       <h2>Login Form</h2>
    
    
        <div class="imgcontainer">
            <img src="data:image/png;base64,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" 
                 alt="Avatar" class="avatar">
        </div>
  
        <div class="container">            
            <asp:TextBox ID="txtlogin" runat="server"></asp:TextBox>
             <asp:Button ID="btnlogin" CssClass="button" runat="server" Text="Login" OnClick="btnlogin_Click" />  
                  
        </div>
  
            </div>
    </form>
</body>
</html>
