using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shop : System.Web.UI.Page
{
    string here = "/shop.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {

        Label4.Text = "歡迎光臨本賣場";
        GridView1.Columns[5].Visible = false;

        if (ASPdemo.Middle.IsLogin())
        {
            try
            {
                ASPdemo.UserInfo currentusr = ASPdemo.Middle.GetCurrentUser();

                Label4.Text = currentusr.Username + ", " + Label4.Text;
                GridView1.Columns[5].Visible = true;
            }
            catch (Exception ex)
            {
                ASPdemo.Func.ShowError(ex);
            }
        }
        else
        {
            Response.Redirect("/login.aspx");
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        try
        {
            ASPdemo.Middle.PutInShopcart(
                ASPdemo.Middle.GetCurrentUser().ShoppingCartId,
                ((Label)gvr.Cells[2].FindControl("lbl_itemid")).Text,
                ((Label)gvr.Cells[4].FindControl("Label3")).Text,
                ((TextBox)gvr.Cells[5].FindControl("TextBox5")).Text);
        }
        catch(Exception ex)
        {
            ASPdemo.Func.ShowError(ex);
        }


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ASPdemo.Middle.Logout(here);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        
    }
}