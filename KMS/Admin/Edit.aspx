<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Admin_Edit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="AdminFilter">
        <table>
            <tr>
                <td style="width: 100px;">Sakarmáls nr:</td>
                <td style="width: 170px;">
                    <asp:TextBox ID="txtCase" CssClass="myBox" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Nummar hjá sakarmálið. Skal útfyllast*</h3>
                </td>
            </tr>
        </table>
    </div>

    <div class="AdminFilter3">
        <table>
            <tr>
                <td style="width: 100px;">Yvirskrift:</td>
                <td style="width: 170px;">
                    <asp:TextBox ID="txtHead" CssClass="myBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Hvørjum rætti sakarmálið bla bla. Skal útfyllast*</h3>
                </td>
            </tr>
        </table>
    </div>
    <div class="AdminFilter3">
        <table>
            <tr>
                <td style="width: 100px;">Rættur:</td>
                <td style="width: 170px;">
                    <asp:DropDownList ID="ddlCourt" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Hvørjum rætti sakarmálið bla bla. Skal útfyllast*</h3>
                </td>
            </tr>
        </table>
    </div>

    <div class="AdminFilter2">
        <table>
            <tr>
                <td style="width: 100px;">Ár:</td>
                <td style="width: 170px;">
                    <asp:DropDownList ID="ddlYear" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Ár sakarmálið var stovna. Skal útfyllast*</h3>
                </td>
            </tr>
        </table>
    </div>
    <div class="AdminFilter4">
        <table>
            <tr>
                <td style="width: 100px;">Málsviðgeri:</td>
                <td style="width: 170px;">
                    <asp:DropDownList ID="ddlPerson" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Málsviðgeri hjá sakarmálinum. Skal útfyllast*</h3>
                </td>
            </tr>
        </table>
    </div>
   <%-- <div class="AdminFilter4">
        <table>
            <tr>
                <td style="width: 100px;">Viðheft:</td>
                <td style="width: 170px;">
                    <asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:label runat="server" ID="lblPdf"></asp:label>
                </td>
            </tr>
        </table>
    </div>--%>
    <div class="Clear"></div>
    <div class="TextFilter">
        <div style="text-align: center; margin-top: 8px;">Lýsing</div>
        <div style="padding-left: 15px;">
            <h3>Ein lýsing yvir bla bla bla bla bla</h3>
        </div>
        <div align="center">
            <cc1:Editor ID="Editor1" Width="444px" Height="320" runat="server" />
        </div>

    </div>
    <div class="TextFilter2">
        <div style="text-align: center; margin-top: 8px;">Niðurstøða</div>
        <div style="padding-left: 15px;">
            <h3>Ein niðurstøða yvir bla bla bla bla bla</h3>
        </div>
        <div align="center">
            <cc1:Editor ID="Editor2" Width="444px" Height="320" runat="server" />
        </div>
    </div>
    

    <br/>
    <div align="right">&nbsp;&nbsp;&nbsp;</div>
    <div style="height: 25px; width: 960px; margin-top: 10px; vertical-align: middle; text-align: right;">
   &nbsp;<asp:Label ID="lblResult" runat="server"></asp:Label>&nbsp;<asp:Button ID="Button1" Width="100px" runat="server" Text="Aftur" OnClick="Button1_Click" /><asp:Button ID="Button2" Width="100px" runat="server" Text="Broyt" OnClick="Button2_Click" /></div></div>
    <br/>
    
    
    
    
    
    

   
</asp:Content>

<%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:DropDownList ID="ddlPerson" runat="server"/>
        <asp:DropDownList ID="ddlYear" runat="server"/>
        <asp:DropDownList ID="ddlLaws" runat="server"/>
        <asp:DropDownList ID="ddlCourt" runat="server"/>
        <asp:TextBox ID="txtCase" runat="server"></asp:TextBox>--%>