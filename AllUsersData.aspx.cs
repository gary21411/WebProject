using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

namespace WebProj
{
    public partial class AllUsersData : System.Web.UI.Page
    {
        public string TheBigTable = " ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString() == "Y")
            {
                TheBigTable += "<table cellpadding = \"5\" id=\"AllUsersInfoTable\" name=\"TabTab\"><tr class=\"stuff\"><th class=\"stuff2\">username</th><th class=\"stuff2\">mail</th><th class=\"stuff2\">firstname</th><th class=\"stuff2\">lastname</th><th class=\"stuff2\">password</th><th class=\"stuff2\">birthday</th><th class=\"stuff2\">age</th><th class=\"stuff2\">phonenumber</th><th class=\"stuff2\">gender</th><th class=\"stuff2\">address</th><th></th></tr>";

                string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\database.mdf;Integrated Security=True";
                string cmdStr = "SELECT  UserName, Mail, FirstName, LastName, PassWord, Birthdate, age, MobileNumber, Gender, Address  FROM TbUsers";

                if (Request.Form["SendIt"] != null)
                {
                    string FilterValue = Request.Form["TheFilter"];
                    string FilterType = Request.Form["WhereforFilter"];
                    string filterWhere = "";

                    if (FilterType != "Select")
                    {
                        filterWhere = " WHERE (" + FilterType + " = N'" + FilterValue + "')";
                    }
                    else
                    {
                        Response.Redirect("AllUsersData.aspx");
                    }

                    if (filterWhere != "")
                    {
                        cmdStr += filterWhere;
                    }
                }
                //filter block.....

                //delete block (under) (start) ...
                if (Request.Form["delete"] != null && Request.Form["deleteLine"] != null)
                {
                    string ThesqlStr = string.Format(Request.Form["deleteLine"]);
                    SqlConnection SqlConnect = new SqlConnection(conStr);
                    SqlCommand SQLCom = new SqlCommand(ThesqlStr, SqlConnect);
                    SqlConnect.Open();
                    SQLCom.ExecuteNonQuery();
                    SqlConnect.Close();
                }

                SqlDataAdapter da = new SqlDataAdapter(cmdStr, conStr);
                DataSet ds = new DataSet();
                da.Fill(ds);
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    TheBigTable += "<tr class=\"stuff\"><td id=\"user" + i + "\" class=\"stuff\">" + ds.Tables[0].Rows[i]["UserName"] + "</td>" + "<td class=\"stuff\">"
                        + ds.Tables[0].Rows[i]["Mail"] + "</td>" + "<td>" + ds.Tables[0].Rows[i]["FirstName"]
                        + "</td>" + "<td class=\"stuff\">" + ds.Tables[0].Rows[i]["LastName"] + "</td>" + "<td class=\"stuff\">"
                        + ds.Tables[0].Rows[i]["PassWord"] + "</td>" + "<td>" + ds.Tables[0].Rows[i]["BirthDate"]
                        + "</td>" + "<td class=\"stuff\">" + ds.Tables[0].Rows[i]["age"] + "</td>" + "<td class=\"stuff\">" + ds.Tables[0].Rows[i]["MobileNumber"]
                        + "</td>" + "<td class=\"stuff\">" + ds.Tables[0].Rows[i]["Gender"]
                       + "</td> " + "<td class=\"stuff\">" + ds.Tables[0].Rows[i]["Address"]
                        + "</td>" + " <td class=\"stuff\">" + "<input type=\"checkbox\" name =\"chk" + i + "\" id =\"chk" + i + "\""
                        + " name=\"checkBoxs\" onclick=\"checkboxValue()\" /> " + "</td></tr>";
                }
                TheBigTable += "</ table >";
            }

            //<table id="AllUsersTable"><tr><td>Del</td><td>שם פרטי:</td><td>שם משפחה:</td><td>שם משתמש:</td><td>מייל:</td><td>סיסמא:</td><td>תאריך לידה:</td><td>גיל:</td><td>מגדר:</td><td>טלפון:</td><td>כתובת:</td></tr></table>


            else
            {
                Session["ErrorText"] = "דף זה נגיש אך ורק למנהלי מערכת...";
                Response.Redirect("./ErrorPage.aspx");
            }

            }
        }
    }
