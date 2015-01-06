<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div class="AdminFilter">
        <asp:ToolkitScriptManager runat="server"></asp:ToolkitScriptManager>
     <table>
         <tr>
             <td style="width: 100px;">Sakarmáls nr:</td>
             <td style="width: 170px;"><asp:TextBox ID="txtCaseNr" CssClass="myBox" runat="server"></asp:TextBox></td>
         </tr>
           <tr>
             <td colspan="2"><h3>Nummar hjá sakarmálið. Skal útfyllast*</h3></td>
         </tr>
     </table>
 </div>
    

    <div class="AdminFilter3">
         <table>
         <tr>
             <td style="width: 100px;">Yvirskrift:</td>
             <td style="width: 170px;"><asp:TextBox ID="txtHead" CssClass="myBox" runat="server"></asp:TextBox></td>
         </tr>
           <tr>
             <td colspan="2"><h3>Yvirskrift hjá sakarmálið. Skal útfyllast*</h3></td>
         </tr>
     </table>
        </div> 
    
    <div class="AdminFilter3">
        <table>
         <tr>
             <td style="width: 100px;">Rættur:</td>
             <td style="width: 170px;"><asp:DropDownList ID="ddlCourt" CssClass="myList" runat="server" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">-- vel her --</asp:ListItem>    

                    </asp:DropDownList></td>
         </tr>
           <tr>
             <td colspan="2"><h3>Hvørjum rætti sakarmálið bla bla. Skal útfyllast*</h3></td>
         </tr>
     </table>
        </div>
    
    <div class="AdminFilter2">
        <table>
         <tr>
             <td style="width: 100px;">Ár:</td>
             <td style="width: 170px;"><asp:DropDownList ID="ddlYear" CssClass="myList" runat="server" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">-- vel her --</asp:ListItem>    

                    </asp:DropDownList></td>
         </tr>
           <tr>
             <td colspan="2"><h3>Ár sakarmálið var stovna. Skal útfyllast*</h3></td>
         </tr>
     </table>
        </div>
   <%-- <div class="AdminFilter4">
        <table>
         <tr>
             <td style="width: 75px; vertical-align: top;">Lýsing</td>
             <td style="width: 300px;">
                 <cc1:Editor ID="Editor1" Width="300px" Height="400px" runat="server" />
             </td>
         </tr>
           <tr>
             <td colspan="2"><h3>Samandráttur av sagarmálinum. Skal útfyllast*</h3></td>
         </tr>
     </table>
    </div>--%>
    <div class="AdminFilter4">
        <table>
         <tr>
             <td style="width: 100px;">Málsviðgeri:</td>
             <td style="width: 170px;"><asp:DropDownList ID="ddlPerson" CssClass="myList" runat="server" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">-- vel her --</asp:ListItem>    

                    </asp:DropDownList></td>
         </tr>
           <tr>
             <td colspan="2"><h3>Málsviðgeri hjá sakarmálinum. Skal útfyllast*</h3></td>
         </tr>
     </table>
        </div>
    
   
  
  <%--  <div class="AdminFilter4">
        <table>
         <tr>
             <td style="width: 100px;">Viðheft:</td>
             <td style="width: 170px;">
                 <asp:FileUpload BackColor="#e4d100" ID="FileUpload1" runat="server" />
             </td>
         </tr>
           <tr>
             <td colspan="2"><h3>Hvørjum rætti sagarmálið bla bla. Skal útfyllast*</h3></td>
         </tr>
     </table>
        </div>--%>
    <div class="Clear"></div>
    
    <div class="TextFilter">
        <div style="text-align: center; margin-top: 8px;">Lýsing</div>
        <div style="padding-left: 15px;"><h3>Ein lýsing yvir kærumálið</h3></div>
        <div align="center">
            <cc1:Editor ID="Editor1" Width="444px" Height="320" runat="server" />
        </div>

    </div>
    <div class="TextFilter2">
        <div style="text-align: center; margin-top: 8px;">Niðurstøða</div>
        <div style="padding-left: 15px;"><h3>Niðurstøðan hjá kærumálinum</h3></div>
        <div align="center">
            <cc1:Editor ID="Editor2" Width="444px" Height="320" runat="server" />
        </div>
        
          </div>
     <br/>
    <br/>
    <div align="right">&nbsp;&nbsp;&nbsp;</div>
    <div style="height: 25px; width: 960px; margin-top: 10px; vertical-align: middle; text-align: right;">
   &nbsp;<asp:Label ID="lblResult" runat="server"></asp:Label>&nbsp;
        <asp:Button ID="Button1" Width="100px" runat="server" Text="Reset" OnClick="Button1_Click"/>
   <asp:Button runat="server" Width="100px" Text="Stovna" OnClick="Unnamed1_Click"/></div>
    <br/>
</asp:Content>



