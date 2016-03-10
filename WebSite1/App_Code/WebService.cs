using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{
    
    public WebService()
    {
    }

//Get data from DB as Json
    [WebMethod]
    public string HelloWorld(string test)
    {
        ce db = new ce();
        List<News> newsArticles = db.News.ToList();
        JavaScriptSerializer serial = new JavaScriptSerializer();
        return serial.Serialize(newsArticles);
    }
//Get search results if search term is in page Title
    [WebMethod]
    public string SearchEntry (string query)
    {
        ce db = new ce();
        List<News> newsArticles = db.News.Where(x => x.Title.Contains(query)).ToList();
        JavaScriptSerializer serial = new JavaScriptSerializer();
        return serial.Serialize(newsArticles);
    }
}
