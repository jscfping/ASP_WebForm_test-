using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shopcart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ASPdemo.Middle.NeedLogin();
        if(ASPdemo.Middle.GetCurrentUser().GetShopCartDataTable() == null)
        {
            Button1.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            ASPdemo.Middle.GetCurrentUser().Checkout();
            Response.Redirect("/user.aspx");
        }
        catch (Exception ex)
        {
            ASPdemo.Func.ShowError(ex, PanelFlash, LabelFlash);
        }
        
    }
}