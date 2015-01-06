using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddOn : System.Web.UI.Page
{
    MyModelContext db = new MyModelContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateDll();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

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
                lblResult.Text = ddlCat.SelectedItem.Text + " er longu ásett hjá kæruni";
                lblResult.ForeColor = Color.Tomato;
            }
            else if (string.IsNullOrEmpty(casenr))
            {
                lblResult.Text = "Bæði feltir skulla veljast";
                lblResult.ForeColor = Color.Tomato;
            }
            else if (string.IsNullOrEmpty(cat))
            {
                ddlCat.BackColor = Color.Tomato;
                lblResult.ForeColor = Color.Tomato;
            }
            else
            {
                tblSubCategory sc = new tblSubCategory();
                sc.CategoryId = Convert.ToInt32(ddlCat.SelectedValue);
                sc.DocId = Convert.ToInt32(ddlCase.SelectedValue);
                db.tblSubCategories.InsertOnSubmit(sc); lblResult.Text = "Evnið " + ddlCat.SelectedItem.Text + " er viðheft til sagarmáls nr: " +
                                 ddlCase.SelectedItem.Text;
                
                lblResult.ForeColor = Color.Black;
                ddlCase.BackColor = ColorTranslator.FromHtml("#e4d100");
                ddlCat.BackColor = ColorTranslator.FromHtml("#e4d100");
                db.SubmitChanges();
               


            }
        }
        catch (Exception e)
        {

            //lblResult.Text = e.ToString();
            lblResult.Text = "Feilur, Hevur tú valt bæði feltini?";
            lblResult.ForeColor = Color.Tomato;
        }

    }

    public void WordChecker()
    {
        string casenr = ddlCase.SelectedValue;
        string word = ddlWord.SelectedValue;
        var searchWord = from x in db.tblDocSearches
                         where x.SearchId.Equals(word) && x.DocId.Equals(casenr)
                         select x;
        try
        {
            if (searchWord.Any())
            {
                lblSearchWord.Text = "Leitiorð er longu ásett hjá kæruni";
                lblSearchWord.ForeColor = Color.Tomato;
            }
            else if (string.IsNullOrEmpty(casenr))
            {
                
                lblSearchWord.Text = "Bæði feltir skulla veljast";
                lblSearchWord.ForeColor = Color.Tomato;
            }
            else if (string.IsNullOrEmpty(word))
            {
                ddlWord.BackColor = Color.Tomato;
                lblSearchWord.ForeColor = Color.Tomato;
                lblSearchWord.Text = "Bæði feltir skulla veljast";
            }
            else
            {
                tblDocSearch sw = new tblDocSearch();
                sw.SearchId = Convert.ToInt32(ddlWord.SelectedValue);
                sw.DocId = Convert.ToInt32(ddlCase.SelectedValue);
                db.tblDocSearches.InsertOnSubmit(sw);
                db.SubmitChanges();
                lblSearchWord.Text = "Orði " + ddlWord.SelectedItem.Text + " er viðheft til sagarmáls nr: " +
                                 ddlCase.SelectedItem.Text;
                ddlWord.SelectedValue = "";
                lblSearchWord.ForeColor = Color.Black;
                ddlWord.BackColor = ColorTranslator.FromHtml("#e4d100");
                

            }
        }
        catch (Exception e)
        {

           
            lblSearchWord.Text = "Feilur, Hevur tú valt bæði feltini?";
            lblSearchWord.ForeColor = Color.Tomato;
            ddlWord.BackColor = Color.Tomato;
            
        }
    }

    public void PopulateDll()
    {
        if (!IsPostBack)
        {

            var word = from ww in db.tblSearchWords
                       orderby ww.SearchName ascending
                       select ww;
            ddlWord.DataTextField = "SearchName";
            ddlWord.DataValueField = "Id";
            ddlWord.DataSource = word;
            ddlWord.DataBind();



            var information = from ix in db.tblLaws
                              orderby ix.LawName ascending
                              select ix;
            ddlLawCat.DataTextField = "LawName";
            ddlLawCat.DataValueField = "LawId";
            ddlLawCat.DataSource = information;
            ddlLawCat.DataBind();


            var category = from ca in db.tblCategories
                           orderby ca.CategoryName ascending
                           select ca;

            ddlCat.DataTextField = "CategoryName";
            ddlCat.DataValueField = "CategoryId";
            ddlCat.DataSource = category;
            ddlCat.DataBind();

            var caseNr = from y in db.tblDocuments
                         orderby y.DocNr descending
                         select y;

            ddlCase.DataTextField = "DocNr";
            ddlCase.DataValueField = "DocId";
            ddlCase.DataSource = caseNr;
            ddlCase.DataBind();




            var q = (from y in db.tblDocuments
                     join v in db.tblSubCategories on y.DocId equals v.DocId
                     orderby y.DocNr ascending
                     select y).Distinct();

            ddlSearchCase.DataTextField = "DocNr";
            ddlSearchCase.DataValueField = "DocId";
            ddlSearchCase.DataSource = q;
            ddlSearchCase.DataBind();

            var q3 = (from y in db.tblDocuments
                      join v in db.tblLawDocs on y.DocId equals v.DocId
                      orderby y.DocNr descending
                      select y).Distinct();

            var q4 = (from y in db.tblDocuments
                      join v in db.tblDocSearches on y.DocId equals v.DocId
                      orderby y.DocNr descending
                      select y).Distinct();



            ddlDeleteLaw.DataTextField = "DocNr";
            ddlDeleteLaw.DataValueField = "DocId";
            ddlDeleteLaw.DataSource = q3;
            ddlDeleteLaw.DataBind();

         

            ddlDeleteWord.DataTextField = "DocNr";
            ddlDeleteWord.DataValueField = "DocId";
            ddlDeleteWord.DataSource = q4;
            ddlDeleteWord.DataBind();

            //DropDownList3.DataTextField = "DocNr";
            //DropDownList3.DataValueField = "DocId";
            //DropDownList3.DataSource = q;
            //DropDownList3.DataBind();


        }


    }

    public void AddSelected()
    {

        var db = new MyModelContext();
        string Val = ddlLawCat.SelectedValue;
        ddlHidden.Visible = true;
        if (string.IsNullOrEmpty(Val))
        {
            lblLaw.Text = "Vel eitt ásetingarevnið";
            ddlLawCat.BackColor = Color.Tomato;
        }
        else
        {

            var query = from x in db.tblSubLaws
                        where x.LawId.Equals(Val)
                        select x;
            ddlHidden.DataTextField = "SubLawName";
            ddlHidden.DataValueField = "SubLawId";
            ddlHidden.DataSource = query;
            ddlHidden.DataBind();

            var caseNr = from y in db.tblDocuments
                         orderby y.DocNr descending
                         select y;






            lblLaw.Text = "";
            ddlLawCat.BackColor = ColorTranslator.FromHtml("#e4d100");

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Checker();



    }





    protected void Button3_Click(object sender, EventArgs e)
    {

        AddSelected();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string Law = ddlHidden.SelectedValue;
        string Doc = ddlCase.SelectedValue;
        var data = from x in db.tblLawDocs
                   where x.DocId.Equals(Doc) && x.LawId.Equals(Law)
                   select x;

        if (data.Any())
        {
            lblLaw.ForeColor = Color.Tomato;
            lblLaw.Text = " er longu viðheft til kæruna" + ddlCase.SelectedItem.Text;
        }
        else
        {
            mData.CreateLawDoc(Convert.ToInt32(Law), Convert.ToInt32(Doc));
            lblLaw.Text = ddlHidden.SelectedItem.Text + " er viðheft til kæruna " + ddlCase.SelectedItem.Text;
        }


    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        WordChecker();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {

    }

    protected void Button5_Click1(object sender, EventArgs e)
    {

    }


}

