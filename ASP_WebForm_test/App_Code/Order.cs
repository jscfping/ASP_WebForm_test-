using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Order 的摘要描述
/// </summary>
/// 
public partial class ASPdemo
{
    public class Order
    {
    }
}




public partial class ASPdemo
{
    public partial class DatabaseFunc
    {


        public class Order : DatabaseFunc
        {

            public static void CreateNewShopcart(string uid)
            {
                string queryString = "insert into shop_carts(customer_id) values(@uid)";
                SqlCommand command = new SqlCommand(queryString);
                command.Parameters.Add("@uid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(uid);
                DBInsert(command);
            }

        }
    }
}