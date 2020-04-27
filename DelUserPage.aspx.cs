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
    public partial class DelUserPage : System.Web.UI.Page
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

            if (Request.Form["Send"] != null)
            {
                string ZeeUserName = Request.Form["UserNameDel"];
                string ZeePass = Request.Form["ZeePasswordDel"];

                if (!AreInDB(ZeeUserName, ZeePass))
                {
                    DeleteFromDB(ZeeUserName);
                    Response.Redirect("./Home.aspx");
                }
                else
                {
                    Session["ErrorText"] = "שגיאה - הסיסמא והשם משתמש לא מתאימים על פי בסיס הנתונים, המשתמש לא נמחק";
                    Response.Redirect("./ErrorPage.aspx");
                }
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

        bool DeleteFromDB(string user)
        {
            bool exists = false;
            //Sql databse connection string
            string sqlConnectionStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\rnnoa\source\repos\WebProj\App_Data\database.mdf;Integrated Security=True";
            SqlConnection SqlCon = new SqlConnection(sqlConnectionStr);
            string sqlCmdStr = string.Format("DELETE FROM TbUsers WHERE (UserName = N'{0}')", user);
            SqlCommand SqlCmd = new SqlCommand(sqlCmdStr, SqlCon);
            SqlCon.Open();
            SqlDataReader reader = SqlCmd.ExecuteReader();
            if (reader.HasRows)
                exists = true;
            SqlCon.Close();
            return (!exists);
        }
    }
}