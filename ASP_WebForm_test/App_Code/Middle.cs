using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Middle 的摘要描述
/// </summary>
public class Middle
{
    public static bool IsLoggin()
    {
        try
        {

            if (HttpContext.Current.Session["login"].ToString() == "ok")
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
        HttpContext.Current.Session["login"] = "ok";
        HttpContext.Current.Response.Cookies["userInfo"]["username"] = username;
    }

    public static void Reload(string where)
    {
        HttpContext.Current.Response.Redirect(where);
    }
}