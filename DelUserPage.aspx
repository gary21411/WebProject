<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="DelUserPage.aspx.cs" Inherits="WebProj.DelUserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" action="DelUserPage.aspx" method="post" onsubmit="LogInCheck()">
        <h2>מחיקת משמש</h2>
        <br /> <br />
        <div> 
            <p>.אמת את המשתמש שלך. צריך להיות די בטוח כדי למחוק משתמש</p>
            <table class="table" id="LogTable">
                <tr>
                    <td>שם משתמש:</td>
                    <td><input type="text" id="UserNameDel" name="UserNameDel" onfocus="ClearBox('UNameDelError')"/></td>
                    <td id="UNameDelError" style="color:red;"></td>
                </tr>
                <tr>
                    <td>סיסמא:</td>
                    <td><input type="password" id="ZeePasswordDel" name="ZeePasswordDel" onfocus="ClearBox('PassDelError')"/></td>
                    <td id="PassDelError" style="color:red;"></td>
                    </tr>
            </table>
            <br /><br /><br /><br />
            <div id="ForButtons">
                <input type="submit" id="Send" name="Send" value="מחיקת משתמש"/>
                <button type="button" id="ClearButton" name="ClearAButton" onclick="LogClearTextBlocks()">נקה</button>
                </div>
            <br />
            <img src="Pics/RegPics/Beelogedin.gif" width="auto" height="250"/>
        </div>
        </form>
</asp:Content>
