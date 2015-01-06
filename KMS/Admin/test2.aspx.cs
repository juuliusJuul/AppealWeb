using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = System.Reflection.Emit.Label;

public partial class Admin_test2 : System.Web.UI.Page
{
    MyModelContext db = new MyModelContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var q = from x in db.tblCategories
            select x;

        CheckBoxList1.DataSource = q;
        CheckBoxList1.DataTextField = "CategoryName";
        CheckBoxList1.DataValueField = "CategoryId";
        CheckBoxList1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                li.Text = Label1.Text;
            }
            
        }
        
    }
}