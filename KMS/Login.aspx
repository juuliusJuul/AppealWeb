<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="divAdmin">
        
   
       
        <div align="center">
        <asp:Login ID="Login1" runat="server" FailureText="Tað hendi ein feilur. Prøva umaftur" LoginButtonText="Rita inn" PasswordLabelText="Loyniorð:" PasswordRequiredErrorMessage="Loyniorð krevst" RememberMeText="Goym loyniorð" TitleText="" UserNameLabelText="Brúkaranavn:" UserNameRequiredErrorMessage="Brúkaranavn krevst">
        </asp:Login>
        
        </div>
        

    </div>
</asp:Content>

