using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Populate();
    }

    public void CreateFile()
    {

        var context = new MyModelContext();
        tblUpload f = new tblUpload();

        f.FileName = txtHead.Text;
        f.FileUrl = FileUpload1.FileName;
        context.tblUploads.InsertOnSubmit(f);
        context.SubmitChanges();


        var fd = new tblUploadDocument();
        fd.DocId = Convert.ToInt32(ddlCaseNr.SelectedValue);
        fd.FileId = f.Id;
        context.tblUploadDocuments.InsertOnSubmit(fd);
        context.SubmitChanges();




    }

    public void Populate()
    {
        if (!IsPostBack)
        {

            var db = new MyModelContext();
            var q = from x in db.tblDocuments
                orderby x.DocNr descending
                select x;

            ddlCaseNr.DataTextField = "DocNr";
            ddlCaseNr.DataValueField = "DocId";
            ddlCaseNr.DataSource = q;
            ddlCaseNr.DataBind();




            var q2 = (from z in db.tblDocuments orderby z.DocNr descending
                join sb in db.tblUploadDocuments on z.DocId equals sb.DocId
                      
                select z).Distinct();

            ddlSearchCase.DataTextField = "DocNr";
            ddlSearchCase.DataValueField = "DocId";
            ddlSearchCase.DataSource = q2;
            ddlSearchCase.DataBind();
        }
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


    protected void Button1_Click1(object sender, EventArgs e)
    {
        Validator();
        try
        {
            if (FileUpload1.HasFile)
            {
                string fileExt = System.IO.Path.GetExtension(FileUpload1.FileName);

                if (fileExt.ToLower() != ".pdf")
                {
                    lblMessage.Text = "Kann bert viðhefta PDF fílu";
                }
                else
                {
                    string temp = RandomString(5) + FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath("~/File/" + temp));


                    var context = new MyModelContext();



                    tblUpload f = new tblUpload();

                    f.FileName = txtHead.Text;
                    f.FileUrl = temp;
                    context.tblUploads.InsertOnSubmit(f);
                    context.SubmitChanges();


                    var fd = new tblUploadDocument();
                    fd.DocId = Convert.ToInt32(ddlCaseNr.SelectedValue);
                    fd.FileId = f.Id;
                    context.tblUploadDocuments.InsertOnSubmit(fd);
                    context.SubmitChanges();
                    lblMessage.Text = txtHead.Text + " er viðheft til " + ddlCaseNr.SelectedItem.Text;
                    txtHead.Text = "";
                    ddlCaseNr.SelectedValue = "";
                    ddlCaseNr.BackColor = ColorTranslator.FromHtml("#e4d100");
                    txtHead.BackColor = ColorTranslator.FromHtml("#e4d100");



                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Okkurt gekk galið";




        }



    }

    public void Validator()
    {
        string head = txtHead.Text;
        string url = FileUpload1.FileName;
        string ddl = ddlCaseNr.SelectedValue;

        if (string.IsNullOrEmpty(head) && string.IsNullOrEmpty(url) && string.IsNullOrEmpty(ddl))
        {
            lblMessage.Text = "Okkurt gekk galið, hevur tú útfylt øll feltini?";
            txtHead.BackColor = Color.Tomato;
            ddlCaseNr.BackColor = Color.Tomato;

        }
        else if (string.IsNullOrEmpty(head))
        {

            lblMessage.Text = "Skal innihalda ein yvirskrift";
            txtHead.BackColor = Color.Tomato;
            ddlCaseNr.BackColor = ColorTranslator.FromHtml("#e4d100");

        }
        else if (string.IsNullOrEmpty(ddl))
        {
            ddlCaseNr.BackColor = Color.Tomato;
            lblMessage.Text = "Skal veljast kærumál";
            txtHead.BackColor = ColorTranslator.FromHtml("#e4d100");
        }

        else if (string.IsNullOrEmpty(url))
        {
            lblMessage.Text = "Skal veljast ein fíla";
            txtHead.BackColor = ColorTranslator.FromHtml("#e4d100");
            ddlCaseNr.BackColor = ColorTranslator.FromHtml("#e4d100");
        }
        else if (string.IsNullOrEmpty(head) && string.IsNullOrEmpty(ddl))
        {
            lblMessage.Text = "Okkurt gekk galið, hevur tú útfylt øll feltini?";
            txtHead.BackColor = Color.Tomato;
            ddlCaseNr.BackColor = Color.Tomato;
        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}