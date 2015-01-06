<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Window.aspx.cs" Inherits="Window" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kærumál</title>
    <link href="WindowSheet.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style1 {
            width: 500px;
        }
        .auto-style2 {
            width: 150px;
            height: 15px;
        }
        .auto-style3 {
            width: 350px;
            height: 15px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="Window">
            
            <asp:Repeater ID="rptHead" runat="server">
                <ItemTemplate>
                    <div style="background-color: #E4D100; height: 37px; width: 490px; font-size: 24px; padding-left: 10px; padding-top: 6px;">
                        <b>Sakarmálsnummar: <%#Eval("DocNr") %></b><div style="text-align: right; float: right; padding-top: 4px; padding-right: 5px;">
                            <a href="#" onclick="window.print();return false">
                                <img src="Images/printergreen.png" width="16px" height="17px" alt="Print" /></a>
                        </div>
                    </div>
                    <div width="500px"><b>Yvirskrift: </b><%#Eval("DocHeadText") %></div>
                </ItemTemplate>
            </asp:Repeater><div style="float: left; width: 249px;">

                <div style="background-color: #E4D100; text-align: center; border: black solid 1px;">Evni</div>
                <div style="background-color: #FFFFCC; min-height: 100px; max-height: auto;">
                    <asp:Repeater ID="rptCategory" runat="server">
                        <ItemTemplate><%#Eval("CategoryName") %><br />
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Label ID="lblCat" runat="server" Text="Label"></asp:Label>
                </div>
            
            
            
            
</div>

<div style="float: left; width: 249px;">
                <div style="background-color: #E4D100; text-align: center; border: black solid 1px;">Ásetingar</div>
                <div style="background-color: #FFFFCC; min-height: 100px; max-height: auto;">
                    <asp:Repeater ID="rptLaw" runat="server">
                        <ItemTemplate><%#Eval("tblLaw.LawName")%> - <%#Eval("SubLawName") %><br />
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Label ID="lblLaew" runat="server" Text=""></asp:Label>
                </div>
            
            </div>
            
            <div style="float: left; width: 249px;">
                <div class="Clear"></div><table class="auto-style1">
                <asp:Repeater ID="rptDisplay" runat="server">
                    <ItemTemplate>
                        
                            <br />
                            <tr>
                                <td style="width: 150px"><b>Ár:</b></td>
                                <td style="width: 350px"><%#Eval("tblYear.YearName") %></td>
                            </tr>
                            <tr>
                                <td style="width: 150px"><b>Rættur:</b></td>
                                <td style="width: 350px"><%#Eval("tblCourt.CourtName") %></td>
                            </tr>
                            <tr>
                                <td style="width: 150px"><b>Málsviðgeri:</b></td>
                                <td style="width: 350px"><%#Eval("tblPerson.PersonName") %></td>
                            </tr>
                            <tr>
                                <td style="width: 150px"><b>Lýsing:</b></td>
                                <td style="width: 350px"><%#Eval("DocResume") %></td>
                            </tr>
                            <tr>
                                <td style="width: 150px"><b>Niðurstøða:</b></td>
                                <td style="width: 350px"><%#Eval("DocResult") %></td>
                            </tr>
                            


                        
                    </ItemTemplate>
                </asp:Repeater>
                    <tr>
                       
                                <td style="width: 150px"><b>Viðtøkur:</b></td>
                                <td style="width: 350px">
                                    <asp:Repeater id="rptPdf" runat="server">
                            <ItemTemplate><a href="./File/<%#Eval("FileUrl") %>" target="_blank"><%#Eval("FileName") %></a>
                                              &nbsp;&nbsp;</div></ItemTemplate>
                        </asp:Repeater>
                                    <asp:Label ID="lblPdf" runat="server" Text=""></asp:Label></td>
                            
                    </tr>
        

                </table>
               
                   
                    
                   <%-- <div style="float: left;">
                        <div style="width: 154px; background-color: red;">Vís útskurð: </div>
                        
                    </div>
                <div style="float: left;">gsdfgsdgsdgsdsdg</div>--%>
                    
                                                  
                        
                      <%--  --%>
                        
                 
                        
                      
                           
                        
                       
                
           


      
</div>
            </div>
        

    </form>

    <p>
&nbsp;
    </p>

</body>
</html>
