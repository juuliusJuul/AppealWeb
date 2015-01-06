using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Forms;

public partial class Admin_Year : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
  new ScriptResourceDefinition
  {
      Path = "~/scripts/jquery-1.7.2.min.js",
      DebugPath = "~/scripts/jquery-1.7.2.min.js",
      CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js",
      CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.js"
  });
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        //Validator();
        AddToDb();
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblResult.Text = "Kann ikke slettast grunda av, at Ár er ásett til kærumál";
            e.ExceptionHandled = true;
        }
    }

    public void Validator()
    {
        if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrWhiteSpace(txtName.Text))
        {
            lblResult.Text = "Tað skal innihalda 4 tekin.";
        }
        else if (txtName.Text.Length < 4 || txtName.Text.Length > 4)
        {
            lblResult.Text = "Tað skal innihalda 4 tekin.";
        }
    }

    public void AddToDb()
    {
        string input = txtName.Text;

        var db = new MyModelContext();
        var q = from x in db.tblYears
            where x.YearName.Equals(input)
            select x;
        if (q.Any())
        {
            txtName.BackColor = Color.Tomato;
            lblResult.Text = txtName.Text + " er longu i skipannini";
        }
        
        else if (string.IsNullOrWhiteSpace(input) || string.IsNullOrEmpty(input))
        {
            lblResult.Text = "Tað skal innihalda tøl";
            txtName.BackColor = Color.Tomato;
        }

        else
        {
            mData.CreateYear(txtName.Text);
            txtName.Text = "";
            Response.Redirect("Year.aspx");
            lblResult.Text = "Er stovna";
        }

    }

    
}