<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Status.aspx.cs" Inherits="Admin_Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="divAdmin">
        <div id="divAdminLibrary">



            <asp:Repeater ID="rptCase" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="width: 150px;"><b>ID</b></td>
                            <td style="width: 500px;">
                                <%#Eval("DocId") %></td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><b>Sakarmáls nr:</b></td>
                            <td style="width: 500px;">
                                <%#Eval("DocNr") %></td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><b>Yvirskrift</b></td>
                            <td style="width: 500px;">
                                <%#Eval("DocHeadText") %></td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><b>Rættur</b></td>
                            <td style="width: 500px;">
                                <%#Eval("tblCourt.CourtName") %></td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><b>Ár</b></td>
                            <td style="width: 500px;">
                                <%#Eval("tblYear.YearName") %></td>
                        </tr>
                        <tr>
                            <td style="width: 150px;"><b>Málsviðgeri</b></td>
                            <td style="width: 500px;">
                                <%#Eval("tblPerson.PersonName") %></td>
                        </tr>
                        <tr>
                            <td style="width: 150px; vertical-align: top; padding-top: 5px;"><b>Lýsing</b></td>
                            <td style="width: 500px; padding-right:5px; padding-top: 5px;">
                                <%#Eval("DocResume") %></td>
                        </tr>
                        <tr>
                            <td style="width: 150px; vertical-align: top;  padding-top: 5px;"><b>Niðurstøða</b></td>
                            <td style="width: 500px; padding-right:5px; padding-top: 5px;">
                                <%#Eval("DocResult") %></td>
                        </tr>

                    </table>

                </ItemTemplate>

            </asp:Repeater>
            <div>
            <div style="width: 124px; float: left; padding-top:3px;"><b>Ásetingar</b></div>
            <div style="width: 300px; float: left; padding-top:3px;">
                <asp:Label ID="lblLaew" runat="server" />
                <asp:Repeater ID="rptLaw" runat="server">
                
                <ItemTemplate>
                    <%#Eval("tblLaw.LawName")%> - <%#Eval("SubLawName") %>
                    <br />

                </ItemTemplate>
            </asp:Repeater></div>
                <div class="Clear"></div>
            
        </div>
        </div>
        <div style="width: 124px; padding-top:3px; float: left;"><b>Evni</b></div>
        <div style="width: 300px; padding-top:3px;  float: left;">
            <asp:Label ID="lblCat" runat="server"></asp:Label>
            <asp:Repeater ID="rptCategory" runat="server">
            <ItemTemplate>
                <%#Eval("CategoryName") %> <br />
                

            </ItemTemplate>
        </asp:Repeater></div>
        <div class="Clear"></div>
        <div style="width: 124px; padding-top:3px; float: left;"><b>PDF</b></div>
        <div style="width: 300px; padding-top:3px;  float: left;"> <asp:Label ID="lblPdf" runat="server" ></asp:Label>
            <asp:Repeater ID="rptPdf" runat="server">
        <ItemTemplate>
            <a href="../File/<%#Eval("FileUrl") %>" target="_blank"><%#Eval("FileName") %></a> <br />
           
        </ItemTemplate>
    </asp:Repeater>
     <br />
    </div>

















    <%--<asp:Repeater ID="rptCategory" runat="server">
        <ItemTemplate>
            <%#Eval("CategoryName") %><br />
        </ItemTemplate>
    </asp:Repeater>--%>
   







    </div>
    </div>
</asp:Content>

