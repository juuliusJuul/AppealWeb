using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Confirm : System.Web.UI.Page
{
    MyModelContext db = new MyModelContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        var qry = from m in db.tblDocuments
            where m.DocId == Convert.ToInt32(Request.QueryString["DocId"])
            select m;
        foreach (var q in qry)
        {
            q.DocNr = Session["DocNr"].ToString();
            q.DocCourt = Convert.ToInt32(Session["DocCourt"]);
            q.DocHeadText = Session["DocHeadText"].ToString();
            q.DocPerson = Convert.ToInt32(Session["DocPerson"]);
            q.Docyear = Convert.ToInt32(Session["DocYear"]);
            q.DocResume = Session["DocResume"].ToString();
            q.DocResult = Session["DocResult"].ToString();
           
        }
        db.SubmitChanges();
        Response.Redirect("Savn.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Savn.aspx");
    }
}