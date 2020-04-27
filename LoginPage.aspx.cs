using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace WebProj
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["Send"] != null)
            {
                string ZeeUserName = Request.Form["UserNameLog"];
                string ZeePass = Request.Form["ZeePasswordLog"];

                if (!AreInDB(ZeeUserName, ZeePass))
                {
                    Session["User"] = ZeeUserName;
                    Session["IsAdmin"] = "N";
                    Response.Redirect("./Home.aspx");
                }
                else if (ExistsAsAdmin(ZeeUserName, ZeePass)) 
                {
                    Session["User"] = ZeeUserName;
                    Session["IsAdmin"] = "Y";
                    Response.Redirect("./Home.aspx");
                }
                else {
                    Session["ErrorText"] = "שגיאה - הסיסמא והשם משתמש לא מתאימים על פי בסיס הנתונים";
                    Response.Redirect("./ErrorPage.aspx"); }
            }
        }

        bool AreInDB(string user, string pass)
        {
            bool exists = false;
            //Sql databse connection string
            string sqlConnectionStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\database.mdf;Integrated Security=True";
            SqlConnection SqlCon = new SqlConnection(sqlConnectionStr);
            string sqlCmdStr = string.Format("SELECT * FROM TbUsers WHERE (UserName = N'{0}' and PassWord = N'{1}')", user, pass);
            SqlCommand SqlCmd = new SqlCommand(sqlCmdStr, SqlCon);
            SqlCon.Open();
            SqlDataReader reader = SqlCmd.ExecuteReader();
            if (reader.HasRows)
                exists = true;
            SqlCon.Close();
            return (!exists);
        }

        public static bool ExistsAsAdmin(string username, string password)
        {
            bool TheReturner = false;
            DataSet ds = new DataSet();
            ds.ReadXml(System.Web.HttpContext.Current.Server.MapPath("Admins.xml"));
            foreach (DataRow group in ds.Tables[0].Rows)
            {
                if (username.Equals(group[0]) && password.Equals(group[4]))
                {
                    TheReturner = true;
                }
            }

            return TheReturner;
        }
    }
}