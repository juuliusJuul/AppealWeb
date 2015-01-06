using System;
using System.Collections.Generic;
using System.Linq;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit.HTMLEditor;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //public void createUser()
        Populate();
    }

    public void populateCheck()
    {
        var data = new MyModelContext();
        var year = from y in data.tblYears
            orderby y.YearName descending
            select y;



    }

    public void Validator()
    {
        string casenr = txtCaseNr.Text;
        //string laws = ddlLaws.SelectedValue;
        string court = ddlCourt.SelectedValue;
        string year = ddlYear.SelectedValue;
        string ed1 = Editor1.Content;
        string ed2 = Editor2.Content;
        string head = txtHead.Text;
        string prs = ddlPerson.SelectedValue;
        //string file = FileUpload1.FileName;

        if (string.IsNullOrEmpty(head))
        {
            txtHead.BackColor = Color.Tomato;
        }
        if (string.IsNullOrEmpty(casenr))
        {
            txtCaseNr.BackColor = Color.Tomato;
        }
        if (string.IsNullOrEmpty(court))
        {
            ddlCourt.BackColor = Color.Tomato;
        }
        if (string.IsNullOrEmpty(year))
        {
            ddlYear.BackColor = Color.Tomato;
        }
        if (string.IsNullOrEmpty(ed1))
        {
            Editor1.BackColor = Color.Tomato;
        }
        if (string.IsNullOrEmpty(ed2))
        {
            Editor2.BackColor = Color.Tomato;
        }
        if (string.IsNullOrEmpty(prs))
        {
            ddlPerson.BackColor = Color.Tomato;
        }
        //if (string.IsNullOrEmpty(file))
        //{
        //    FileUpload1.BackColor = Color.Tomato;
        //}

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

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        string nr = txtCaseNr.Text;
        Validator();
        var db = new MyModelContext();

        var q = from x in db.tblDocuments
            where x.DocNr.Equals(nr)
            select x;
        if (q.Any())
        {
            lblResult.Text = nr + " er longu skrásett í skipannini";
        }
        else
        {




            mData.CreateDocument(txtCaseNr.Text, Convert.ToInt32(ddlYear.SelectedValue), Editor1.Content,
                Editor2.Content, Convert.ToInt32(ddlCourt.SelectedValue), txtHead.Text,
                Convert.ToInt32(ddlPerson.SelectedValue));

            txtHead.Text = "";
            //ddlLaws.SelectedValue = "";
            ddlCourt.SelectedValue = "";
            ddlYear.SelectedValue = "";
            ddlPerson.SelectedValue = "";
            Editor1.Content = "";
            Editor2.Content = "";
            UnValidate();
            lblResult.Text = txtCaseNr.Text + " er skrásett í skipannini";


            lblResult.Text = txtCaseNr.Text + " er skrásett í skipannini";
        }
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        txtCaseNr.Text = "";
        txtHead.Text = "";
        //ddlLaws.SelectedValue = "";
        ddlCourt.SelectedValue = "";
        ddlYear.SelectedValue = "";
        ddlPerson.SelectedValue = "";
        Editor1.Content = "";
        Editor2.Content = "";
        lblResult.Text = "";
        UnValidate();

    }

    public void UnValidate()
    {
        txtCaseNr.BackColor = ColorTranslator.FromHtml("#e4d100");
        //ddlLaws.BackColor = ColorTranslator.FromHtml("#e4d100");
        ddlCourt.BackColor = ColorTranslator.FromHtml("#e4d100");
        ddlYear.BackColor = ColorTranslator.FromHtml("#e4d100");
        ddlPerson.BackColor = ColorTranslator.FromHtml("#e4d100");
        //FileUpload1.BackColor = ColorTranslator.FromHtml("#e4d100");
        Editor1.BackColor = Color.White;
        Editor2.BackColor = Color.White;
        txtHead.BackColor = ColorTranslator.FromHtml("#e4d100");
    }
    private static Random random = new Random((int)DateTime.Now.Ticks);
    private string RandomString(int size)
    {
        StringBuilder builder = new StringBuilder();
        char ch;
        for (int i = 0; i < size; i++)
        {
            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
            builder.Append(ch);
        }

        return builder.ToString();
    }

}

//        string name = txtName.Text;
//        var db = new MyModelContext();
//        tblPerson tp = new tblPerson();
//        tp.PersonName = name;

//        if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(name))
//        {
//            txtName.BackColor = Color.Tomato;
//            lblMessage.Text = "Fejl";
//        }
//        else
//        {
//            txtName.BackColor = Color.White;
//            db.tblPersons.InsertOnSubmit(tp);
//            db.SubmitChanges();
//            lblMessage.Text = name + " Succes!!";
//        }
//    }

//    public void PopulatePerson()
//    {
//        var data = new MyModelContext();

//        var person = from y in data.tblPersons
//                     orderby y.PersonName ascending
//                     select y;
//        ddlDeletePerson.DataTextField = "PersonName";
//        ddlDeletePerson.DataValueField = "PersonId";
//        ddlDeletePerson.DataSource = person;
//        ddlDeletePerson.DataBind();
//    }



//    protected void Unnamed1_Click(object sender, EventArgs e)
//    {
//        createUser();
//        //if (FileUpload1.HasFile)
//        //{
//        //    string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);

//        //    if (fileExtension.ToLower() != ".pdf" && fileExtension.ToLower() != ".jpg")
//        //    {

//        //        lblText.Text = "1";
//        //    }


//        //    else
//        //    {
//        //        FileUpload1.SaveAs(Server.MapPath("~/File/" + FileUpload1.FileName));
//        //        lblText.Text = "2";
//        //    }
//        //}
//    }



//}
//    }
