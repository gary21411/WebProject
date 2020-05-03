using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

using System.Data;
using System.Data.SqlClient;

namespace WebProj
{
    public partial class UpdateInfoPage : System.Web.UI.Page
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

                if (Session["IsAdmin"].ToString() == "Y")
                {
                    var xmlFile = XDocument.Load(MapPath("Admins.xml"));
                    var userNode = xmlFile.Descendants("CD").FirstOrDefault(CD => CD.Element("UserName").Value == Status);
                    userNode.SetElementValue("PassWord", UserPass);
                    userNode.SetElementValue("FirstName", firstName);
                    userNode.SetElementValue("LastName", lastName);
                    userNode.SetElementValue("Mail", ZeeMail);
                    userNode.SetElementValue("MobileNumber", MobileNumber);
                    userNode.SetElementValue("Address", TheAddress);
                    userNode.SetElementValue("Gender", TheGender);
                    userNode.SetElementValue("Birthdate", Birthdate);
                    userNode.SetElementValue("age", age);
                    xmlFile.Save(MapPath("Admins.xml"));
                    Response.Redirect("/Home.aspx");
                }
                else
                {

                    // Connection string taken from the server explorer
                    string SQLconnectionStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\database.mdf;Integrated Security=True";
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
                        Response.Redirect("./Home.aspx");
                    }
                }
            }
            
        }
    }
}