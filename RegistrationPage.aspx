<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="WebProj.RegistrationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sign Up - הרשמה</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>הרשמה</h2>
    <form id="form1" runat="server" action="RegistrationPage.aspx" method="post" onsubmit="CheckStuff()">
    <div> <table class="table" id="RegTable">
        <tr>
            <td>שם פרטי:</td>
            <td><input type="text" id="FirstName" name="FirstName" onfocus="ClearBox('FNameError')"/></td>
            <td id="FNameError" style="color:red;"></td>
        </tr>
        <tr>
            <td>שם משפחה:</td>
            <td><input type="text" id="LastName" name="LastName" onfocus="ClearBox('LNameError')"/></td>
            <td id="LNameError" style="color:red;"></td>
        </tr>
        <tr>
            <td>שם משתמש:</td>
            <td><input type="text" id="ZeeUserName" name="ZeeUserName" onfocus="ClearBox('UNameError')"/></td>
            <td id="UNameError" style="color:red;"></td>
        </tr>
        <tr>
            <td>מייל:</td>
            <td><input type="email" id="ZeeUsersMail" name="ZeeUsersMail" onfocus="ClearBox('MailError')"/></td>
            <td id="MailError" style="color:red;"></td>
        </tr>
        <tr>
            <td>סיסמא:</td>
            <td><input type="password" id="Password" name="Password" onfocus="ClearBox('PassError')"/></td>
            <td id="PassError" style="color:red;"></td>
        </tr>
        <tr>
            <td>אמת הסיסמא:</td>
            <td><input type="password" id="ConfirmedPassword" name="ConfirmedPassword" onfocus="ClearBox('PassError2')"/></td>
            <td id="PassError2" style="color:red;"></td>
        </tr>
        <tr>
            <td>תאריך לידה:</td>
            <td><input type="date" id="BirthDate" name="BirthDate" onblur="BirthDateToAge()" onfocus="ClearBox('BirthDateError')"/></td>
            <td id="BirthDateError" style="color:red;"></td>
        </tr>
        <tr>
            <td>גיל:</td>
            <td id="AgeTD"><input type="number" id="Age" name="Age" disabled/></td>
            <td id="AgeError" style="color:red;"></td>
        </tr>
        <tr>
            <td>מגדר:</td>
            <td id="GenderTD">
                <input type="radio" id="GenderMale" name="Gender" value="בן"/> בן
                <input type="radio" id="GenderFeMale" name="Gender" value="בת"/> בת
                <input type="radio" id="GenderElse" name="Gender" value="אחר"/> אחר
            </td>
            <td id="GenderError" style="color:red;">*בחירה</td>
        </tr>
        <tr>
            <td>טלפון נייד:</td>
            <td><input type="tel" id="PhoneNum" name="PhoneNum" onfocus="ClearBox('PhoneError')"/></td>
            <td id="PhoneError" style="color:red;"></td>
        </tr>
        <tr>
            <td>כתובת:</td>
            <td><input type="text" id="Address" name="Address" onfocus="ClearBox('AddressError')"/></td>
            <td id="AddressError" style="color:red;"></td>
        </tr>
    </table> </div>

    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> <br />
    <div id="ForButtons">
        <input type="submit" id="Send" name="Send" value="שלח" onclick="return CheckStuff()"/>
        <button type="button" id="ClearAllButton" name="ClearAllButton" onclick="ClearTextBlocks()">נקה</button>
    </div>
    </form>
    <div class="ForPics">
        <img src="Pics/RegPics/SignUpPageImg1.png" height="150" width="auto"/>
        <img src="Pics/RegPics/SignUpPageImg2.jpg" height="150" width="auto"/>
    </div>
    </asp:Content>
