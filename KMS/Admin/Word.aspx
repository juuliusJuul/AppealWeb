﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Word.aspx.cs" Inherits="Admin_Word" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="divAdmin">
        <div style="font-size: 24px; color: #007583; padding-left: 0px; font-weight: bold">Stovna leitiorð</div>
        <table>
         <tr>
             <td style="width: 100px;">Leitiorð:</td>
             <td style="width: 200px; text-align: right;"><asp:TextBox ID="txtName" CssClass="myBox" runat="server"></asp:TextBox></td>
         </tr>
           <tr>
             <td colspan="2" class="auto-style2"><h3>Navnið á leitiorði sum skal skrásetast. Skal útfyllast*</h3></td>
         </tr>
            <tr>
             <td style="width: 150px; color:red; font-size: 10px;"><asp:Label ID="lblResult" runat="server"></asp:Label></td>
                <td style="width: 50px; text-align: right;"><asp:Button ID="Submit" CssClass="myButton" Text="Stovna" runat="server" OnClick="Submit_Click"/></td>
         </tr>
     </table>
    </div>
 
    <div class ="divAdmin2">
        <div style="font-size: 24px; color: #007583; padding-left: 6px; font-weight: bold">Leitiorð</div>
        <div>
        <asp:GridView ID="GridView1"  CssClass="GridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="LinqDataSource1" BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="350px" ShowHeader="False" OnRowDeleted="GridView1_RowDeleted">
            <Columns>
                <asp:BoundField DataField="SearchName" HeaderText="SearchName" SortExpression="SearchName" />
                <asp:CommandField DeleteText="Sletta" EditText="Broyt" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MyModelContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="SearchName asc" TableName="tblSearchWords">
        </asp:LinqDataSource>
    </div>
        <br/>
    </div>
</asp:Content>

