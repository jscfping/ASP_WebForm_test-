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

        private UserInfo(string uid, string usr)
        {
            this.uid = uid;
            this.username = usr;
        }


        public static UserInfo Login(string usr, string pw)
        {
            DataTable dt = DatabaseFunc.User.GetInfo(usr);

            if (dt != null)
            {
                string saltedpw = ASPdemo.Func.Encrypt(ASPdemo.Func.Salt + pw);

                if (saltedpw == (string)dt.Rows[0]["password"])
                {
                    ASPdemo.Middle.SetUserInfo(dt.Rows[0]["uid"].ToString(), usr);
                    return new UserInfo(dt.Rows[0]["uid"].ToString(), usr);
                }
                else
                {
                    throw new System.Exception("password is wrong");
                }
            }
            else
            {
                throw new System.Exception("this username doesn't exists");
            }
        }


        public static UserInfo AddNewUser(string usr, string pw)
        {
            string saltedpw = ASPdemo.Func.Encrypt(ASPdemo.Func.Salt + pw);
            DataTable dt = DatabaseFunc.User.GetInfo(usr);

            if (dt == null)
            {
                DatabaseFunc.User.Add(usr, saltedpw);
                dt = DatabaseFunc.User.GetInfo(usr);
                DatabaseFunc.Order.CreateNewShopcart(dt.Rows[0]["uid"].ToString());
                return Login(usr, pw);
            }
            else
            {
                throw new System.Exception("create fail, because username already exists");
            }
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
                string qy = "select * from users where username = @usr";
                SqlCommand command = new SqlCommand(qy);
                command.Parameters.AddWithValue("@usr", usr);

                return DBQuery(command);
            }

        }
    }
}

