using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Set password field to password type
        pass.Attributes["type"] = "password";
        //Set cookie duration
        Response.Cookies["login"].Expires = DateTime.Now.AddDays(-1);
    }

    protected void send_Click(object sender, EventArgs e)
    {
        //Get hashed password from DB and hash user input to check if there is a match.
        string hashedPassword = "";
        string dbPassword = "";
        ce db = new ce();

        if (db.Users.Where(x => x.Email == user.Text).FirstOrDefault() != null)
        {
            dbPassword = db.Users.Where(x => x.Email == user.Text).FirstOrDefault().Password;
            hashedPassword = Encryptor.MD5Hash(pass.Text);
        }
        else
        {
            //Throw error if incorrect user input
            Response.Write("User Name not found, or Password is incorrect");
        }

        if (db.Users.Where(x => x.Email == user.Text && dbPassword == hashedPassword).FirstOrDefault() != null)
        {
            //Set Cookie data
            HttpCookie myCookie = new HttpCookie("login");
            Response.Cookies.Add(myCookie);
            myCookie.Values.Add("username", user.Text);
            Response.Cookies["login"].Expires = DateTime.Now.AddHours(1);
            Response.Redirect("Default.aspx?user=" + db.Users.Where(x => x.Email == user.Text).FirstOrDefault().ID);
            
        }
        else
        {
            Response.Write("User Name or Password Incorrect");           
        }
    }
}

public static class Encryptor
{
    public static string MD5Hash(string text)
    {
        MD5 md5 = new MD5CryptoServiceProvider();

        //Compute hash from the bytes of text
        md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

        //Get hash result after compute it
        byte[] result = md5.Hash;

        StringBuilder strBuilder = new StringBuilder();
        for (int i = 0; i < result.Length; i++)
        {
            //Change it into 2 hexadecimal digits for each byte
            strBuilder.Append(result[i].ToString("x2"));
        }

        return strBuilder.ToString();
    }
}




