using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Columns[5].Visible = false;
        if (ASPdemo.Middle.IsLogin())
        {
            if(Request.Cookies["username"] != null)
            {
                Label4.Text = Request.Cookies["username"].Value + ", " + Label4.Text;
            }
            GridView1.Columns[5].Visible = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}