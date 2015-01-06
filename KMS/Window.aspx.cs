using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Window : System.Web.UI.Page
{
     MyModelContext db = new MyModelContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            var qry = from m in db.tblDocuments
                      //join sc in db.tblSubCategories on m.DocId equals sc.DocId
                      where m.DocId == Convert.ToInt32(Request.QueryString["id"].ToString())

                      select m;


            rptDisplay.DataSource = qry.ToList();
            rptDisplay.DataBind();

            rptHead.DataSource = qry.ToList();
            rptHead.DataBind();



            var qry2 = from x in db.tblCategories
                       join z in db.tblSubCategories on x.CategoryId equals z.CategoryId
                       where z.DocId == Convert.ToInt32(Request.QueryString["id"].ToString())
                       select x;


            rptCategory.DataSource = qry2.ToList();
            rptCategory.DataBind();
            if (rptCategory.Items.Count < 1)
            {
                lblCat.Text = "Einkið evni er hjálagt";
            }
            else
            {
                lblCat.Text = "";
            }

            var qry3 = from x in db.tblSubLaws
                       join z in db.tblLawDocs on x.SubLawId equals z.LawId
                       where z.DocId == Convert.ToInt32(Request.QueryString["id"].ToString())
                       select x;

            rptLaw.DataSource = qry3.ToList();
            rptLaw.DataBind();
            if (rptLaw.Items.Count < 1)
            {
                lblLaew.Text = "Eingin áseting er hjáløgd";
            }
            else
            {
                lblLaew.Text = "";
            }


            var qry4 = from x in db.tblUploads
                       join z in db.tblUploadDocuments on x.Id equals z.FileId
                       where z.DocId == Convert.ToInt32(Request.QueryString["id"].ToString())
                       select x;


            rptPdf.DataSource = qry4.ToList();
            rptPdf.DataBind();
            if (rptPdf.Items.Count < 1)
            {
                lblPdf.Text = "Eingin PDF er viðheft";
            }
            else
            {
                lblPdf.Text = "";
            }

           

           
        }
    }
}