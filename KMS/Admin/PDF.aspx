<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="PDF.aspx.cs" Inherits="Admin_PDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="divAdmin">
        <div style="font-size: 24px; color: #007583; padding-left: 0px; font-weight: bold">Viðheft PDF ella Word-fíl</div>
        <table>
            <tr>
             <td style="width: 100px;">Sagarmálsnummar: </td>
             <td style="width: 200px; text-align: left;">
                  <asp:DropDownList ID="ddlCaseNr" CssClass="myList" runat="server"
                           
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">-- vel her --</asp:ListItem>
                        </asp:DropDownList></td>
         </tr>
           <tr>
             <td colspan="2" class="auto-style2"><h3>Vel kærumál. Skal útfyllast*</h3></td>
         </tr>
            <tr>
             <td style="width: 100px;">Yvirskrift: </td>
             <td style="width: 200px; text-align: left;">
                 <asp:TextBox ID="txtHead" CssClass="myBox" runat="server"></asp:TextBox></td>
         </tr>
           <tr>
             <td colspan="2" class="auto-style2"><h3>Titul av viðheftu fílu. Skal útfyllast*</h3></td>
         </tr>

            <tr>
                <td style="width: 100px;">Viðheft:</td>
                <td style="width: 170px;">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style1">
                    <h3>Vel fílu sum skal viðheftast kærumálið. Skal veljast*</h3>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right">
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    <asp:Button ID="Button1" runat="server" Text="Viðheft" OnClick="Button1_Click1" /></td>

            </tr>
        </table>
        <br/>
    </div>
    <div class="divAdmin2">
        
        <div style="font-size: 24px; color: #007583; padding-left: 0px; font-weight: bold">Yvirlit yvir viðheftar fílur</div>
        
            <div>
                Vel sagarmáls nr: <asp:DropDownList ID="ddlSearchCase"  CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList>
                 <asp:Button ID="Button2" runat="server" Width="100px" Text="Leita" Height="26px" OnClick="Button2_Click" />
           </div>
        
        
        
        <asp:GridView ID="GridView1" runat="server" CssClass="GridView" AutoGenerateColumns="False" DataKeyNames="DocId,FileId" DataSourceID="LinqDataSource1" BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="350px" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="tblDocument.DocNr" HeaderText="Sagarmálsnummar" ReadOnly="True" SortExpression="DocId" />
                <asp:BoundField DataField="tblUpload.FileName" HeaderText="Yvirskrift" ReadOnly="True" SortExpression="FileId" />
                <asp:CommandField DeleteText="Sletta" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        

        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MyModelContext" EntityTypeName="" OrderBy="tblDocument.DocNr asc" TableName="tblUploadDocuments" Where="tblDocument.DocNr == @DocNr" EnableDelete="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="ddlSearchCase" Name="DocNr" PropertyName="SelectedItem.Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        

        <br/>
    </div>

</asp:Content>

