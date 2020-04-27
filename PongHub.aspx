<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="PongHub.aspx.cs" Inherits="WebProj.PongHub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Pong - Game</h1>
    <br /><br />
    <p>What Type of pong do you what to play???</p>
    <button id="Comp" class="button Pong" onclick="location = 'PongComp.aspx'">Pong Vs Comp</button>
    <button id="1V1" class="button Pong" onclick="location = 'Pong1v1.aspx'"> Pong 1v1</button>
</asp:Content>
