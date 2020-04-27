using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProj
{
    public partial class Pong1v1 : System.Web.UI.Page
    {
        public string Status;
        protected void Page_Load(object sender, EventArgs e)
        {
            Status = (string)Session["User"];
            if (Status == "guest")
            {
                Session["ErrorText"] = "You need to be LogedIn for this feture.אתה צריך להיות מחובר למשתמש בשביל זה";
                Response.Redirect("./ErrorPage.aspx");
            }
        }
    }
}