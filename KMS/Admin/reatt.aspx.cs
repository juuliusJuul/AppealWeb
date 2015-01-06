using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_reatt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        string input = txtName.Text;

        var db = new MyModelContext();
        var q = from x in db.tblCourts
            where x.CourtName.Equals(input)
            select x;

        if (q.Any())
        {
            lblResult.Text = "Rættur er longu skrásettur í skipannini";
            txtName.BackColor = Color.Tomato;
        }
        

        else if (string.IsNullOrEmpty(input) || string.IsNullOrWhiteSpace(input))
        {
            lblResult.Text = "Tað skal innihalda tekstur";
            txtName.BackColor = Color.Tomato;
        }
        else
        {
            mData.CreateCourt(input);
            input = "";
            Response.Redirect("reatt.aspx");
        }


    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblResult.Text = "Kann ikke slettast grunda av, at rættur er ásettur til kærumál";
            e.ExceptionHandled = true;
        }
    }
}