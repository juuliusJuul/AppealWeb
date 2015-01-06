<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>


<%--<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.7.1213, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div id="SearchFilter">
        <cc1:Editor ID="Editor1" runat="server" />
       
        <div style="margin-left: 10px; margin-top: 15px;">
            <table>
                <tr>
                    <td>Ár:</td>
                    <td>
                        <asp:DropDownList ID="ddlYear" CssClass="myList" runat="server"
                           
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">-- vel ár --</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <cc1:Editor ID="Editor2" runat="server" />
               
                <tr>
                    <td>Málsviðgeri:</td>
                    <td>
                        <asp:DropDownList ID="ddlPerson" CssClass="myList" runat="server"
                           
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">-- vel málsviðgera --</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td>Ásetingar:</td>
                    <td>
                        <asp:DropDownList ID="ddlLaws" CssClass="myList" runat="server"
                            
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">-- vel áseting --</asp:ListItem>
                        </asp:DropDownList></td>

                </tr>
                
                <tr>
                    <td>Rættur:</td>
                    <td>
                        <asp:DropDownList ID="ddlCourt" CssClass="myList" runat="server"
                            
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">-- vel rætt --</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td>Evnið:</td>
                    <td>
                        <asp:DropDownList ID="ddlCat" CssClass="myList" runat="server"
                            
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">-- vel evnið --</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td>Finn sakarmál: </td>
                    <td>
                        <asp:TextBox ID="txtCasrNr" CssClass="myBox" runat="server" /></td>
                </tr>
                <tr>
                    
                    <td colspan="2" style="text-align: right">
                      
                        <asp:Button ID="Button1" Width="89px"  runat="server" Text="Rudda" OnClick="Button1_Click" />
                        <asp:Button runat="server" Width="89px"  Text="Leita" OnClick="Unnamed1_Click" /></td>
                </tr>

            </table>
        </div>
    </div>
    <div id="Body">
        <div id="repeter" runat="server">
        <asp:Repeater ID="rptResult" runat="server">
            <HeaderTemplate>

                <table class="Library">
                    <tr>

                        <td style="width: 110px; text-align: center; vertical-align: top;"><b>Sakarmáls nr</b></td>
                        <td style="width: 90px; text-align: center; vertical-align: top;"><b>Yvirskrift</td>
                        <td style="width: 30px; text-align: center;vertical-align: top;"><b>Ár</td>
                        <td style="width: 100px; text-align: center;vertical-align: top;"><b>Rættur</td>
                        <td style="width: 145px; text-align: center;vertical-align: top;"><b>Lýsing</td>

                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align: center;vertical-align: top; width:120px;"><a href="Window.aspx?id=<%# Eval("DocId") %>" onclick="window.open(this.href, 'mywin',
					'left=10,top=10,width=540,height=620,toolbar=1,resizable=0'); return false;"><%#Eval("DocNr")%></a></td>
                     <%--<a href=""></a><--%>
                    <%--<td style="width: 100px; text-align: center;"><%#Eval("DocNr")%></td>--%>
                    <td style="width: 110px;vertical-align: top; text-align: center;"><%#Eval("DocHeadText")%></td>
                    <td style="width: 30px;vertical-align: top; text-align: center;"><%#Eval("tblYear.YearName") %></td>
                    <td style="width: 100px;vertical-align: top; text-align: center;"><%#Eval("tblCourt.CourtName")%></td>
                    <td style="width: 165px;vertical-align: top;"><%#Text(Eval("DocResume").ToString())%></td>
                </tr>


            </ItemTemplate>
            <FooterTemplate></table>
</FooterTemplate>


        </asp:Repeater>
            </div>


        
        <div align="center" style="padding-top: 3px;">
            <br/><asp:Label ID="lblDisplay" Text="Leita áðrenn skrásetingar verða vístar" runat="server"></asp:Label>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    
    <asp:TextBox ID="txtWord"  runat="server"></asp:TextBox><asp:Button ID="Button2" Width="100px" runat="server" Text="Leita" OnClick="Button2_Click" />
     <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtWord" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000" 
         ServiceMethod="GetCity" >
    </ajaxToolkit:AutoCompleteExtender>
   <%-- <div><a href="Bilag.pdf" target="_blank">Les her</a></div>--%>
</asp:Content>


