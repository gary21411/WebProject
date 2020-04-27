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
    public partial class UserInfoPage : System.Web.UI.Page
    {
        public string table = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string Status = (string)Session["User"];
            string IsAdmin = (string)Session["IsAdmin"];

            // FDB stands for From Data-Base.
            string usernameFDB = "";
            string passwordFDB = "";
            string firstNameFDB = "";
            string lastNameFDB = "";
            string emailFDB = "";
            string phoneFDB = "";
            string addressFDB = "";
            string GenderFDB = "";
            string BirthDateFDB = "";
            string ageFDB = "";


            if (IsAdmin == "Y")
            {
                DataSet ds = new DataSet();
                ds.ReadXml(MapPath("Admins.xml"));
                foreach (DataRow rw in ds.Tables[0].Rows)
                {
                    if (rw["UserName"].ToString() == Status) 
                    {
                        usernameFDB = rw["UserName"].ToString();
                        passwordFDB = rw["PassWord"].ToString();
                        firstNameFDB = (string)rw["FirstName"];
                        lastNameFDB = (string)rw["LastName"];
                        emailFDB = (string)rw["Mail"];
                        phoneFDB = (string)rw["MobileNumber"];
                        addressFDB = (string)rw["Address"];
                        GenderFDB = (string)rw["Gender"];
                        BirthDateFDB = (string)rw["Birthdate"];
                        ageFDB = (string)rw["age"];
                    }

                }
                table = string.Format("<table cellpadding = \"5\" id = \"userInfoTable\"><tr><th class=\"cell\">שם משתמש</th><td class=\"cell\">{0}</td></tr><tr><th class=\"cell\">סיסמה</th><td class=\"cell\">{1}</td></tr><tr><th class=\"cell\">שם פרטי</th><td class=\"cell\">{2}</td></tr><tr><th class=\"cell\">שם משפחה</th><td class=\"cell\">{3}</td></tr><tr><th class=\"cell\">כתובת אימייל</th><td class=\"cell\">{4}</td></tr><tr><th class=\"cell\">מספר טלפון</th><td class=\"cell\">{5}</td></tr><tr><th class=\"cell\">כתובת</th><td class=\"cell\">{6}</td></tr><tr><th class=\"cell\">מין</th><td class=\"cell\">{7}</td></tr><tr><th class=\"cell\">תאריך לידה</th><td class=\"cell\">{8}</td></tr></table>", usernameFDB, passwordFDB, firstNameFDB, lastNameFDB, emailFDB, phoneFDB, addressFDB, GenderFDB, BirthDateFDB, ageFDB);
            }
            else 
            {
                if (Status == "guest")
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "guestUser()", true);
                }
                else
                {

                    string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\database.mdf;Integrated Security=True";
                    SqlConnection SqlConn = new SqlConnection(connStr);
                    string cmdStr = string.Format("SELECT * FROM TbUsers WHERE (UserName = N'{0}')", Status);
                    SqlCommand SqlCmd = new SqlCommand(cmdStr, SqlConn);
                    SqlConn.Open();
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(cmdStr, connStr);
                    DataSet Data = new DataSet();
                    dataAdapter.Fill(Data);

                    // FDB stands for From Data-Base.

                    usernameFDB = (string)Data.Tables[0].Rows[0]["UserName"];
                    passwordFDB = (string)Data.Tables[0].Rows[0]["PassWord"];
                    firstNameFDB = (string)Data.Tables[0].Rows[0]["FirstName"];
                    lastNameFDB = (string)Data.Tables[0].Rows[0]["LastName"];
                    emailFDB = (string)Data.Tables[0].Rows[0]["Mail"];
                    phoneFDB = Data.Tables[0].Rows[0]["MobileNumber"].ToString();
                    addressFDB = (string)Data.Tables[0].Rows[0]["Address"];
                    GenderFDB = (string)Data.Tables[0].Rows[0]["Gender"];
                    BirthDateFDB = Data.Tables[0].Rows[0]["Birthdate"].ToString();
                    ageFDB = (string)Data.Tables[0].Rows[0]["age"].ToString();
                    SqlConn.Close();
                }
            
                table = string.Format("<table cellpadding = \"5\" id = \"userInfoTable\"><tr><th class=\"cell\">שם משתמש</th><td class=\"cell\">{0}</td></tr><tr><th class=\"cell\">סיסמה</th><td class=\"cell\">{1}</td></tr><tr><th class=\"cell\">שם פרטי</th><td class=\"cell\">{2}</td></tr><tr><th class=\"cell\">שם משפחה</th><td class=\"cell\">{3}</td></tr><tr><th class=\"cell\">כתובת אימייל</th><td class=\"cell\">{4}</td></tr><tr><th class=\"cell\">מספר טלפון</th><td class=\"cell\">{5}</td></tr><tr><th class=\"cell\">כתובת</th><td class=\"cell\">{6}</td></tr><tr><th class=\"cell\">מין</th><td class=\"cell\">{7}</td></tr><tr><th class=\"cell\">תאריך לידה</th><td class=\"cell\">{8}</td></tr></table>", usernameFDB, passwordFDB, firstNameFDB, lastNameFDB, emailFDB, phoneFDB, addressFDB, GenderFDB, BirthDateFDB, ageFDB);

                
                //string.Format("<table cellpadding = \"5\" id = \"userInfoTable\"><tr><th class=\"cell\">שם משתמש</th><th class=\"cell\">סיסמה</th><th class=\"cell\">שם פרטי</th><th class=\"cell\">שם משפחה</th><th class=\"cell\">כתובת אימייל</th><th class=\"cell\">מספר טלפון</th><th class=\"cell\">כתובת</th><th class=\"cell\">מין</th><th class=\"cell\">תאריך לידה</th></tr><tr><td class=\"cell\">{0}</td><td class=\"cell\">{1}</td><td class=\"cell\">{2}</td><td class=\"cell\">{3}</td><td class=\"cell\">{4}</td><td class=\"cell\">{5}</td><td class=\"cell\">{6}</td><td class=\"cell\">{7}</td><td class=\"cell\">{8}</td></tr></table>", usernameFDB, passwordFDB, firstNameFDB, lastNameFDB, emailFDB, phoneFDB, addressFDB, GenderFDB, BirthDateFDB, ageFDB);

                
            }
        }
        
    }
}