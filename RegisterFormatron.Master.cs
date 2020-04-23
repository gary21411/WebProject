using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProj
{
    public partial class RegisterFormatron : System.Web.UI.MasterPage
    {
        public string Status;
        protected void Page_Load(object sender, EventArgs e)
        {
            Status = (string)Session["User"];
        }
    }
}