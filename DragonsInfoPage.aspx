<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="DragonsInfoPage.aspx.cs" Inherits="WebProj.DragonsInfoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript"> 

        var PicsArrayList = [["Pics/Dragons/General/Dragon2.jpg", "Pics/Dragons/General/Dragon3.jpg", "Pics/Dragons/General/Dragon4.jpg", "Pics/Dragons/General/Dragon5.png", "Pics/Dragons/General/Dragon6.jpg", "Pics/Dragons/General/NightFury.jpg"], ["Pics/Dragons/NightFury/NightFury3.jpg", "Pics/Dragons/NightFury/NightFury.jpg", "Pics/Dragons/NightFury/NightFury2.jpeg", "Pics/Dragons/NightFury/NightFury34.jpg", "Pics/Dragons/NightFury/NightFury5.jpg", "Pics/Dragons/NightFury/NightFury6.png", "Pics/Dragons/NightFury/NightFury9.png", "Pics/Dragons/NightFury/NightFury7.jpg", "Pics/Dragons/NightFury/NightFury8.jpg"], ["Pics/Dragons/HungarianHorntail/HungarianHorntail2.gif", "Pics/Dragons/HungarianHorntail/HungarianHorntail1.jpg", "Pics/Dragons/HungarianHorntail/HungarianHorntail3.jpg", "Pics/Dragons/HungarianHorntail/HungarianHorntail4.png", "Pics/Dragons/HungarianHorntail/HungarianHorntail5.jpg"], ["Pics/Dragons/MonstrousNightmare/MonstrousNightmare1.jpg", "Pics/Dragons/MonstrousNightmare/MonstrousNightmare2.jpg", "Pics/Dragons/MonstrousNightmare/MonstrousNightmare3.jpg", "Pics/Dragons/MonstrousNightmare/MonstrousNightmare4.jpg", "Pics/Dragons/MonstrousNightmare/MonstrousNightmare5.png"], ["Pics/Dragons/Hydra/Hydra.jpg", "Pics/Dragons/Hydra/Hydra6.jpg", "Pics/Dragons/Hydra/Hydra1.jpeg", "Pics/Dragons/Hydra/Hydra2.jpg", "Pics/Dragons/Hydra/Hydra3.jpg", "Pics/Dragons/Hydra/Hydra4.jpg", "Pics/Dragons/Hydra/Hydra5.jpg"], ["Pics/Dragons/Hotburple/Hotburple3.png", "Pics/Dragons/Hotburple/Hotburple2.png", "Pics/Dragons/Hotburple/Hotburple1.png", "Pics/Dragons/Hotburple/Hotburple4.png", "Pics/Dragons/Hotburple/Hotburple5.jpg"], ["Pics/Dragons/Skrill/Skrill1.gif", "Pics/Dragons/Skrill/Skrill2.gif", "Pics/Dragons/Skrill/Skrill3.png", "Pics/Dragons/Skrill/Skrill4.jpg", "Pics/Dragons/Skrill/Skrill5.gif", "Pics/Dragons/Skrill/Skrill6.png"]];
        var HeadLines = ["Dragons", "Dragons-Night Fury", "Dragons-Hungarian Horntail", "Dragons-Monstrous Nightmare", "Dragons-Hydra", "Dragons-Hotburple", "Dragon-Skrill"];
        var ParagraphList = ["A dragon is a large, serpent-like legendary creature that appears in the folklore of many cultures around the world.", "The Night Fury is a medium-sized Strike Class dragon that first appeared in How to Train Your Dragon.", "Hungarian Horntail is a dragon considered to be one of the most dangerous dragons, this dragon is from the book Harry Potter", "a devilishly looking, with two curved horns, physically resemble a western dragon, from the movie how to train your dragon", "Hydra, a powerful dragon with multiple heads. if one of it's heads is cut off it grows 2 more.", "The Hotburple is a Boulder Class dragon seen in the How to Train Your Dragon and it's a lazy and sleepy breed", "The Skrill is a medium-sized Strike Class dragon from how to train your dragon, They can summon lightning and shoot electrical shots"]

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:left;padding-left:4%">
        <br />
        <h1 id="HeadLine" ><script type="text/javascript">document.write(HeadLines[CurrentType])</script></h1>
        <p id="InfoText"><script type="text/javascript">document.write(ParagraphList[CurrentType])</script></p>
        <br /> 
        <button onclick="PrevPic('Pic')" id="PrevButton" class="ImgButton">Previous Image</button>
        <button onclick="NextPic('Pic')" id="NextButton" class="ImgButton"> Next Image </button>
        <br /> <br /> 
        <img id="Pic" src= "Pics/Dragons/General/Dragon2.jpg" width="auto" height="250" />
        <br /> <br />
        <button onclick="SwitchContent(0)"> General </button>
        <button onclick="SwitchContent(1)">Night Fury</button>
        <button onclick="SwitchContent(2)">Hungarian Horntail</button>
        <button onclick="SwitchContent(3)">Monstrous Nightmare</button>
        <button onclick="SwitchContent(4)"> Hydra </button>
        <button onclick="SwitchContent(5)"> Hotburple </button>
        <button onclick="SwitchContent(6)"> Skrill </button>    
    </div>
</asp:Content>
