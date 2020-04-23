<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="UserInfoPage.aspx.cs" Inherits="WebProj.UserInfoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table, th, td {
            border: 1px solid black;
            background-color:azure;
        }

        tr:nth-child(even){background-color: #f2f2f2}
    </style>

    <script>

        function guestUser() {
            alert("You Don't have any User Info as a Guest-User.\n\n Just Log in");

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" action="RegistrationPage.aspx" method="post" onsubmit="CheckStuff()">
        <h2> פרטי משתמש</h2>

        <%=table %>

    <!--- <table id="userInfoTable"><tr><th class="cell">שם משתמש</th><th class="cell">סיסמה</th><th class="cell">שם פרטי</th><th class="cell">שם משפחה</th><th class="cell">כתובת אימייל</th><th class="cell">מספר טלפון</th><th class="cell">כתובת</th><th class="cell">מין</th><th class="cell">תאריך לידה</th></tr><tr><td class="cell">{0}</td><td class="cell">{1</td><td class="cell">{2}</td><td class="cell">{3}</td><td class="cell">{4}</td><td class="cell">{5}</td><td class="cell">{6}</td><td class="cell">{7}</td><td class="cell">{8}</td></tr></table> --->


    </form>
</asp:Content>
