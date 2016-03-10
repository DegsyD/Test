using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public static string userID = "";
    ce db = new ce();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check to see if user is logged in
        if (Request.QueryString["user"] != null)
        {
            userID = Request.QueryString["user"];
        }

        string usr = "";
        bool auth = false;
        //Check if cookie is present, if not, redirect to login screen.
        if (Request.Cookies["login"] != null)
        {
            HttpCookie cookie = Request.Cookies["login"];
            usr = cookie.Values["username"].ToString();
            if (db.Users.Where(x => x.Email == usr).FirstOrDefault() != null)
            {
                auth = true;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        } else
        {
            Response.Redirect("Login.aspx");
        }
    }
}