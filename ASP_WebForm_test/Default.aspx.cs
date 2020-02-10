using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private string here = "/Default.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "留言板";

        if (Middle.IsLoggin())
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView2.DataSourceID = "";
        GridView2.DataSourceID = "SqlDataSource2";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Middle.SetUserInfo("123uid", TextBox3.Text);
        Middle.Reload(here);
    }
}