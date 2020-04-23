<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebProj.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" action="LoginPage.aspx" method="post" onsubmit="LogInCheck()">
        <h2>התחברות</h2>
        <br /> <br />
        <div> 
            <table class="table" id="LogTable">
                <tr>
                    <td>שם משתמש:</td>
                    <td><input type="text" id="UserNameLog" name="UserNameLog" onfocus="ClearBox('UNameLogError')"/></td>
                    <td id="UNameLogError" style="color:red;"></td>
                </tr>
                <tr>
                    <td>סיסמא:</td>
                    <td><input type="password" id="ZeePasswordLog" name="ZeePasswordLog" onfocus="ClearBox('PassLogError')"/></td>
                    <td id="PassLogError" style="color:red;"></td>
                </tr>
            </table>
            <br /><br /><br /><br />
            <div id="ForButtons">
                <input type="submit" id="Send" name="Send" value="שלח"/>
                <button type="button" id="ClearButton" name="ClearAButton" onclick="LogClearTextBlocks()">נקה</button>
                </div>
            <br />
            <img src="Pics/RegPics/DogoLogo.png" width="auto" height="250" />
        </div>
    </form>
</asp:Content>
