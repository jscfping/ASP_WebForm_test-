using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// usrInfo 的摘要描述
/// </summary>
/// 
public partial class ASPdemo
{
    public class UserInfo
    {
        public string uid;
        public string username;
        private int money;



        public UserInfo(string usr, string pw)
        {
            username = usr;
            DataTable dt = DatabaseFunc.User.GetInfo(username);

            if (dt == null)
            {
                DatabaseFunc.User.Add(username, pw);
                uid = (string)dt.Rows[0]["uid"];

                //foreach (DataRow row in data.Rows)
                //{
                //    foreach (DataColumn column in data.Columns)
                //    {
                //        Console.WriteLine(String.Format("{0} = {1}",
                //           column.ColumnName, row[column]));
                //    }
                //}
            }
            else
            {
                throw new System.ArgumentException("create fail, because username already exists", "UserInfo");
            }


        }

        public int Money
        {
            get
            {
                return money;
            }
            set
            {
                money = value;
            }
        }

        public int GetDoubleMoney()
        {
            return (money * 2);
        }


    }
}

public partial class ASPdemo
{
    public partial class DatabaseFunc
    {


        public class User : DatabaseFunc
        {

            public static void Add(string usr, string pw)
            {
                string queryString = "insert into users(username,password) values(@usr, @pw)";

                SqlCommand command = new SqlCommand(queryString);
                command.Parameters.Add("@usr", SqlDbType.NVarChar, 50).Value = usr;
                command.Parameters.Add("@pw", SqlDbType.NVarChar, 256).Value = pw;

                DBInsert(command);

            }

            public static DataTable GetInfo(string usr)
            {
                string queryString = "select * from @usr";
                SqlCommand command = new SqlCommand(queryString);
                command.Parameters.AddWithValue("@usr", usr);

                return DBQuery(command);
            }

        }
    }
}

