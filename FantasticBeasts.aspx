<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="FantasticBeasts.aspx.cs" Inherits="WebProj.FantasticBeasts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript"> 


        var PicsArrayList = [["Pics/Fantastic%20Beasts/Thunderbird/Thunderbird4.jpg", "Pics/Fantastic%20Beasts/Basilisk/Basilisk1.jpg", "Pics/Fantastic%20Beasts/Niffler/Niffler1.png", "Pics/Fantastic%20Beasts/General/Imp1.jpg", "Pics/Fantastic%20Beasts/Pegasus/Pegasus4.jpg", "Pics/Fantastic%20Beasts/General/Imp2.jpg",], ["Pics/Fantastic%20Beasts/Niffler/Niffler2.jpg", "Pics/Fantastic%20Beasts/Niffler/Niffler1.png", "Pics/Fantastic%20Beasts/Niffler/Niffler4.jpg", "Pics/Fantastic%20Beasts/Niffler/Niffler6.jpg", "Pics/Fantastic%20Beasts/Niffler/Niffler3.jpg", "Pics/Fantastic%20Beasts/Niffler/Niffler5.jpg"], ["Pics/Fantastic%20Beasts/Thunderbird/Thunderbird1.jpg", "Pics/Fantastic%20Beasts/Thunderbird/Thunderbird2.jpg", "Pics/Fantastic%20Beasts/Thunderbird/Thunderbird3.jpg", "Pics/Fantastic%20Beasts/Thunderbird/Thunderbird4.jpg", "Pics/Fantastic%20Beasts/Thunderbird/Thunderbird5.jpg", "Pics/Fantastic%20Beasts/Thunderbird/Thunderbird6.jpg"], ["Pics/Fantastic%20Beasts/Pegasus/Pegasus1.jpg", "Pics/Fantastic%20Beasts/Pegasus/Pegasus2.jpg", "Pics/Fantastic%20Beasts/Pegasus/Pegasus3.jpg", "Pics/Fantastic%20Beasts/Pegasus/Pegasus4.jpg", "Pics/Fantastic%20Beasts/Pegasus/Pegasus5.jpg"], ["Pics/Fantastic%20Beasts/Basilisk/Basilisk5.jpg", "Pics/Fantastic%20Beasts/Basilisk/Basilisk.jpg", "Pics/Fantastic%20Beasts/Basilisk/Basilisk4.jpg", "Pics/Fantastic%20Beasts/Basilisk/Basilisk1.jpg", "Pics/Fantastic%20Beasts/Basilisk/Basilisk2.png"], ["Pics/Fantastic%20Beasts/Hydra/Hydra.jpg", "Pics/Fantastic%20Beasts/Hydra/Hydra1.jpeg", "Pics/Fantastic%20Beasts/Hydra/Hydra2.jpg", "Pics/Fantastic%20Beasts/Hydra/Hydra3.jpg", "Pics/Fantastic%20Beasts/Hydra/Hydra4.jpg", "Pics/Fantastic%20Beasts/Hydra/Hydra5.jpg", "Pics/Fantastic%20Beasts/Hydra/Hydra6.jpg"]];
        var HeadLines = ["Fantastic Beasts", "Fantastic Beasts-Niffler", "Fantastic Beasts-Thunderbird", "Fantastic Beasts-Pegasus", "Fantastic Beasts-Basilisk", "Fantastic Beasts-Hydra"];
        var ParagraphList = ["fantastic beasts/mythical creatures are not real (until proven differently) imagenery creatures.", "Long-snouted, burrowing creatures native to Britain with a penchant for anything shiny.", "The Thunderbird is a large, magical avian beast native to North America, and similar to a Hippogriff", "Pegasus is a mythological creature described as a beautiful, pure stallion with wings, created by Poseidon, the Greek god of the sea.", "a basilisk is a legendary reptile reputed to be a serpent king, who can cause death with a single glance", "Hydra, a powerful dragon with multiple heads. if one of it's heads is cut off it grows 2 more."];

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
        <img id="Pic" src= "Pics/Fantastic%20Beasts/Thunderbird/Thunderbird4.jpg" width="auto" height="250" />
        <br /> <br />
        <button onclick="SwitchContent(0)"> General </button>
        <button onclick="SwitchContent(1)"> Niffler </button>
        <button onclick="SwitchContent(2)">Thunderbird</button>
        <button onclick="SwitchContent(3)">Pegasus</button>
        <button onclick="SwitchContent(4)">Basilisk</button>
        <button onclick="SwitchContent(5)"> Hydra </button>  
    </div>
</asp:Content>
