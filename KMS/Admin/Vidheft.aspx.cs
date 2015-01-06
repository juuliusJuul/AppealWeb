using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_VidheftFIlur : System.Web.UI.Page
{
    MyModelContext db = new MyModelContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateDll();
    }

    public void PopulateDll()
    {
        var db = new MyModelContext();
        if (!IsPostBack)
        {
            var category = from ca in db.tblCategories
                           orderby ca.CategoryName ascending
                           select ca;

            ddlCat.DataTextField = "CategoryName";
            ddlCat.DataValueField = "CategoryId";
            ddlCat.DataSource = category;
            ddlCat.DataBind();

            var caseNr = from y in db.tblDocuments
                         orderby y.Docyear descending 
                         select y;

            ddlCase.DataTextField = "DocNr";
            ddlCase.DataValueField = "DocId";
            ddlCase.DataSource = caseNr;
            ddlCase.DataBind();


            ddlCases.DataTextField = "DocNr";
            ddlCases.DataValueField = "DocId";
            ddlCases.DataSource = caseNr;
            ddlCases.DataBind();









        }

    }

    public void Checker()
    {
        string casenr = ddlCase.SelectedValue;
        string cat = ddlCat.SelectedValue;
        var subcategory = from x in db.tblSubCategories
                          where x.CategoryId.Equals(cat) && x.DocId.Equals(casenr)
                          select x;
        try
        {
            if (subcategory.Any())
            {
                lblResult.Text = "Evnið er longu ásett hjá kæruni";
            }
            else if (string.IsNullOrEmpty(casenr))
            {
                lblResult.Text = "Bæði feltir skulla veljast";
                ddlCase.BackColor = Color.Tomato;
            }
            else if (string.IsNullOrEmpty(cat))
            {
                ddlCat.BackColor = Color.Tomato;
            }
            else
            {
                tblSubCategory sc = new tblSubCategory();
                sc.CategoryId = Convert.ToInt32(ddlCat.SelectedValue);
                sc.DocId = Convert.ToInt32(ddlCase.SelectedValue);
                db.tblSubCategories.InsertOnSubmit(sc);
                db.SubmitChanges();

            }
        }
        catch (Exception e)
        {

            lblResult.Text = e.ToString();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Checker();


        //mData.AddCategory(Convert.ToInt32(ddlCat.SelectedValue), Convert.ToInt32(ddlCase.SelectedValue));
        //ddlCat.SelectedValue = "";
        //lblResult.Text = "Er viðheft";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        var q = from x in db.tblCategories
                join z in db.tblSubCategories on x.CategoryId equals z.CategoryId
                where z.DocId.Equals(ddlCases.SelectedValue)
                select x;

        
      

    }
    
}