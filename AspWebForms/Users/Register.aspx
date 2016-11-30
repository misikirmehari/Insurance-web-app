<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AspWebForms.Users.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link href="../Content/bootstrap.min.css" rel="stylesheet" />
  <link href="../Content/UserDefined.css" rel="stylesheet" />
    <title></title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: small">
    <form id="form1" runat="server">
    <div class="text-center jumbotron container form-login">
        <h2 class="brand-name text-primary">CREATE A NEW ACCOUNT</h2>
        <hr />
        <p class="text-danger ">
            <asp:Literal runat="server" ID="StatusMessage" />
        </p>                
        <div style="margin-bottom:10px" class="text-primary">
            <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="UserName" />                
            </div>
        </div>
        <div style="margin-bottom:10px" class="text-primary">
            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="Password" TextMode="Password" />                
            </div>
        </div>
        <div style="margin-bottom:10px" class="text-primary">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />                
            </div>
        </div>
        <div>
            <div >
                <asp:Button class=" btn btn-primary btn-md" runat="server" OnClick="CreateUser_Click" Text="SignUp" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>