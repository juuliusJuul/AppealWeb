using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Edit : System.Web.UI.Page
{
    MyModelContext db = new MyModelContext();
    public string CaseNr;
    public string Head;
    public string Court;
    public string Years;
    public string Person;
    public string Ed1;
    public string Ed2;
    public string DateNow;
    public string File;
    protected void Page_Load(object sender, EventArgs e)
    {
        Populate();
        CaseNr = txtCase.Text;
        Head = txtHead.Text;
        Years = ddlYear.SelectedValue;
        Person = ddlPerson.SelectedValue;
        Court = ddlCourt.SelectedValue;
        Ed1 = Editor1.Content;
        Ed2 = Editor2.Content;
        //File = FileUpload1.FileName;





        if (Request.QueryString["DocId"] != null)
        {
            var qry = from m in db.tblDocuments
                      where m.DocId == Convert.ToInt32(Request.QueryString["DocId"].ToString())
                      select m;
            foreach (var q in qry)
            {
                txtCase.Text = q.DocNr;
                ddlPerson.SelectedValue = q.DocPerson.ToString();
                ddlCourt.SelectedValue = q.DocCourt.ToString();
                ddlYear.SelectedValue = q.Docyear.ToString();
                txtHead.Text = q.DocHeadText;
                Editor1.Content = q.DocResume;
                Editor2.Content = q.DocResult;
               
                //lblPdf.Text = q.DocAttach;


            }

        }
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

            //ddlLaws.DataTextField = "LawName";
            //ddlLaws.DataValueField = "LawId";
            //ddlLaws.DataSource = laws;
            //ddlLaws.DataBind();

            var court = from c in data.tblCourts
                        orderby c.CourtName ascending
                        select c;

            ddlCourt.DataTextField = "CourtName";
            ddlCourt.DataValueField = "CourtId";
            ddlCourt.DataSource = court;
            ddlCourt.DataBind();


        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Savn.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
                //string temp = RandomString(5) + FileUpload1.FileName;
                //FileUpload1.SaveAs(Server.MapPath("~/File/" + temp));
                Session["DocNr"] = CaseNr; 
                Session["DocHeadText"] = Head;
                Session["Docyear"] = Years;
                Session["DocPerson"] = Person;
               
                Session["DocCourt"] = Court;
                Session["DocResume"] = Ed1;
                Session["DocResult"] = Ed2;
                //Session["DocAttach"] = temp;
                Response.Redirect("Confirm.aspx?DocId=" + Request.QueryString["DocId"].ToString());
                lblResult.Text = "SUCCES!!";
            
        }
    }



    //private static Random random = new Random((int)DateTime.Now.Ticks);//thanks to McAden
    //private string RandomString(int size)
    //{
    //    StringBuilder builder = new StringBuilder();
    //    char ch;
    //    for (int i = 0; i < size; i++)
    //    {
    //        ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
    //        builder.Append(ch);
    //    }

    //    return builder.ToString();
    //}

