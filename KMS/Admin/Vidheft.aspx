<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Vidheft.aspx.cs" Inherits="Admin_VidheftFIlur" %>

<%@ Import Namespace="System.Drawing" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        var db = new MyModelContext();
        string casenr = ddlCase.SelectedValue;
        string cat = ddlCat.SelectedValue;
        var subcategory = from x in db.tblSubCategories
                          where x.CategoryId.Equals(cat) && x.DocId.Equals(casenr)
                          select x;


        if (string.IsNullOrEmpty(casenr) && string.IsNullOrEmpty(cat))
        {
            lblResult.Text = "Evni og kæra skal veljast";
        }
        else if (string.IsNullOrEmpty(cat))
        {
            lblResult.Text = "Eitt evni skal veljast";
        }
        else if (string.IsNullOrEmpty(casenr))
        {
            lblResult.Text = "Ein kæra skal veljast";
        }
        else if (subcategory.Any())
        {
            lblResult.Text = "Evnið er longu ásett hjá kæruni";
        }


        else
        {
            tblSubCategory sc = new tblSubCategory();
            sc.CategoryId = Convert.ToInt32(ddlCat.SelectedValue);
            sc.DocId = Convert.ToInt32(ddlCase.SelectedValue);
            lblResult.Text = "Evnið er viðheft til valda kærumálið";
            ddlCat.SelectedValue = "";
            db.tblSubCategories.InsertOnSubmit(sc);
            db.SubmitChanges();
        }






        //mData.AddCategory(Convert.ToInt32(ddlCat.SelectedValue), Convert.ToInt32(ddlCase.SelectedValue));
        //lblResult.Text = "Evnið er nú viðheft";
    }
</script>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="divAdmin">
          <div  style="font-size: 22px; color: #007583; padding-left: 6px; font-weight: bold">Áset evnir</div>
        <br/>
        <table>
            <tr>
                <td>Vel Kærumál: </td>
                <td>
                    <asp:DropDownList ID="ddlCase" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Vel kærumál sum skal hava eitt evnið</h3>
                </td>
            </tr>
            <tr>
                <td>Vel evnið: </td>
                <td>
                    <asp:DropDownList ID="ddlCat" CssClass="myList" runat="server"
                        AppendDataBoundItems="true">
                        <asp:ListItem Value="">-- vel her --</asp:ListItem>

                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Vel evnið sum skal viðheftast til eitt kærumál</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblResult" runat="server" Text="" Style="font-size: x-small; color: #FF0000"></asp:Label></td>
                <td style="text-align: right">
                    <asp:Button ID="Button1" runat="server" CssClass="myButton" OnClick="Button1_Click" Text="Viðheft" />
                </td>
            </tr>





        </table>
    </div>
 
    <div class ="divAdmin2">
          <div  style="font-size: 22px; color: #007583; padding-left: 6px; font-weight: bold">Sletta evnir</div>
        Vel kærumál: < <asp:DropDownList ID="ddlCases" CssClass="myList" runat="server"
                            
                            AppendDataBoundItems="true" AutoPostBack="True">
                            <asp:ListItem Value="">-- vel evnið --</asp:ListItem>
                        </asp:DropDownList>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" /><asp:Label ID="lblSearch" runat="server"></asp:Label>
        <br/>
        <%--<asp:Repeater ID="rptShowCat" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                <td><%#Eval("CategoryName") %></td>
                        <td>
                            <a href="Delete.aspx?id=<%# Eval("CategoryId") %>">Sletta</a></td>
                        
            </tr></table></ItemTemplate>
        </asp:Repeater>--%>
    </div>
    
    <div class="divAdmin2">
        <asp:GridView ID="GridView1"  CssClass="GridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryId,DocId" DataSourceID="LinqDataSource1" BorderColor="White" BorderWidth="0px" CellPadding="5" CellSpacing="10" Width="350px">
            <Columns>
                <asp:BoundField DataField="tblDocument.DocNr" HeaderText="SagarmálsNr:" ReadOnly="True" SortExpression="DocId" />
                <asp:BoundField DataField="tblCategory.CategoryName" HeaderText="Evni" SortExpression="CategoryId" ReadOnly="True" />
                <asp:CommandField DeleteText="Sletta" ShowDeleteButton="True" />
                <asp:HyperLinkField DataNavigateUrlFields="CategoryId" DataNavigateUrlFormatString="Delete.aspx?CategoryId={0}" Text="Vit Prøva" />
            </Columns>
        </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MyModelContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="tblDocument.DocNr desc" TableName="tblSubCategories">
        </asp:LinqDataSource>
    </div>

    <div class="divAdmin">
        
        

       
        

    </div>
</asp:Content>

