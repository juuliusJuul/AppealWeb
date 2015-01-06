<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Savn.aspx.cs" Inherits="Admin_Savn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="divAdminLibrary">
        <div  style="font-size: 22px; color: #007583; padding-left: 0px; font-weight: bold">Kærumálssavn</div>
        <asp:GridView ID="GridView1"  CssClass="GridView" runat="server" AllowPaging="True" PageSize="12" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DocId" DataSourceID="LinqDataSource1" BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="700px" ShowHeader="False">
            
            <Columns>
              
                <asp:BoundField DataField="DocNr" HeaderText="DocNr" SortExpression="DocNr" />
                <asp:BoundField DataField="tblYear.YearName" HeaderText="Docyear" SortExpression="Docyear" />
                <asp:BoundField DataField="tblCourt.CourtName" HeaderText="DocCourt" SortExpression="DocCourt" />
               <%-- <asp:BoundField DataField="tblLaw.LawName" HeaderText="DocLaw" SortExpression="DocLaw" />--%>
                <asp:BoundField DataField="DocHeadText" HeaderText="DocPerson" SortExpression="DocPerson" />
                <asp:HyperLinkField DataNavigateUrlFields="DocId" DataNavigateUrlFormatString="Status.aspx?DocId={0}" Text="Yvirlit" />
                <asp:HyperLinkField DataNavigateUrlFields="DocId" DataNavigateUrlFormatString="Edit.aspx?DocId={0}" Text="Broyt" />
                <asp:HyperLinkField DataNavigateUrlFields="DocId" DataNavigateUrlFormatString="Delete.aspx?DocId={0}" Text="Sletta" />
            </Columns>
        </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MyModelContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="tblDocuments" OrderBy="Docyear desc">
        </asp:LinqDataSource>

    </div>
</asp:Content>

