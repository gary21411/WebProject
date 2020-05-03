<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="AllUsersData.aspx.cs" Inherits="WebProj.AllUsersData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    #Around {
        position:absolute;
        left: 1.5%;
    }

    #AllUsersInfoTable{
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
        border: 1px solid black;
        background-color:azure;
        direction: rtl;
    }

    .stuff    {
        font-size: 8px;
        border: 1px solid black ;
        text-align: right;
        padding: 8px;
    }

    .stuff2 {
        border: 2px solid black;
        text-align: right;
        padding: 8px;
        font-weight: 500;
        font-family: Aharoni;
        font-size: 9px;
    }

    tr:nth-child(even){background-color: #f2f2f2}
</style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" action="AllUsersData.aspx" method="post" onsubmit="CheckStuff()">
        <h2> פרטי כל המשתמשים</h2>
        <table>
             <tr>
                    <td>-סנן על פי:</td>
                    <td>
                        <select name="WhereforFilter">
                            <option value="Select">בחר סנן</option>
                            <option value="FirstName">שם פרטי</option>
                            <option value="LastName">שם משפחה</option>
                            <option value="UserName">שם משתמש</option>
                            <option value="Mail">מייל</option>
                            <option value="MobileNumber">טלפון</option>
                            <option value="BirthDate">תאריך לידה</option>
                            <option value="age">גיל</option>
                            <option value="Gender">מגדר</option>
                            <option value="Address">כתובת</option>
                        </select>
                    </td>
                    <td>|שהערך הוא:</td>
                    <td><input type="text" id="TheFilter" name="TheFilter"/></td>
                    <td><input type="submit" id="SendIt" name="SendIt" value="סנן"/></td>
                </tr>
        </table>
        <br /><br /><br />
        <div id="Around">
            <% =TheBigTable %> 
        </div>

        <input class="main" type="submit" name="delete" value="מחק משתמשים" onclick="Navigate()" >
        <br />
        <p>
        <input type="text" id="deleteLine" name="deleteLine" size="20" style="visibility: hidden" />
        </p>

    </form>

    <script>
        function Navigate() {
            var length = document.getElementById("AllUsersInfoTable").rows.length;

            var chkStr = "chk";
            var temp = "";
            var flag = true;
            var users = [];
            var counter = 0;

            for (var i = 0; i < length - 1; i++) {
                temp = chkStr + i;
                flag = document.getElementById(temp).checked;
                if (flag) {
                    users[counter] = document.getElementById("user" + i).innerHTML;
                    counter += 1;
                    
                }
                
            }

            sqlStr = "DELETE FROM TbUsers WHERE (";
            for (var i = 0; i < counter; i++) {
                sqlStr += "UserName = N'" + users[i] + "'";
                if (i < counter - 1) {
                    sqlStr += " OR ";
                }
            }
            sqlStr += ")";
            document.getElementById("deleteLine").value = sqlStr;
            return true;
        }
    </script>
</asp:Content>
