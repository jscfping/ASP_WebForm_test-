using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ASPdemo.Middle.LoginedToGo();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            ASPdemo.Middle.Login(TextBox1.Text, TextBox2.Text);
            Response.Redirect("/");
        }
        catch (Exception ex)
        {
            ASPdemo.Func.ShowError(ex);
        }
    }
}