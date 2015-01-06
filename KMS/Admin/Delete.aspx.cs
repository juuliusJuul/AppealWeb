using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MyModelContext db = new MyModelContext();


        var q2 = from z in db.tblSubCategories
                 where z.DocId == Convert.ToInt32(Request.QueryString["DocId"])
                 select z;

        db.tblSubCategories.DeleteAllOnSubmit(q2);

        var q3 = from c in db.tblLawDocs
                 where c.DocId == Convert.ToInt32(Request.QueryString["DocId"])
                 select c;

        db.tblLawDocs.DeleteAllOnSubmit(q3);

        var q4 = from v in db.tblDocSearches
                 where v.DocId == Convert.ToInt32(Request.QueryString["DocId"])
                 select v;

        db.tblDocSearches.DeleteAllOnSubmit(q4);

        var q5 = from  b in db.tblUploadDocuments
                 where b.DocId == Convert.ToInt32(Request.QueryString["DocId"])
        select b;

        db.tblUploadDocuments.DeleteAllOnSubmit(q5);


        var q = from x in db.tblDocuments
                //join xx in db.tblLawDocs on x.DocId equals xx.DocId
                //join ct in db.tblSubCategories on x.DocId equals ct.DocId
                where x.DocId == Convert.ToInt32(Request.QueryString["DocId"])
                select x;

        db.tblDocuments.DeleteAllOnSubmit(q);

        db.SubmitChanges();



        Response.Redirect("Savn.aspx");
        //var qry = from x in db.tblSubCategories
        //    where x.CategoryId == Convert.ToInt32(Request.QueryString["CategoryId"])
        //    select x;
        //foreach (var q in qry)
        //{
        //    db.tblSubCategories.DeleteOnSubmit(q);
        //}
        //db.SubmitChanges();
        //Response.Redirect("Vidheft.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}