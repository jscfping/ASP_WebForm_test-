using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mycomment : System.Web.UI.Page
{
    string here = "/mycomment.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        ASPdemo.Middle.NeedLogin();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ASPdemo.DatabaseFunc.Comment.CreateNewComment(ASPdemo.Middle.GetCurrentUser().Uid, TextBox1.Text);
        Response.Redirect(here);
    }
}