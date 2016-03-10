<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

<!-- jQuery library -->
<script// src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="form-group">
                    <strong>
                        <asp:Label Text="E-Mail Address" runat="server" align="centre" /></strong>
                    <asp:TextBox ID="user" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="form-group">
                    <strong>
                        <asp:Label runat="server" Text="Password" align="centre"></asp:Label></strong>
                    <asp:TextBox ID="pass" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="form-group">
                    <asp:Button ID="send" runat="server" Text="Log In" OnClick="send_Click" class="btn btn-primary dropdown-toggle btn-block" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
