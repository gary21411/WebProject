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
    public partial class UpdateInfoPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["Send"] != null)
            {
                string firstName = Request.Form["FirstName"];
                string lastName = Request.Form["LastName"];
                string ZeeUsername = Request.Form["ZeeUserName"];
                string ZeeMail = Request.Form["ZeeUsersMail"];
                string UserPass = Request.Form["Password"];
                string Birthdate = Request.Form["BirthDate"];
                string age = Request.Form["Age"];
                string TheGender = Request.Form["Gender"];
                string MobileNumber = Request.Form["PhoneNum"];
                string TheAddress = Request.Form["Address"];
                string Status = (string)Session["User"];

                // Connection string taken from the server explorer
                string SQLconnectionStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\rnnoa\source\repos\WebProj\App_Data\database.mdf;Integrated Security=True";
                // Insert query to insert the corresponding data from the post to the database
                string SQLQuery = string.Format("UPDATE TbUsers Set" +
                    " UserName = N'{0}', Mail = N'{1}', FirstName = N'{2}', LastName = N'{3}', PassWord = N'{4}', Birthdate = N'{5}', age = N'{6}', MobileNumber = N'{7}', Gender = N'{8}', Address = N'{9}'", ZeeUsername, ZeeMail, firstName, lastName, UserPass, Birthdate, age, MobileNumber, TheGender, TheAddress +
                    "WHERE (UserName = " + Status + ")");
                // define the objects from the class SqlConnection and SqlCommand an pass as the parameter the variables previously defined
                SqlConnection connectionObj = new SqlConnection(SQLconnectionStr);
                SqlCommand queryObj = new SqlCommand(SQLQuery, connectionObj);
                connectionObj.Open();
                int rowsAffected = queryObj.ExecuteNonQuery();
                connectionObj.Close();
                if (rowsAffected == 1)
                {
                    Response.Redirect("./AfterRegistering.aspx");
                }
            }
            // else { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "UnUniqueUserName()", true); }
        }
    }
}