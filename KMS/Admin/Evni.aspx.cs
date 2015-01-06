using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Evni : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void Checker()
    {

        string name = txtName.Text;
        var db = new MyModelContext();

        var data = from x in db.tblCategories
                   where x.CategoryName.Equals(name)
                   select x;
        if (data.Any())
        {
            lblResult.Text = txtName.Text + " er longu i skipannini";
            txtName.BackColor = Color.Tomato;
        }
        else if (string.IsNullOrEmpty(name) || string.IsNullOrWhiteSpace(name))
        {
            lblResult.Text = " Tekst-feltið skal innihalda tekst";
            txtName.BackColor = Color.Tomato;
        }
        else
        {
            tblCategory tp = new tblCategory();
            tp.CategoryName = txtName.Text;
            db.tblCategories.InsertOnSubmit(tp);
            db.SubmitChanges();
            lblResult.Text = "Er stovna"; 
            Response.Redirect("Evni.aspx");
        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Checker();
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblResult.Text = "Evni kann ikki slettast grunda av at tað er ásett til eitt ella fleiri kærumál";
            e.ExceptionHandled = true;
        }
    }
}