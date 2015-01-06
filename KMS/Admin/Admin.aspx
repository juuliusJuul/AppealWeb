<%@ Page Title="" Language="C#"  MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="divAdmin">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Stovna nýggjan brúkara</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style1">Skalt tu stovna nyggjan brúkara?</td>
                <td style="text-align: right" class="auto-style1">
                    <asp:Button ID="Button1" runat="server" CssClass="myButton" OnClick="Button1_Click" Text="Stovna" />
                </td>
                </tr>

        </table>
        

    </div>
    
      <div class="divAdmin2">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Broyt loyniorð</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style1">Skalt tú broyta loyniorð?</td>
                <td style="text-align: right">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"  CssClass="myButton" Text="Broyt" />
                </td>
                </tr>

        </table>
        

    </div>
     <div class="divAdmin4">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Brúkarayvirlit</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style1">Yvirlit yvir brúkarum á skipannini?</td>
                <td style="text-align: right" class="auto-style1">
                    <asp:Button ID="Button3" runat="server" CssClass="myButton" OnClick="Button3_Click" Text="Stovna" />
                </td>
                </tr>

        </table>
        

    </div>

</asp:Content>

