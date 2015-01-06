using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Populate();

    }

    public void Populate()
    {
        if (!IsPostBack)
        {


            var data = new MyModelContext();

            var year = from y in data.tblYears
                       orderby y.YearName descending
                       select y;

            ddlYear.DataTextField = "YearName";
            ddlYear.DataValueField = "YearId";
            ddlYear.DataSource = year;
            ddlYear.DataBind();


            var person = from y in data.tblPersons
                         orderby y.PersonName ascending
                         select y;
            ddlPerson.DataTextField = "PersonName";
            ddlPerson.DataValueField = "PersonId";
            ddlPerson.DataSource = person;
            ddlPerson.DataBind();

            var laws = from l in data.tblLaws
                       orderby l.LawName ascending
                       select l;

            ddlLaws.DataTextField = "LawName";
            ddlLaws.DataValueField = "LawId";
            ddlLaws.DataSource = laws;
            ddlLaws.DataBind();

            var court = from c in data.tblCourts
                        orderby c.CourtName ascending
                        select c;

            ddlCourt.DataTextField = "CourtName";
            ddlCourt.DataValueField = "CourtId";
            ddlCourt.DataSource = court;
            ddlCourt.DataBind();

            var category = from ca in data.tblCategories
                           orderby ca.CategoryName ascending
                           select ca;

            ddlCat.DataTextField = "CategoryName";
            ddlCat.DataValueField = "CategoryId";
            ddlCat.DataSource = category;
            ddlCat.DataBind();


        }
    }






    public void CourtSort()
    {
        var courtId = ddlCourt.SelectedValue;

        var db = new MyModelContext();

        var court = from c in db.tblDocuments
                    join cc in db.tblCourts on c.DocCourt equals cc.CourtId

                    select c;
        if (!String.IsNullOrEmpty(courtId))
        {
            court = court.Where(c => c.DocCourt.Equals(courtId));
        }

        rptResult.DataSource = court.ToList();
        rptResult.DataBind();

    }

    public void CategorySort()
    {
        var categoryId = ddlCat.SelectedValue;

        var data = new MyModelContext();

        var cat = from c in data.tblDocuments
                  join sc in data.tblSubCategories on c.DocId equals sc.DocId
                  where sc.CategoryId.Equals(categoryId)
                  select c;



        rptResult.DataSource = cat.ToList();
        rptResult.DataBind();
    }
    public void SearchWord()
    {

        string word = txtWord.Text;
        var db = new MyModelContext();
        var q = (from z in db.tblDocuments
                 join x in db.tblDocSearches on z.DocId equals x.DocId
                 where
                     (x.tblSearchWord.SearchName.Contains(word) ||
                      (z.DocResult.Contains(word) || z.DocResume.Contains(word)))
                 select z).Distinct();
        rptResult.DataSource = q.ToList();
        rptResult.DataBind();
        if (rptResult.Items.Count == 0)
        {
            lblDisplay.Text = "Einkið var funnið";
        }
        else
        {
            lblDisplay.Text = "";
        }


    }
    public void SearchCaseNr()
    {
        var src = txtCasrNr.Text;
        var db = new MyModelContext();

        var data = from d in db.tblDocuments
                   where d.DocNr.Contains(src)
                   select d;



        rptResult.DataSource = data.ToList();
        rptResult.DataBind();
        if (rptResult.Items.Count < 1)
        {
            lblDisplay.Text = "Einkið var funnið";
        }
        ddlCat.SelectedValue = "";
        ddlCourt.SelectedValue = "";
        ddlLaws.SelectedValue = "";
        ddlPerson.SelectedValue = "";
        ddlYear.SelectedValue = "";


    }


    public void YearSort()
    {
        var yearId = ddlYear.SelectedValue;

        var db = new MyModelContext();
        var year = from y in db.tblDocuments
                   join yc in db.tblYears on y.Docyear equals yc.YearId

                   select y;
        if (!string.IsNullOrEmpty(yearId))
        {
            year = year.Where(c => c.Docyear.Equals(yearId));

        }



        rptResult.DataSource = year.ToList();
        rptResult.DataBind();
    }

    public void SortPerson()
    {

        var personId = ddlPerson.SelectedValue;
        var data = new MyModelContext();


        var documents = from d in data.tblDocuments
                        join sp in data.tblPersons on d.DocPerson equals sp.PersonId

                        select d;

        if (!String.IsNullOrEmpty(personId))
        {
            documents = documents.Where(c => c.DocPerson.Equals(personId));
        }

        rptResult.DataSource = documents.ToList();
        rptResult.DataBind();
    }

    public static string Text(string data)
    {
        if (data.Length > 300)
        {
            data = data.Substring(0, 300) + "...";
        }
        return data;

    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {


        lblDisplay.Text = "";
        SearchCriteria();

    }



    public void SearchCriteria()
    {
        string person = ddlPerson.SelectedValue;
        string category = ddlCat.SelectedValue;
        string year = ddlYear.SelectedValue;
        string law = ddlLaws.SelectedValue;
        string court = ddlCourt.SelectedValue;
        string casenr = txtCasrNr.Text;
        ;


        var data = new MyModelContext();

        if (!string.IsNullOrEmpty(casenr))
        {
            SearchCaseNr();
        }




        else
        {
            var documents = (from d in data.tblDocuments

                             join sc in data.tblSubCategories on d.DocId equals sc.DocId
                             join lw in data.tblLawDocs on d.DocId equals lw.DocId

                             orderby d.tblYear.YearName ascending

                             where
                                 (string.IsNullOrEmpty(person) || d.DocPerson.Equals(person)) &&
                                 (string.IsNullOrEmpty(year) || d.Docyear.Equals(year)) &&
                                 (string.IsNullOrEmpty(law) || lw.tblSubLaw.LawId.Equals(law)) &&
                                 (string.IsNullOrEmpty(court) || d.DocCourt.Equals(court)) &&
                                 (string.IsNullOrEmpty(category) || sc.CategoryId.Equals(category)) &&

                                 (string.IsNullOrEmpty(casenr) || d.DocNr.Equals(casenr))

                             select d).Distinct();


            rptResult.DataSource = documents.ToList();
            rptResult.DataBind();
            if (rptResult.Items.Count < 1)
            {
                lblDisplay.Text = "Einkið var funnið";
            }
            else
            {
                lblDisplay.Text = "";
            }
        }




        //else if (string.IsNullOrEmpty(category))
        //{
        //    var documents = from d in data.tblDocuments

        //                    //join sc in data.tblSubCategories on d.DocId equals sc.DocId


        //                    orderby d.Docyear descending

        //                    where
        //                        (string.IsNullOrEmpty(person) || d.DocPerson.Equals(person)) &&
        //                        (string.IsNullOrEmpty(year) || d.Docyear.Equals(year)) &&
        //                        //(string.IsNullOrEmpty(law) || d.DocLaw.Equals(law)) &&
        //                        (string.IsNullOrEmpty(court) || d.DocCourt.Equals(court)) &&
        //                        //(string.IsNullOrEmpty(category) || sc.CategoryId.Equals(category)) &&
        //                        (string.IsNullOrEmpty(casenr) || d.DocNr.Equals(casenr))

        //                    select d;




        //    rptResult.DataSource = documents.ToList();
        //    rptResult.DataBind();
        //    if (rptResult.Items.Count < 1)
        //    {
        //        lblDisplay.Text = "Einkið var funnið";
        //    }
        //    else
        //    {
        //        lblDisplay.Text = "";
        //    }
        //}

        //else
        //{



        //    var documents = (from d in data.tblDocuments

        //        join sc in data.tblSubCategories on d.DocId equals sc.DocId
        //        join lw in data.tblLawDocs on d.DocId equals lw.DocId
        //        join al in data.AlsDocs on d.DocId equals  al.DocId



        //        orderby d.Docyear descending 

        //        where
        //            (string.IsNullOrEmpty(person) || d.DocPerson.Equals(person)) &&
        //            (string.IsNullOrEmpty(year) || d.Docyear.Equals(year)) &&
        //            (string.IsNullOrEmpty(law) || lw.tblSubLaw.LawId.Equals(law)) &&
        //            (string.IsNullOrEmpty(court) || d.DocCourt.Equals(court)) &&
        //            (string.IsNullOrEmpty(category) || sc.CategoryId.Equals(category)) &&
        //            (string.IsNullOrEmpty(als) || al.SubId.Equals(als)) &&
        //            (string.IsNullOrEmpty(casenr) || d.DocNr.Equals(casenr))

        //        select d).Distinct();




        //    rptResult.DataSource = documents.ToList();
        //    rptResult.DataBind();
        //    if (rptResult.Items.Count < 1)
        //    {
        //        lblDisplay.Text = "Einkið var funnið";
        //    }
        //    else
        //    {
        //        lblDisplay.Text = "";
        //    }


    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        ddlCat.SelectedValue = "";
        ddlCourt.SelectedValue = "";
        ddlLaws.SelectedValue = "";
        ddlPerson.SelectedValue = "";
        ddlYear.SelectedValue = "";
        txtCasrNr.Text = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        lblDisplay.Text = "";
        SearchWord();
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCity(string prefixText)
    {

        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["AlsDbConnectionString"].ToString();
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblSearchWord where SearchName like @SearchName+'%'", con);
        cmd.Parameters.AddWithValue("@SearchName", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> CityNames = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CityNames.Add(dt.Rows[i][1].ToString());
        }
        return CityNames;
    }


}



