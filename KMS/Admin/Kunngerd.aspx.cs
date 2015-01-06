using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Kunngerd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateDll();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Checker();
    }

    public void PopulateDll()
    {
        if (!IsPostBack)
        {
            var db = new MyModelContext();

            var q = from x in db.tblLaws
                orderby x.LawName ascending 
                select x;
            ddlWord.DataTextField = "LawName";
            ddlWord.DataValueField = "LawId";
            ddlWord.DataSource = q;
            ddlWord.DataBind();

        }
        
    }




    public void Checker()
    {
        string name = txtName.Text;
        var db = new MyModelContext();

        var data = from x in db.tblLaws
                   where x.LawName.Equals(name)
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
            tblLaw tp = new tblLaw();
            tp.LawName = txtName.Text;
            db.tblLaws.InsertOnSubmit(tp);
            db.SubmitChanges();
            Response.Redirect("Kunngerd.aspx");
        }

    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblResult.Text = "Kann ikki slettst grunda av kunngerðin er ásett til kærumál";
            e.ExceptionHandled = true;
        }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        var db = new MyModelContext();
        string cat = ddlWord.SelectedValue;
        string Val = txtP.Text;

        var q = from x in db.tblSubLaws
                where x.SubLawName.Equals(Val) && x.LawId.Equals(cat)
                select x;
        try
        {
            if (q.Any())
            {
                lblSearchWord.Text = "Er longu skrásett i skipannini";
            }
            else if (string.IsNullOrEmpty(cat))
            {
                ddlWord.BackColor = Color.Tomato;
                lblSearchWord.Text = "Bæði feltir skulla veljast";
                lblSearchWord.ForeColor = Color.Tomato;
            }
            else if (string.IsNullOrEmpty(Val))
            {
                txtName.BackColor = Color.Tomato;
                lblSearchWord.ForeColor = Color.Tomato;
                lblSearchWord.Text = "Bæði feltir skulla veljast";

            }
            else
            {
                mData.CreateSubLaw(Convert.ToInt32(cat), Val);
                 lblSearchWord.Text = "Orði " + txtP.Text + " er viðheft til ásetingarevni nr: " +
                                 ddlWord.SelectedItem.Text;
                ddlWord.SelectedValue = "";
                lblSearchWord.ForeColor = Color.Black;
                ddlWord.BackColor = ColorTranslator.FromHtml("#e4d100");
                txtP.BackColor = ColorTranslator.FromHtml("#e4d100");
                Response.Redirect("Kunngerd.aspx");

            }
        }
        catch (Exception)
        {

            lblSearchWord.Text = "Feilur, Hevur tú valt bæði feltini?";
            lblSearchWord.ForeColor = Color.Tomato;
            ddlWord.BackColor = Color.Tomato;
            txtP.BackColor = Color.Tomato;
        }


    }
}