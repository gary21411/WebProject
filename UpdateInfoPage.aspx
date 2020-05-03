<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="UpdateInfoPage.aspx.cs" Inherits="WebProj.UpdateInfoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" action="RegistrationPage.aspx" method="post" onsubmit="CheckStuff()">
        <h2>עדכון/שינוי פרטי משתמש</h2>

        <div> <table class="table" id="UpdatingTable">
        <tr>
            <td>שם פרטי:</td>
            <td><input type="text" id="UFirstName" name="UFirstName" onfocus="ClearBox('UFNameError')"/></td>
            <td id="UFNameError" style="color:red;"></td>
        </tr>
        <tr>
            <td>שם משפחה:</td>
            <td><input type="text" id="ULastName" name="ULastName" onfocus="ClearBox('ULNameError')"/></td>
            <td id="ULNameError" style="color:red;"></td>
        </tr>
        <tr>
            <td>שם משתמש:</td>
            <td><input type="text" id="UZeeUserName" name="UZeeUserName" onfocus="ClearBox('UNameError')"/></td>
            <td id="UNameError" style="color:red;"></td>
        </tr>
        <tr>
            <td>מייל:</td>
            <td><input type="email" id="UZeeUsersMail" name="UZeeUsersMail" onfocus="ClearBox('UMailError')"/></td>
            <td id="UMailError" style="color:red;"></td>
        </tr>
        <tr>
            <td>סיסמא:</td>
            <td><input type="password" id="UPassword" name="UPassword" onfocus="ClearBox('UPassError')"/></td>
            <td id="UPassError" style="color:red;"></td>
        </tr>
        <tr>
            <td>אמת הסיסמא:</td>
            <td><input type="password" id="UConfirmedPassword" name="UConfirmedPassword" onfocus="ClearBox('UPassError2')"/></td>
            <td id="UPassError2" style="color:red;"></td>
        </tr>
        <tr>
            <td>תאריך לידה:</td>
            <td><input type="date" id="UBirthDate" name="UBirthDate" onblur="UBirthDateToAge()" onfocus="ClearBox('UBirthDateError')"/></td>
            <td id="UBirthDateError" style="color:red;"></td>
        </tr>
        <tr>
            <td>גיל:</td>
            <td id="UAgeTD"><input type="number" id="UAge" name="UAge" disabled/></td>
            <td id="UAgeError" style="color:red;"></td>
        </tr>
        <tr>
            <td>מגדר:</td>
            <td id="GenderTD">
                <input type="radio" id="UGenderMale" name="UGender" value="בן"/> בן
                <input type="radio" id="UGenderFeMale" name="UGender" value="בת"/> בת
                <input type="radio" id="UGenderElse" name="UGender" value="אחר"/> אחר
            </td>
            <td id="GenderError" style="color:red;"></td>
        </tr>
        <tr>
            <td>טלפון נייד:</td>
            <td><input type="tel" id="UPhoneNum" name="UPhoneNum" onfocus="ClearBox('UPhoneError')"/></td>
            <td id="UPhoneError" style="color:red;"></td>
        </tr>
        <tr>
            <td>כתובת:</td>
            <td><input type="text" id="UAddress" name="UAddress" onfocus="ClearBox('UAddressError')"/></td>
            <td id="UAddressError" style="color:red;"></td>
        </tr>
    </table> </div>

    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /> <br />
    <div id="ForButtons">
        <input type="submit" id="Send" name="Send" value="עדכן משתמש" onclick="return UCheckStuff()"/>
        <button type="button" id="ClearAllButton" name="ClearAllButton" onclick="UClearTextBlocks()">נקה</button>
    </div>
    </form>
</asp:Content>
