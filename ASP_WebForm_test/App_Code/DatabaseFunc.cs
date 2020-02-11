using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// DatabaseFunc 的摘要描述
/// </summary>
/// 
public partial class ASPdemo
{
    public partial class DatabaseFunc
    {

        public static void DBInsert(SqlCommand command)
        {
            SqlConnection Conn = new SqlConnection();
            string connectionString = WebConfigurationManager.ConnectionStrings["asp_demoConnectionString"].ConnectionString;

            using (SqlConnection connection =
                new SqlConnection(connectionString))
            {
                command.Connection = connection;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    command.Cancel();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    HttpContext.Current.Response.Write(ex.Message);
                }
            }
        }


        public static DataTable DBQuery(SqlCommand command)
        {
            DataTable result = null;
            SqlConnection Conn = new SqlConnection();
            string connectionString = WebConfigurationManager.ConnectionStrings["asp_demoConnectionString"].ConnectionString;

            using (SqlConnection connection =
                new SqlConnection(connectionString))
            {
                command.Connection = connection;
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    result = reader.GetSchemaTable();

                    command.Cancel();    //cancel first to break continuing
                    reader.Close();
                    connection.Close();
                    return reader.GetSchemaTable();

                }
                catch (Exception ex)
                {
                    HttpContext.Current.Response.Write(ex.Message);
                }
            }
            return result;
        }

    }




    public class Item : DatabaseFunc
    {

    }


    public class Order : DatabaseFunc
    {

    }
}
