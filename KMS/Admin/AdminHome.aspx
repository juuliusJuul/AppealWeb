<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="Admin_AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 212px;
        }
        .auto-style2 {
            height: 35px;
        }
        .auto-style3 {
            height: 48px;
        }
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
     <div class="divAdmin">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Stovna kærumál</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style1">Skalt tu stovna nyggja kæru? So hevur tú møguleikan her </td>
                <td style="text-align: right">
                    <asp:Button ID="Button2" runat="server" CssClass="myButton" OnClick="Button2_Click1" Text="Víðari" />
                </td>
                </tr>

        </table>
        

    </div>
    
     <div class="divAdmin2">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Kærumálssavn</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style1">Skalt tú viðlíkhalda kærumálssavnið? Ella skalt tu sletta og gerða broytingar, so hevur tú møguleikan her </td>
                <td style="text-align: right">
                    <asp:Button ID="Button8" runat="server" CssClass="myButton" OnClick="Button8_Click" Text="Víðari" />
                </td>
                </tr>

        </table>
        

    </div>
    
    

    <div class="divAdmin4">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Viðheftingar</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;">Skal tað viðheftast evnir, ásetingar ella leitiorð til kæruna, so hevur tú møguleikan her</td>
                <td style="text-align: right">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="myButton" Text="Víðari" />
                </td>
                </tr>

        </table>
        

    </div>
    
     
    
     <div class="divAdmin3">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">PDF</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style3">Viðheft PDF fílur til kærunar. Eisini kanst tú viðlikhalda skjølini her.</td>
                <td style="text-align: right" class="auto-style3">
                   
                    <asp:Button ID="Button3" runat="server" CssClass="myButton" OnClick="Button3_Click1" Text="Víðari" />
                   
                </td>
                </tr>

        </table>
        

    </div>
    
    
     <div class="divAdmin4">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Stovna málsviðgera</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style3">Skalt tu stovna nyggjan málsviðgera? Ella skalt tu viðlíkahalda ella sletta viðkomandi, so hevur tú møguleika her</td>
                <td style="text-align: right" class="auto-style3">
                   
                    <asp:Button ID="Button9" runat="server" CssClass="myButton" OnClick="Button3_Click" Text="Víðari" />
                   
                </td>
                </tr>

        </table>
        

    </div>
     
     <div class="divAdmin3">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Stovna nýggjar ásetingar </td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;">Skalt tu stovna nyggja áseting ella skalt tu viðlíkahalda ella sletta gamla ásetingar, so hevur tu møguleikan her</td>
                <td style="text-align: right">
                   
                    <asp:Button ID="Button7" CssClass="myButton" runat="server" OnClick="Button7_Click" Text="Víðari" />
                   
                </td>
                </tr>

        </table>
        

    </div>
    <div class="divAdmin4">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Stovna Ár</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style2">Manglar eitt ár í skipannini? So hevur tú møguleikan at stovna ella viðlíkhalda tað her..</td>
                <td style="text-align: right" class="auto-style2">
                   
                    <asp:Button ID="Button4" runat="server" CssClass="myButton" Text="Víðari" OnClick="Button9_Click" />
                   
                </td>
                </tr>

        </table>
        

    </div>
       <div class="divAdmin3">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Stovna Rætt</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style2">Manglar ein rættur í skipannini, so hevur tú møguleikan at stovna ella viðlíkhald tað her.</td>
                <td style="text-align: right" class="auto-style2">
                   
                    <asp:Button ID="Button5" runat="server" CssClass="myButton" Text="Víðari" OnClick="Button5_Click" />
                   
                </td>
                </tr>

        </table>
        

    </div>
    
    
    
    
    
    
     <div class="divAdmin4">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Stovna nýtt evni</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style2">Manglar eitt evni í skipaninni? Stovna tað her</td>
                <td style="text-align: right" class="auto-style2">
                   
                    <asp:Button ID="Button10" runat="server" CssClass="myButton" Text="Víðari" OnClick="Button6_Click" />
                   
                </td>
                </tr>

        </table>
        

    </div>
    <div class="divAdmin3">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Stovna nýtt leitiorð</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style2">Manglar ein rættur í skipannini, so hevur tú møguleikan at stovna ella viðlíkhald tað her.</td>
                <td style="text-align: right" class="auto-style2">
                   
                    <asp:Button ID="Button6" runat="server" CssClass="myButton" Text="Víðari" OnClick="Button6_Click1" />
                   
                </td>
                </tr>

        </table>
        

    </div>
    <div style="height: 25px;"></div>
<%--    <div class="divAdmin3">
        <table style="width:400px;">
            <tr>
                <td colspan="2" style="font-size: 22px; color: #007583; font-weight: bold">Stovna málsviðgera</td>
            </tr>
            <tr>
                <td style="font-size: 12px;color: #808080;" class="auto-style3">Skalt tu stovna nyggjan málsviðgera? Ella skalt tu viðlíkahalda ella sletta viðkomandi, so hevur tú møguleika her</td>
                <td style="text-align: right" class="auto-style3">
                   
                    <asp:Button ID="Button6" runat="server" CssClass="myButton" OnClick="Button3_Click" Text="Víðari" />
                   
                </td>
                </tr>

        </table>
        

    </div>--%>
    
     </asp:Content>

