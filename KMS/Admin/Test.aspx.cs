using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Test : System.Web.UI.Page
{
    MyModelContext db = new MyModelContext();
    private string username;
    private string email;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            BindGridview();
        }




    }

    protected void BindGridview()
    {
        gvDetails.DataSource = Membership.GetAllUsers();
        gvDetails.DataBind();
    }

    protected void gvDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvDetails.EditIndex = -1;
        BindGridview();
    }
    // This event is used to make our girdivew editable
    protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvDetails.EditIndex = e.NewEditIndex;
        BindGridview();
    }
    // This event is used to delete our gridview records
    protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        username = gvDetails.Rows[e.RowIndex].Cells[1].Text;
        Membership.DeleteUser(username);
        lblResult.Text = string.Format("{0} Details deleted Successfully", username);
        lblResult.ForeColor = Color.Green;
        BindGridview();
    }
    // This event is used to update gridview data
    protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int index = gvDetails.EditIndex;
        GridViewRow gvrow = gvDetails.Rows[index];
        username = gvDetails.Rows[e.RowIndex].Cells[1].Text;
        email = ((TextBox)gvrow.Cells[2].Controls[0]).Text;
        MembershipUser user = Membership.GetUser(username);
        if (user != null)
        {
            user.Email = email;
            Membership.UpdateUser(user);
            lblResult.Text = string.Format("{0} Details updated Successfully", username);
            lblResult.ForeColor = Color.Green;
        }
        gvDetails.EditIndex = -1;
        BindGridview();
    }
}
   
