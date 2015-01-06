using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddOn.aspx");
    }


    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Person.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Evni.aspx");
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Kunngerd.aspx");
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Savn.aspx");
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Year.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("reatt.aspx");
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        Response.Redirect("PDF.aspx");
    }
    protected void Button6_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Word.aspx");
    }
}