<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Confirm.aspx.cs" Inherits="Admin_Confirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="divAdmin">
        <br/>
        <div align="Center">Er tú sikkur?</div>
    <div align="center">    
    <asp:Button ID="Button2" runat="server" Text="Nei" OnClick="Button2_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server"  Text="Ja" OnClick="Button1_Click" />
        </div>
    </div>
</asp:Content>

