using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// middle 的摘要描述
/// </summary>
/// 
public partial class ASPdemo
{
    public class Middle
    {


        public static bool IsLoggin()
        {
            try
            {

                if (HttpContext.Current.Session["currentUser"].ToString() != "")
                {
                    return true;
                }

            }
            catch
            {

            }
            return false;

        }

        public static void SetUserInfo(string uid, string username)
        {
            HttpContext.Current.Session["currentUser"] = username;
            HttpContext.Current.Response.Cookies["userInfo"]["username"] = username;
        }

        public static void Reload(string where)
        {
            HttpContext.Current.Response.Redirect(where);
        }



    }
}
    