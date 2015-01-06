<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Kunngerd.aspx.cs" Inherits="Admin_Kunngerd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 150px;
            height: 30px;
        }
        .auto-style2 {
            width: 50px;
            height: 30px;
        }
        .auto-style3 {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="divAdmin">
        <div style="font-size: 24px; color: #007583; padding-left: 0px; font-weight: bold">Stovna ásetingarevni</div>
        <table>
         <tr>
             <td style="width: 100px;">Kunngerðir:</td>
             <td style="width: 200px; text-align: right;"><asp:TextBox ID="txtName" CssClass="myBox" runat="server"></asp:TextBox></td>
         </tr>
           <tr>
             <td colspan="2"><h3>Yvirskrift av nyggju kunngerðini. Skal útfyllast*</h3></td>
         </tr>
             <tr>
             <td style="color:red; font-size: 10px;" class="auto-style1"><asp:Label ID="lblResult" runat="server"></asp:Label></td>
                <td style="text-align: right;" class="auto-style2"><asp:Button ID="Button1" CssClass="myButton" runat="server" OnClick="Button1_Click" Text="Stovna" /></td>
         </tr>
            
     </table>
    </div>
    
    <div class ="divAdmin2">
                
        <div style="font-size: 24px; color: #007583; padding-left: 0px; font-weight: bold">Kunngerðir</div>
        <div>
        <asp:GridView ID="GridView1"  CssClass="GridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="LawId" DataSourceID="LinqDataSource1"  BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="350px" ShowHeader="False" OnRowDeleted="GridView1_RowDeleted">
            <Columns>
                
                <asp:BoundField DataField="LawName" HeaderText="§" SortExpression="LawName" />
                <asp:CommandField DeleteText="Sletta" EditText="Broyt" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MyModelContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="LawName asc" TableName="tblLaws">
            </asp:LinqDataSource>
    </div>
    </div>
    <div class="Clear"></div>
    <div class="divAdmin4">
          <div style="font-size: 24px; color: #007583; padding-left: 0px; font-weight: bold">Stovna undirevni</div>
         <table>
            <tr>
                <td>Vel ásetingarevni: </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlWord" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Vel ásetingarevni sum nyggj § skal viðheftast til</h3>
                </td>
            </tr>
            <tr>
                <td>§: </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtP" CssClass="myBox" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style3">
                    <h3> Yvirskrift av § sum skal stovnast</h3>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right">
                   
              
                    <asp:Button ID="Button7" runat="server" CssClass="myButton"  Text="Viðheft" OnClick="Button7_Click" />
                </td>
            </tr>
                 <tr>
                <td colspan="2" style="text-align: left">
                    <asp:Label ID="lblSearchWord" runat="server" Style="font-size: x-small;"></asp:Label>
              
                   
                </td>
            </tr>





        </table>
    </div>
    <div class="divAdmin3">
        <div style="font-size: 24px; color: #007583; padding-left: 0px; font-weight: bold">Undirevnir</div>
        <asp:GridView ID="GridView2"  CssClass="GridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SubLawId" DataSourceID="LinqDataSource2"  BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="350px" ShowHeader="False" OnRowDeleted="GridView1_RowDeleted">
            <Columns>
                <asp:BoundField DataField="SubLawName" HeaderText="SubLawName" SortExpression="SubLawName" />
                <asp:BoundField DataField="tblLaw.LawName" HeaderText="LawId" SortExpression="LawId" />
                <asp:CommandField DeleteText="Sletta" EditText="Broyt" ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="MyModelContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="tblLaw.LawName asc" TableName="tblSubLaws">
        </asp:LinqDataSource>
    </div>
</asp:Content>

