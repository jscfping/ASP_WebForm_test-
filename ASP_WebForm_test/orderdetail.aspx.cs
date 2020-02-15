using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orderdetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ASPdemo.Middle.NeedLogin();
        Literal1.Text = Request.QueryString["oid"];
    }
}