<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Loyni.aspx.cs" Inherits="Admin_Loyni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="divAdmin">
        <div align="center">
            
            <asp:ChangePassword ID="ChangePassword1" runat="server" CancelButtonText="Aftur" ChangePasswordButtonText="Broyt loyniorð" ChangePasswordFailureText="Okkurt gekk galið" ChangePasswordTitleText="Broyt loyniorð" ConfirmNewPasswordLabelText="Góðkenn loyniorð" ConfirmPasswordCompareErrorMessage="Loyniorðini eru ikki líka" ConfirmPasswordRequiredErrorMessage="Nytt loyniorð krevst" ContinueButtonText="Víðari" ContinueDestinationPageUrl="~/Admin/AdminHome.aspx" NewPasswordLabelText="Nýtt loyniorð" NewPasswordRegularExpressionErrorMessage="Vinarliga vel eitt nytt loyniorð" NewPasswordRequiredErrorMessage="Nýtt loyniorð krevst" PasswordLabelText="Núverandi loyniorð" PasswordRequiredErrorMessage="Loyniorð krevst" SuccessText="Loyniorði er nú broytt" SuccessTitleText="Nýggja loyniorði er góðkendt" UserNameLabelText="Brúkaranavn" UserNameRequiredErrorMessage="brúkaranavn krevst"></asp:ChangePassword>

        </div>
        

    </div>
</asp:Content>

