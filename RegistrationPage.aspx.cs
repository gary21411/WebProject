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
    public partial class RegistrationPage : System.Web.UI.Page
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



                if (isZeeUsernameUnique(ZeeUsername) && isZeeMailUnique(ZeeMail))
                {
                    // Connection string taken from the server explorer
                    string SQLconnectionStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\rnnoa\source\repos\WebProj\App_Data\database.mdf;Integrated Security=True";
                    // Insert query to insert the corresponding data from the post to the database
                    string SQLQuery = string.Format("INSERT INTO TbUsers " +
                        "(UserName, Mail, FirstName, LastName, PassWord, Birthdate, age, MobileNumber, Gender, Address) " +
                        "VALUES (N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}', N'{6}', N'{7}', N'{8}', N'{9}')", ZeeUsername, ZeeMail, firstName, lastName, UserPass, Birthdate, age, MobileNumber, TheGender, TheAddress);
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
                else if (isZeeUsernameUnique(ZeeUsername) == false && isZeeMailUnique(ZeeMail) == false) { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "UnUniqueBoth()", true);}
                else if (isZeeMailUnique(ZeeMail) == false) { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "UnUniqueMail()", true); }
                else { ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "UnUniqueUserName()", true); }

            }
        }
        bool isZeeUsernameUnique(string user)
        {
            bool exists = false;
            //Sql databse connection string
            string sqlConnectionStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\rnnoa\source\repos\WebProj\App_Data\database.mdf;Integrated Security=True";
            SqlConnection SqlCon = new SqlConnection(sqlConnectionStr);
            string sqlCmdStr = string.Format("SELECT * FROM TbUsers WHERE (UserName = N'{0}')", user);
            SqlCommand SqlCmd = new SqlCommand(sqlCmdStr, SqlCon);
            SqlCon.Open();
            SqlDataReader reader = SqlCmd.ExecuteReader();
            if (reader.HasRows)
                exists = true;
            SqlCon.Close();
            return (!exists);
        }

        bool isZeeMailUnique(string mail)
        {
            bool exists = false;
            //Sql databse connection string
            string sqlConnectionStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\rnnoa\source\repos\WebProj\App_Data\database.mdf;Integrated Security=True";
            SqlConnection SqlCon = new SqlConnection(sqlConnectionStr);
            string sqlCmdStr = string.Format("SELECT * FROM TbUsers WHERE (Mail = N'{0}')", mail);
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