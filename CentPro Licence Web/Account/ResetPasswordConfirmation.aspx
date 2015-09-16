<%@ Page Title="Password Changed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.cs" Inherits="CentPro_Licence_Web.Account.ResetPasswordConfirmation" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <div>
        <p>Passordet ditt har blitt endret. <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">Klikk her</asp:HyperLink> for å logge inn.</p>
    </div>
</asp:Content>
