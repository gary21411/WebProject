<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pong1v1.aspx.cs" Inherits="WebProj.Pong1v1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pong (1v1)</title>
    <link href="RegiStyler1.css" rel="stylesheet" />
    <style>
        canvas {
            display : block;
            margin : auto;

        }
        .button {
            border: inherit;
            background: inherit;
            padding: 6px 12px;
            font-size: 16px;
            display: inline-block;
            border-radius: 5px;

        }

        .UserInfo {
            border: 2px solid red;
            color: white;
            background: red;
        }
            .UserInfo:hover{
                color:red;
                border: 2px solid red;
                background: white;
            }

        .Menu {
            border: 2px solid blue;
            color: white;
            background: blue;
        }
            .Menu:hover{
                color:blue;
                border: 2px solid blue;
                background: white;
            }     
        
    </style>
</head>
<body>
    <select class="button Menu" onchange="location = this.options[this.selectedIndex].value;">
            <option>Menu</option>
            <option value="Home.aspx">Home</option>
            <option value="RegistrationPage.aspx">Sign up</option>
            <option value="LoginPage.aspx">Log in</option>
            <option value="AllUsersData.aspx">All Users</option>
            <option value="DelUserPage.aspx">Delete</option>
            <option value="UpdateInfoPage.aspx"> Update</option>
            <option value="DragonsInfoPage.aspx">Dragons Info</option>
            <option value="FantasticBeasts.aspx">Beasts Info</option>
            <option value="SetGame.aspx"> Set-Game</option>
            <option value="KongGame.aspx">Kong-Game</option>
            <option value="PongMenu.aspx">Pong-Game</option>
        </select>
        <button id="UserInfo" class="button UserInfo" onclick="location = 'UserInfoPage.aspx'"><%=Status %></button>
    <form id="form1" runat="server">
        <div>
            <canvas id="screen" width="800" height="480"></canvas>
                <script>

                    var ZeeCanvas;
                    var ctx;
                    var P1x = 0;
                    var P1y = 190;
                    var P2x = 780;
                    var P2y = 190;
                    var ballx = 400;
                    var bally = 240;
                    var xv = 5;
                    var yv = 7;
                    var arrowUp = false;
                    var arrowDown = false;
                    var Wkey = false;
                    var Skey = false;
                    var P1Score = 0;
                    var P2Score = 0;
                    
                    

                    window.onload = function () {
                        ZeeCanvas = document.getElementById("screen");
                        ctx = ZeeCanvas.getContext("2d");
                        var fps = 30;
                        setInterval(function () {
                            drawAll();
                            MovePlayer1();
                            MovePlayer2();
                            moveAll();
                        }, 1000 / fps);
                        addEventListener("keydown", onKeyDown);
                        addEventListener("keyup", onKeyUp);
                        addEventListener("keydown", onKeyDown);
                        addEventListener("keyup", onKeyUp);

                    }

                    function MovePlayer1() {
                        if ((P1y < (ZeeCanvas.height -100)) && (P1y >= -4)) { // so that P1 won't die (the big ifs)
                            if (Wkey) { P1y -= 10; }
                            if (Skey) { P1y += 10; }
                        }
                        else if (P1y <= -5) { P1y += 1; }
                        else { P1y -= 1;}
                    }

                    function MovePlayer2() {
                        if ((P2y < (ZeeCanvas.height - 100)) && (P2y >= -4)) { // so that P1 won't die (the big ifs)
                            if (arrowUp) { P2y -= 10; }
                            if (arrowDown) { P2y += 10; }
                        }
                        else if (P2y <= -5) { P2y += 1; }
                        else { P2y -= 1; }
                    }

                    function onKeyDown(evt) {
                        var keyCode = evt.keyCode;
                        switch (keyCode) {
                            case 38:
                                arrowUp = true;
                                break;
                            case 40:
                                arrowDown = true;
                                break;
                        }
                        switch (keyCode) {
                            case 87:
                                Wkey = true;
                                break;
                            case 83:
                                Skey = true;
                                break;
                        }

                    }
                    function onKeyUp(evt) {
                        var keyCode = evt.keyCode;
                        switch (keyCode) {
                            case 38:
                                arrowUp = false;
                                break;
                            case 40:
                                arrowDown = false;
                                break;
                        }
                        switch (keyCode) {
                            case 87:
                                Wkey = false;
                                break;
                            case 83:
                                Skey = false;
                                break;
                        }
                    }
                    
                    function moveAll() {
                        ballx += xv;
                        bally += yv;

                        if (ballx >= ZeeCanvas.width) { // if zee diffrant wall was hit + what to do
                            xv = -5; // reset trajectory
                            yv = 7; //  """"""""""
                            ballx = ZeeCanvas.width / 2; //teleport to the middle
                            bally = ZeeCanvas.height / 2; // """"""""""
                            P1Score++;
                        }
                        if (ballx <= 0) { // if P1's wall was hit
                            xv = 5; // reset trajectory
                            yv = 7; // """""""""""
                            ballx = ZeeCanvas.width / 2; //teleport to the middle
                            bally = ZeeCanvas.height / 2; // """"""""""
                            P2Score++;
                        }
                        if (bally >= ZeeCanvas.height) { yv = -yv } // if bottom wall hit
                        if (bally <= 0) { yv = -yv } // if top wall hit
                        if (((P1y - 3 <= bally) && (bally <= P1y + 193)) && ((ballx >= P1x) && (ballx <= P1x + 15))) {
                            // |if ball hit by P1|
                            yv = (bally - (P1y + 50)) * 0.35;
                            xv = -xv;
                        }
                        if (((P2y - 3 <= bally) && (bally <= P2y + 193)) && ((ballx >= P2x) && (ballx <= P2x + 15))) {
                            // |if ball hit by P1|
                            yv = (bally - (P2y + 50)) * 0.35;
                            xv = -xv;
                        }   
                    }

                    function drawAll() {

                        rect(0, 0, ZeeCanvas.width, ZeeCanvas.height, "rgba(55,55,55,0.25)", 3, 'black');
                        
                        rect(P1x, P1y, 20, 100, 'white', 5, 'black');
                        rect(P2x, P2y, 20, 100, 'white', 5, 'black');
                        dottedLine();
                        circle(ballx, bally, 10, 'blue');
                        ctx.font = "50px Arial";
                        ctx.fillText(P1Score, ZeeCanvas.width / 4, 50);
                        ctx.fillText(P2Score, (ZeeCanvas.width * 3) / 4, 50);
                    }

                    function rect(x, y, length, width, Color1, LineWidth, Color2) {
                        ctx.beginPath();
                        ctx.rect(x, y, length, width);
                        ctx.fillStyle = Color1;
                        ctx.fill();
                        ctx.lineWidth = LineWidth;
                        ctx.strokeStyle = Color2;
                        ctx.stroke();
                    }

                    function circle(x, y, radius, brushColor)
                    {
                        ctx.beginPath();
                        ctx.fillStyle = brushColor;
                        ctx.arc(x, y, radius, 0, Math.PI*2);
                        ctx.fill();

                    }

                    function dottedLine() {
                        for (var i = 10; i < ZeeCanvas.height; i += 40) {
                            rect(ZeeCanvas.width / 2 - 1, i, 2, 20, "white", 1, "white");
                        } 
                    }


                </script>
        </div>
    </form>
</body>
</html>
