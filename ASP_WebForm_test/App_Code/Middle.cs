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


        public static bool IsLogin()
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

        public static void LoginedToGo()
        {
            if (IsLogin())
            {
                HttpContext.Current.Response.Redirect("/");
            }
        }
        public static void LoginedToGo(string where)
        {
            if (IsLogin())
            {
                HttpContext.Current.Response.Redirect(where);
            }
        }

        public static void NeedLogin()
        {
            if (!IsLogin())
            {
                HttpContext.Current.Response.Redirect("/login.aspx");
            }
        }

        public static void SetUserInfo(string uid, string username)
        {
            HttpContext.Current.Session["currentUser"] = uid;
            HttpContext.Current.Response.Cookies["username"].Value = username;
        }





}
}
    