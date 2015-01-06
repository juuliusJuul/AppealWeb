<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Evni.aspx.cs" Inherits="Admin_Evni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="divAdmin">
         <div style="font-size: 24px; color: #007583; padding-left: 0px; font-weight: bold">Stovna evnir</div>
        <table>
         <tr>
             <td style="width: 100px;">Evnir</td>
             <td style="width: 200px; text-align: right;"><asp:TextBox ID="txtName" CssClass="myBox" runat="server"></asp:TextBox></td>
         </tr>
           <tr>
             <td colspan="2" class="auto-style1"><h3>Yvirskrift hjá evnið. Skal útfyllast*</h3></td>
         </tr>
             <tr>
             <td style="width: 150px; color:red; font-size: 10px;"><asp:Label ID="lblResult" runat="server"></asp:Label></td>
                <td style="width: 50px; text-align: right;"><asp:Button ID="Button1" CssClass="myButton" runat="server" Text="Stovna" OnClick="Button1_Click" /></td>
         </tr>
           
     </table>
    </div>
    
    <div class ="divAdmin2">
        <div style="font-size: 24px; color: #007583; padding-left: 6px; font-weight: bold">Evnir</div>
        <div>
        <asp:GridView ID="GridView1"  CssClass="GridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="LinqDataSource1" BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="350px" ShowHeader="False" OnRowDeleted="GridView1_RowDeleted">
            <Columns>
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" DeleteText="Sletta" EditText="Broyt" />
            </Columns>
        </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MyModelContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="CategoryName" TableName="tblCategories">
            </asp:LinqDataSource>
    </div>
    </div>
</asp:Content>

