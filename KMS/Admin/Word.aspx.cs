using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Word : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        Checker();
    }

    public void Checker()
    {
        string name = txtName.Text;
        var db = new MyModelContext();

        var data = from x in db.tblSearchWords
                   where x.SearchName.Equals(name)
                   select x;
        if (data.Any())
        {
            lblResult.Text = txtName.Text + " er longu i skipannini";
            txtName.BackColor = Color.Tomato;
        }
        else if (string.IsNullOrEmpty(name) || string.IsNullOrWhiteSpace(name))
        {
            lblResult.Text = " Tekst-feltið skal innihalda text";
            txtName.BackColor = Color.Tomato;
        }
        else
        {
            tblSearchWord tp = new tblSearchWord();
            tp.SearchName = txtName.Text;
            db.tblSearchWords.InsertOnSubmit(tp);
            db.SubmitChanges();
            Response.Redirect("Word.aspx");
        }

    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblResult.Text = "Kann ikke slettast grunda av, at leitiorð er ásett til kærumál";
            e.ExceptionHandled = true;
        }
    }
}