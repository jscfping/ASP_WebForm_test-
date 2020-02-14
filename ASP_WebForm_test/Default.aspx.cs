using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "首頁";
        if (ASPdemo.Middle.IsLogin())
        {
            try
            {
                ASPdemo.UserInfo currentusr = ASPdemo.Middle.GetCurrentUser();

                Label1.Text = Label1.Text + "<br>歡迎光臨, " + currentusr.Username;
            }
            catch (Exception ex)
            {
                ASPdemo.Func.ShowError(ex);
            }
        }
    }
}