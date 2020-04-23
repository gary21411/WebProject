<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="AllUsersData.aspx.cs" Inherits="WebProj.AllUsersData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
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
<script type="text/javascript">
    function DelUserFunc() {
        var currentOne = "";
        var IsCurrentboxChecked = "";
        var ToSqlThingy = "(";
        var CurrentUser = "";

        for (var i = 0; i < range; i++) {
            currentOne = "chk" + i;
            IsCurrentboxChecked = document.getElementById(currentOne).checked; 
            
            if (IsCurrentboxChecked) {
                CurrentUser = document.getElementById("TabTab").rows[i].cells[2].innerHTML;
                alert(CurrentUser);
                ToSqlThingy += "N'" + CurrentUser + "'";
                if (i < counter - 1) {
                    sqlStr += ", ";
                }
            }
        }
        ToSqlThingy += ")";
        document.getElementById("Step").value = ToSqlThingy;
    }
</script>

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
        <br /><br /><br /><br />
        <div>
            <% =TheBigTable %> 
        </div>
        <button type="submit" id="DelUsersButton" name="DelUsersButton" onclick="DelUserFunc()">מחק משתמשים</button>
        
        
        <p> <input type="text" id="Step" name="Step" size="20" style="visibility: hidden" /> </p>
        <!------>


    </form>
</asp:Content>
