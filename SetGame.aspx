﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RegisterFormatron.Master" AutoEventWireup="true" CodeBehind="SetGame.aspx.cs" Inherits="WebProj.SetGame" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        // the card format    [Pic_Src, Type (Full/Hollow/Stripped), Color (Red/Blue/Green), Shape (Rect/Circle/Tri)]
        var AllCards = [
            ["SetGameStuff/FullBlueCircle.PNG", "Full", "Blue", "Circle"],
            ["SetGameStuff/FullBlueRect.PNG", "Full", "Blue", "Rect"],
            ["SetGameStuff/FullBlueTri.PNG", "Full", "Blue", "Tri"],
            ["SetGameStuff/FullGreenCircle.PNG", "Full", "Green", "Circle"],
            ["SetGameStuff/FullGreenRect.PNG", "Full", "Green", "Rect"],
            ["SetGameStuff/FullGreenTri.PNG", "Full", "Green", "Tri"],
            ["SetGameStuff/FullRedCircle.PNG", "Full", "Red", "Circle"],
            ["SetGameStuff/FullRedRect.PNG", "Full", "Red", "Rect"],
            ["SetGameStuff/FullRedTri.PNG", "Full", "Red", "Tri"],
            ["SetGameStuff/HollowBlueCircle.PNG", "Hollow", "Blue", "Circle"],
            ["SetGameStuff/HollowBlueRect.PNG", "Hollow", "Blue", "Rect"],
            ["SetGameStuff/HollowBlueTri.PNG", "Hollow", "Blue", "Tri"],
            ["SetGameStuff/HollowGreenCircle.PNG", "Hollow", "Green", "Circle"],
            ["SetGameStuff/HollowGreenRect.PNG", "Hollow", "Green", "Rect"],
            ["SetGameStuff/HollowGreenTri.PNG", "Hollow", "Green", "Tri"],
            ["SetGameStuff/HollowRedCircle.PNG", "Hollow", "Red", "Circle"],
            ["SetGameStuff/HollowRedRect.PNG", "Hollow", "Red", "Rect"],
            ["SetGameStuff/HollowRedTri.PNG", "Hollow", "Red", "Tri"],
            ["SetGameStuff/StrippedBlueCircle.PNG", "Stripped", "Blue", "Circle"],
            ["SetGameStuff/StrippedBlueRect.PNG", "Stripped", "Blue", "Rect"],
            ["SetGameStuff/StrippedBlueTri.PNG", "Stripped", "Blue", "Tri"],
            ["SetGameStuff/StrippedGreenCircle.PNG", "Stripped", "Green", "Circle"],
            ["SetGameStuff/StrippedGreenRect.PNG", "Stripped", "Green", "Rect"],
            ["SetGameStuff/StrippedGreenTri.PNG", "Stripped", "Green", "Tri"],
            ["SetGameStuff/StrippedRedCircle.PNG", "Stripped", "Red", "Circle"],
            ["SetGameStuff/StrippedRedRect.PNG", "Stripped", "Red", "Rect"],
            ["SetGameStuff/StrippedRedTri.PNG", "Stripped", "Red", "Tri"]
        ];

        var Current9 = ["SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG"];

        var SelectedCards = [null, null, null];

        var Score = 0;
        var TimeToDeath;
        var TheTimer;

        function RandomInt(Max) {
            return Math.floor(Math.random() * Math.floor(Max));
        }

        function FillCurrent9() {
            var x;
            var NewCard;
            var AnotherOne;
            for (i = 0; i < Current9.length; i++) {
                AnotherOne = true
                if (Current9[i] == "SetGameStuff/Empty.PNG") {
                    x = RandomInt(27);
                    NewCard = AllCards[x];
                    for (j = 0; j < Current9.length; j++) {
                        if (Current9[j] == NewCard) {
                            i--;
                            AnotherOne = false;
                            break;
                        }
                    }
                    if (AnotherOne) {
                        Current9[i] = NewCard;
                    }

                }
            }
        }

        function FromCurrent9ToPics() {
            var CurrentId;
            var NewSrc;
            for (i = 0; i < Current9.length; i++) {
                CurrentId = "CardPlaceHolder" + (i + 1);
                NewSrc = Current9[i][0];
                document.getElementById(CurrentId).src = NewSrc;

            }
        }

        function SelectCard(I) {
            var BoxId = "CardPlaceHolder" + I;
            var Current9Index = I - 1;
            var Current9Piece = Current9[Current9Index];
            if (document.getElementById(BoxId).src != "SetGameStuff/Empty.PNG") {

                if ((SelectedCards[0] == Current9Piece) || (SelectedCards[1] == Current9Piece) || (SelectedCards[2] == Current9Piece)) {
                    document.getElementById(BoxId).style.boxShadow = "unset";
                    if (SelectedCards[0] == Current9Piece) {
                        SelectedCards[0] = null;
                    }
                    else if (SelectedCards[1] == Current9Piece) {
                        SelectedCards[1] = null;
                    }
                    else if (SelectedCards[2] == Current9Piece) {
                        SelectedCards[2] = null;
                    }
                }
                else {
                    document.getElementById(BoxId).style.boxShadow = "0px 0px 0px 4px #fdff00";
                    if (SelectedCards[0] == null) {
                        SelectedCards[0] = Current9Piece;
                    }
                    else if (SelectedCards[1] == null) {
                        SelectedCards[1] = Current9Piece;
                    }
                    else if (SelectedCards[2] == null) {
                        SelectedCards[2] = Current9Piece;
                    }
                }
            }


            CheckSelected3();
        }

        function StartGame() {
            // Resets from prev game |Start|
            document.getElementById("Row1").innerHTML = '<img id="CardPlaceHolder1" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(1)" /> <img id="CardPlaceHolder2" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(2)" /> <img id="CardPlaceHolder3" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(3)" />';
            document.getElementById("Row2").innerHTML = '<img id="CardPlaceHolder4" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(4)" /> <img id="CardPlaceHolder5" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(5)" /> <img id="CardPlaceHolder6" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(6)" />';
            document.getElementById("Row3").innerHTML = '<img id="CardPlaceHolder7" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(7)" /> <img id="CardPlaceHolder8" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(8)" /> <img id="CardPlaceHolder9" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(9)" />';
            TimeToDeath = 120;
            clearInterval(TheTimer);
            Score = 0;
            Current9 = ["SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG", "SetGameStuff/Empty.PNG"];
            // Resets from prev game |End|

            document.getElementById("ScoreBox").innerHTML = "Score:  " + Score;
            FillCurrent9();
            FromCurrent9ToPics();
            document.getElementById("TimeBox").innerHTML = "Time Left:" + TimeToDeath + "s";

            TheTimer = setInterval(function () {
                if (TimeToDeath == 0) {
                    document.getElementById("Row1").innerHTML = '<img id="CardPlaceHolder1" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" /> <img id="CardPlaceHolder2" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG"/> <img id="CardPlaceHolder3" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" />';
                    document.getElementById("Row2").innerHTML = '<img id="CardPlaceHolder4" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" /> <img id="CardPlaceHolder5" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG"/> <img id="CardPlaceHolder6" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" />';
                    document.getElementById("Row3").innerHTML = '<img id="CardPlaceHolder7" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" /> <img id="CardPlaceHolder8" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG"/> <img id="CardPlaceHolder9" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" />';
                    

                }
                else if (TimeToDeath > 0) {
                    TimeToDeath -= 1
                    document.getElementById("TimeBox").innerHTML = "Time Left:" + TimeToDeath + "s";
                }
                
            }, 1000);
             


        }

        function CheckSelected3() {

            var Card1, Card2, Card3;
            var Card1Type, Card2Type, Card3Type, Card1Color, Card2Color, Card3Color, Card1Shape, Card2Shape, Card3Shape;
            var CurrentSelectedCard;
            Card1 = SelectedCards[0];
            Card2 = SelectedCards[1];
            Card3 = SelectedCards[2];
            if (Card1 != null && Card2 != null && Card3 != null) {
                Card1Type = Card1[1];
                Card1Color = Card1[2];
                Card1Shape = Card1[3];
                Card2Type = Card2[1];
                Card2Color = Card2[2];
                Card2Shape = Card2[3];
                Card3Type = Card3[1];
                Card3Color = Card3[2];
                Card3Shape = Card3[3];
                if (((Card1Type == Card2Type) && (Card2Type == Card3Type) && (Card1Type == Card3Type)) || ((Card1Type != Card2Type) && (Card2Type != Card3Type) && (Card1Type != Card3Type))) {
                    if (((Card1Color == Card2Color) && (Card2Color == Card3Color) && (Card1Color == Card3Color)) || ((Card1Color != Card2Color) && (Card1Color != Card3Color) && (Card3Color != Card2Color))) {
                        if (((Card1Shape == Card2Shape) && (Card2Shape == Card3Shape) && (Card1Shape == Card3Shape)) || ((Card1Shape != Card2Shape) && (Card1Shape != Card3Shape) && (Card3Shape != Card2Shape))) {
                            Score += 100;
                            // delete selected cards (so they can be replaced)
                            for (y = 0; y < SelectedCards.length; y++) {
                                CurrentSelectedCard = SelectedCards[y];
                                for (x = 0; x < Current9.length; x++) {
                                    if (Current9[x] == CurrentSelectedCard) {
                                        Current9[x] = "SetGameStuff/Empty.PNG";
                                    }

                                }
                            }
                            FillCurrent9();
                            FromCurrent9ToPics();


                        }
                    }
                }

                //
                // (diselect) clears selected cards (Start) | 
                SelectedCards = [null, null, null];

                //the ones below are only Visual clear.
                document.getElementById("CardPlaceHolder1").style.boxShadow = "unset";
                document.getElementById("CardPlaceHolder2").style.boxShadow = "unset";
                document.getElementById("CardPlaceHolder3").style.boxShadow = "unset";
                document.getElementById("CardPlaceHolder4").style.boxShadow = "unset";
                document.getElementById("CardPlaceHolder5").style.boxShadow = "unset";
                document.getElementById("CardPlaceHolder6").style.boxShadow = "unset";
                document.getElementById("CardPlaceHolder7").style.boxShadow = "unset";
                document.getElementById("CardPlaceHolder8").style.boxShadow = "unset";
                document.getElementById("CardPlaceHolder9").style.boxShadow = "unset";
                // -------------------------------------------------------------------

                document.getElementById("ScoreBox").innerHTML = "Score:  " + Score;
            }

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div>
            <p style="display:inline;font-size:24px;position:absolute;left:5%;top: -5%;" id="TimeBox">Time Left: --- </p>
            <p style="display:inline;font-size:24px;position:absolute;right:5%;top: -5%;" id ="ScoreBox">Score: 0 </p>
            <br />
            <div id="Row1"><img id="CardPlaceHolder1" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(1)"/><img id="CardPlaceHolder2" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(2)"/><img id="CardPlaceHolder3" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(3)"/></div>
            <div id="Row2"><img id="CardPlaceHolder4" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(4)"/><img id="CardPlaceHolder5" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(5)"/><img id="CardPlaceHolder6" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(6)"/></div>
            <div id="Row3" ><img id="CardPlaceHolder7" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(7)"/><img id="CardPlaceHolder8" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(8)"/><img id="CardPlaceHolder9" class="CardPlaceHolders" src="SetGameStuff/Empty.PNG" onclick="SelectCard(9)"/></div>
            <button type="button" onclick="StartGame()">Suffle(to start)</button>
            
        </div>
    </form>

</asp:Content>
