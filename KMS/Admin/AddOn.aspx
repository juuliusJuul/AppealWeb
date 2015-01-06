<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddOn.aspx.cs" Inherits="Admin_AddOn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 180px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    
    <div class="AdminFilter">
    
     <table>
         <tr>
             <td style="width: 100px;">Sakarmáls nr:</td>
             <td style="width: 170px;">
                    <asp:DropDownList ID="ddlCase" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList>
             </td>
         </tr>
           <tr>
             <td colspan="2"><h3>Nummar hjá sakarmálið. Skal veljast*</h3></td>
         </tr>
     </table>
 </div>
    <div class="Clear"></div>
    <div class="AddOn">
        
        <div class="Left">  <div  style="font-size: 22px; color: #007583;  font-weight: bold">Viðheft ásetingar</div>  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                                                                           <ContentTemplate><table>
            <tr>
                <td style="width: 100px;">Vel evnið: </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddlLawCat" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList></td>
                <td>  <asp:Button ID="Button3" runat="server" Width="100px" Text="Vel" OnClick="Button3_Click" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Vel ásetingarevni og tryst á vel</h3>
                </td>
            </tr>

        </table>
<div>
    

   <div style="width: 110px; float: left;">Vel §:</div><div style="float: left;">
       <asp:DropDownList ID="ddlHidden" CssClass="myBox" runat="server"></asp:DropDownList>
       <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Viðheft" Width="100px" />
    </div><div class="Clear"></div>
   </div>
            
    
    
<div style="height:25px;">
        <asp:Label ID="lblLaw" runat="server" Text="" style="font-size: x-small"></asp:Label>  
</div></ContentTemplate>
   </asp:UpdatePanel>
           
        </div>
        
    <div class="Right">
        
        <div  style="font-size: 22px; color: #007583;  font-weight: bold">Yvirlit/Sletta ásetingar evni</div>
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate><div>
                Vel sakarmáls nr: <asp:DropDownList ID="ddlDeleteLaw"  CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList>
                <asp:Button ID="Button5" runat="server" Width="100px" Text="Leita" OnClick="Button5_Click1" />
            </div>
             <asp:Label ID="lblLawSearch" runat="server" Text=""></asp:Label>
            
        <asp:Label ID="Label1" runat="server"></asp:Label>
            
        <div>
            <asp:GridView ID="GridView4" runat="server" CssClass="GridView" AutoGenerateColumns="False" DataKeyNames="DocId,LawId" DataSourceID="LinqDataSource2" BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="350px" AllowSorting="True">
                
                     <Columns>
                    <asp:BoundField DataField="tblDocument.DocNr" HeaderText="Sakarmáls nummar" ReadOnly="True" SortExpression="DocId" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="tblSubLaw.SubLawName" HeaderText="§" ReadOnly="True" SortExpression="LawId" >
                    <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tblSubLaw.tblLaw.LawName" HeaderText="Evni" ReadOnly="True" SortExpression="LawId" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" DeleteText="Sletta" />
               
                   
                </Columns>
            </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="MyModelContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="tblLawDocs" Where="tblDocument.DocNr == @DocNr">
                <WhereParameters>
                    <asp:ControlParameter ControlID="ddlDeleteLaw" Name="DocNr" PropertyName="SelectedItem.Text" Type="String" />
                </WhereParameters>
            </asp:LinqDataSource>
        </div></ContentTemplate>
        </asp:UpdatePanel>
        
        
        
        

    </div>
         <div class="Clear"></div>
    </div>
    <div class="AddOn">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <div class="Left">  <div  style="font-size: 22px; color: #007583;  font-weight: bold">
            
            Viðheft evni</div>
             <table>
            <tr>
                <td style="width: 100px;">Vel evnið: </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddlCat" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Width="100px"  Text="Viðheft" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Evnið sum skal viðheftast til eitt kærumál</h3>
                </td>
            </tr>
                 <tr>
                <td colspan="2" style="text-align: left">
                    <asp:Label ID="lblResult" runat="server" Text="" Style="font-size: x-small;"></asp:Label>
              
                   
                </td>
            </tr>





        </table>
            </ContentTemplate>
        </asp:UpdatePanel>
            

        </div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                    <div class="Right">
            <div style="font-size:22px; color: #007583;  font-weight: bold">Yvirlit/Sletta viðheft evni</div>
            <div>
                Vel sakarmáls nr: <asp:DropDownList ID="ddlSearchCase"  CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList>
                 <asp:Button ID="Button2" runat="server" Width="100px" Text="Leita" OnClick="Button2_Click" Height="26px" />
           </div>
           
            <asp:GridView ID="GridView3"  CssClass="GridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryId,DocId" DataSourceID="LinqDataSource1" BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="350px">
                <Columns>
                    <asp:BoundField DataField="tblDocument.DocNr" HeaderText="Sakarmáls nummar" ReadOnly="True" SortExpression="DocId" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="tblCategory.CategoryName" HeaderText="Evni" ReadOnly="True" SortExpression="CategoryId" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" DeleteText="Sletta" />
                </Columns>
            </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MyModelContext" EntityTypeName="" TableName="tblSubCategories" Where="tblDocument.DocNr == @DocNr" EnableDelete="True" EnableUpdate="True">
                <WhereParameters>
                    <asp:ControlParameter ControlID="ddlSearchCase" Name="DocNr" PropertyName="SelectedItem.Text" Type="String" />
                </WhereParameters>
            </asp:LinqDataSource>
           <asp:Label ID="lblSearch" runat="server"></asp:Label>
            <br/>

        </div>
            </ContentTemplate>
            
        </asp:UpdatePanel>
    

      <div class="Clear"></div>

    </div>
     
    
    
    

    
    
    

   <div class="AddOn">
        <div class="Left">  <div  style="font-size: 22px; color: #007583;  font-weight: bold">Viðheft leitiðorð</div>
            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                <ContentTemplate><table>  
            <tr>
                <td style="width: 100px;">Vel leitiorð: </td>
  <td class="auto-style1">
                    <asp:DropDownList ID="ddlWord" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList></td> <td>
                    <asp:Button ID="Button7" runat="server" Width="100px"  Text="Viðheft" OnClick="Button5_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Vel leitiorð til kærumál</h3>
                </td>
            </tr>
          
                 <tr>
                <td colspan="2" style="text-align: left">
                    <asp:Label ID="lblSearchWord" runat="server" Style="font-size: x-small;"></asp:Label>
              
                   
                </td>
            </tr>





        </table></ContentTemplate>
            </asp:UpdatePanel>
            
        

    </div>
       <div class="Right"><div  style="font-size: 22px; color: #007583;  font-weight: bold">Yvirlit/Sletta leitiorð</div>
           <asp:UpdatePanel ID="UpdatePanel7" runat="server">
               <ContentTemplate><div>
                Vel sakarmáls nr: <asp:DropDownList ID="ddlDeleteWord"  CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList>
                <asp:Button ID="Button8" runat="server" Width="100px" Text="Leita" OnClick="Button7_Click" />
            </div>

           <asp:GridView ID="GridView1" runat="server" CssClass="GridView" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DocId,SearchId" DataSourceID="LinqDataSource3" BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="350px">
               <Columns>
                   <asp:BoundField DataField="tblDocument.DocNr" HeaderText="DocId" ReadOnly="True" SortExpression="DocId" />
                   <asp:BoundField DataField="tblSearchWord.SearchName" HeaderText="SearchId" ReadOnly="True" SortExpression="SearchId" />
                   <asp:CommandField ShowDeleteButton="True" DeleteText="Sletta" />
               </Columns>
           </asp:GridView>
           
           
           

           <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="MyModelContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="tblDocSearches" Where="tblDocument.DocNr == @DocNr">
               <WhereParameters>
                   <asp:ControlParameter ControlID="ddlDeleteWord" Name="DocNr"  PropertyName="SelectedItem.Text" Type="String" />
               </WhereParameters>
           </asp:LinqDataSource>
           
           
           

       </div></ContentTemplate>
           </asp:UpdatePanel>  &nbsp;<div class="Clear"></div>
    </div>
        </div>
    
        

    
    <br/>
</asp:Content>

