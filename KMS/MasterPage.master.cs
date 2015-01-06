using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Admin/Admin.aspx");
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
