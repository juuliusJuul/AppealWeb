using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Data;
using System.Web;
using System.Data.SqlClient;

public class DataAccess
{
    public static string Connection = ConfigurationManager.ConnectionStrings["AlsDbConnectionString"].ConnectionString;

    public DataAccess()
    {
        // TODO: Add constructor logic here		
    }

    public static DataTable CallCommand_GetDataTable(string command)
    {
        DataSet dataset = new DataSet();
        DataTable dtRows = new DataTable();

        SqlConnection conn = new SqlConnection(Connection);
        SqlCommand comm = new SqlCommand(command, conn);
        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = comm;

        try
        {
            adapter.Fill(dataset);
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            throw ex;
        }
        finally
        {
            if (conn != null && conn.State == ConnectionState.Open)
                conn.Close();
        }

        if (dataset.Tables.Count > 0)
            dtRows = dataset.Tables[0];


        return dtRows;
    }
    public static DataTable CallCommand_GetDataTable(string command, SqlParameter[] args)
    {
        DataSet dataset = new DataSet();
        DataTable dtRows = new DataTable();
        SqlConnection conn = new SqlConnection(Connection);
        SqlCommand comm = new SqlCommand(command, conn);

        foreach (SqlParameter parm in args)
        {
            comm.Parameters.Add(parm);
        }

        SqlDataAdapter adapter = new SqlDataAdapter();
        adapter.SelectCommand = comm;

        try
        {
            adapter.Fill(dataset);
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            throw ex;
        }
        finally
        {
            if (conn != null && conn.State == ConnectionState.Open)
                conn.Close();
        }


        if (dataset.Tables.Count > 0)
            dtRows = dataset.Tables[0];

        return dtRows;
    }

    public static int CallCommand(string command)
    {
        SqlConnection conn = new SqlConnection(Connection);
        conn.Open();
        SqlCommand comm = new SqlCommand(command, conn);
        int retval;

        try
        {
            retval = comm.ExecuteNonQuery();
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            throw ex;
        }
        finally
        {
            if (conn != null)
                conn.Close();
        }
        return retval;
    }
    public static int CallCommand(string command, SqlParameter[] args)
    {
        DataSet dataset = new DataSet();
        SqlConnection conn = new SqlConnection(Connection);
        conn.Open();
        SqlCommand comm = new SqlCommand(command, conn);
        int retval;

        foreach (SqlParameter parm in args)
        {
            comm.Parameters.Add(parm);
        }

        try
        {
            retval = comm.ExecuteNonQuery();
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            throw ex;
        }
        finally
        {
            if (conn != null)
                conn.Close();
        }
        return retval;
    }

    public static string CallCommand_GetField(string command)
    {
        string ReturnVal = "";

        DataTable dtNew = new DataTable();
        dtNew = DataAccess.CallCommand_GetDataTable(command);

        if (dtNew != null && dtNew.Rows.Count > 0)
            ReturnVal = dtNew.Rows[0][0].ToString();

        return ReturnVal;
    }
}