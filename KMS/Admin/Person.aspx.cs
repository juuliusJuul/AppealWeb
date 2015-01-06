using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Person : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        Checker();
        //CreatePerson();
        //Response.Redirect("Person.aspx");
    }

    public void Checker()
    {
        string name = txtName.Text;
        var db = new MyModelContext();

        var data = from x in db.tblPersons
            where x.PersonName.Equals(name)
            select x;
        if (data.Any())
        {
            lblResult.Text = txtName.Text + " er longu i skipannini";
            txtName.BackColor = Color.Tomato;
        }
        else if (string.IsNullOrEmpty(name) || string.IsNullOrWhiteSpace(name))
        {
            lblResult.Text =" Tekst-feltið skal innihalda text";
            txtName.BackColor = Color.Tomato;
        }
        else
        {
            tblPerson tp = new tblPerson();
            tp.PersonName = txtName.Text;
            db.tblPersons.InsertOnSubmit(tp);
            db.SubmitChanges();
            Response.Redirect("Person.aspx");
        }

    }

    //public void CreatePerson()
    //{

    //    var db = new MyModelContext();
    //    tblPerson tp = new tblPerson();
        
    //    tp.PersonName = txtName.Text;

    //    if (tp.PersonName.Equals())
    //    {
    //        lblResult.Text = "Er longu skrásett";
    //    }
    //    else
    //    {
    //        db.tblPersons.InsertOnSubmit(tp);
    //        db.SubmitChanges();
    //    }

        


    //    //try
    //    //{
    //    //    if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrWhiteSpace(txtName.Text))
    //    //    {
    //    //        lblResult.Text = "Hettar feltið skal innihalda tekst";
    //    //        txtName.BackColor = Color.Tomato;
    //    //    }
    //    //    else
    //    //    {
    //    //        mData.CreatePerson(txtName.Text);
    //    //        
    //    //        txtName.Text = "";
    //    //        Response.Redirect("Person.aspx");
    //    //    }

    //    //}
    //    //catch (Exception)
    //    //{

    //    //    lblResult.Text = "er IKKI skrásettur í skipannini";
    //    //    txtName.BackColor = Color.Tomato;
    //    //}
    //}





    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblResult.Text = "Kann ikke slettast grunda av, at viðkomandi er ásettur til kærumál";
            e.ExceptionHandled = true;
        }
    }
}