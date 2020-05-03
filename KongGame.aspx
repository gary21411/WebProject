<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KongGame.aspx.cs" Inherits="WebProj.KongGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kong - Game</title>
    <link href="RegiStyler1.css" rel="stylesheet" />
    <script src="//cdn.jsdelivr.net/npm/phaser@3.11.0/dist/phaser.js"></script>
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
    <form id="form1" runat="server">
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
            <div>

            <script src="//cdn.jsdelivr.net/npm/phaser@3.11.0/dist/phaser.js"></script>
            <script>
                var config = {
                    type: Phaser.AUTO,
                    width: 448,
                    height: 512,
                    physics: {
                        default: 'arcade',
                        arcade: {
                            gravity: { y: 300 },
                            debug: false
                        }
                    },
                    scene: {
                        preload: preload,
                        create: create,
                        update: update
                    }
                };

                var game = new Phaser.Game(config);

                var gameOver = false;
                var Lives = 3;
                var PlayerPlatformC;
                var DkSkin

                function preload() {
                    this.load.image("firststage1", "DkGamePhotos/firstStagepart1.jpg");
                    this.load.image("firststage2", "DkGamePhotos/firstStagepart2.jpg");
                    this.load.image("firststage3", "DkGamePhotos/firstStagepart3.jpg");
                    this.load.image("firststage4", "DkGamePhotos/firstStagepart4.jpg");
                    this.load.image("firststage5", "DkGamePhotos/firstStagepart5.jpg");
                    this.load.image("firststage6", "DkGamePhotos/firstStagepart6.jpg");
                    this.load.image("firststage7", "DkGamePhotos/firstStagepart7.jpg");
                    this.load.image("firststage8", "DkGamePhotos/firstStagepart8.jpg");
                    this.load.image("firststage9", "DkGamePhotos/firstStagefinal.png");
                    this.load.image("plateform1", "DkGamePhotos/platforme1.png");
                    this.load.image("plateform2", "DkGamePhotos/platforme2.png");
                    this.load.image("plateform3", "DkGamePhotos/platforme2.png.jpg");
                    this.load.image("ladder1", "DkGamePhotos/ladder1.jpg");
                    this.load.image("ladder2", "DkGamePhotos/ladder2.jpg");
                    this.load.image("Barral1", "DkGamePhotos/Barral24X29.png");
                    this.load.image("Princess", "DkGamePhotos/Princess.png");
                    this.load.image("Dk1", "DkGamePhotos/Dk1.png"); 
                    this.load.image("Dk2", "DkGamePhotos/Dk2.png");
                    this.load.image("Dk3", "DkGamePhotos/Dk3.png");
                    this.load.spritesheet('dude', 'DkGamePhotos/dude.png', { frameWidth: 32, frameHeight: 48 });
                    this.load.spritesheet('DkSheet', 'DkGamePhotos/DkSpriteSheet.png', { frameWidth: 48, frameHeight: 42 });
                }
                
                function create() {
                    

                    platforms = this.physics.add.staticGroup();

                    // create's walking plateforms. |block start|
                    // -------------------------------------------|
                    platforms.create(113, 506, "plateform1");
                    platforms.create(242, 509, "plateform2");
                    platforms.create(274, 508, "plateform2");
                    platforms.create(305, 508, "plateform2");
                    platforms.create(336, 507, "plateform2");
                    platforms.create(368, 504, "plateform2");
                    platforms.create(401, 502, "plateform2");
                    platforms.create(433, 500, "plateform2");
                    platforms.create(401, 448, "plateform3");
                    platforms.create(368, 446, "plateform3");
                    platforms.create(336, 444, "plateform3");
                    platforms.create(305, 442, "plateform3");
                    platforms.create(274, 440, "plateform3");
                    platforms.create(242, 438, "plateform3");
                    platforms.create(210, 436, "plateform3");
                    platforms.create(178, 434, "plateform3");
                    platforms.create(146, 432, "plateform3");
                    platforms.create(114, 430, "plateform3");
                    platforms.create(82, 428, "plateform3");
                    platforms.create(50, 426, "plateform3");
                    platforms.create(18, 424, "plateform3");
                    platforms.create(50, 382, "plateform3");
                    platforms.create(401, 360, "plateform3");
                    platforms.create(368, 363, "plateform3");
                    platforms.create(336, 365, "plateform3");
                    platforms.create(305, 367, "plateform3");
                    platforms.create(274, 368, "plateform3");
                    platforms.create(242, 370, "plateform3");
                    platforms.create(210, 372, "plateform3");
                    platforms.create(178, 374, "plateform3");
                    platforms.create(146, 376, "plateform3");
                    platforms.create(114, 378, "plateform3");
                    platforms.create(82, 380, "plateform3");
                    platforms.create(433, 358, "plateform3");
                    platforms.create(400, 316, "plateform3");
                    platforms.create(369, 314, "plateform3");
                    platforms.create(336, 312, "plateform3");
                    platforms.create(305, 310, "plateform3");
                    platforms.create(274, 308, "plateform3");
                    platforms.create(242, 306, "plateform3");
                    platforms.create(210, 304, "plateform3");
                    platforms.create(178, 302, "plateform3");
                    platforms.create(146, 300, "plateform3");
                    platforms.create(114, 298, "plateform3");
                    platforms.create(82, 296, "plateform3");
                    platforms.create(50, 294, "plateform3");
                    platforms.create(18, 292, "plateform3");
                    platforms.create(50, 252, "plateform3");
                    platforms.create(401, 230, "plateform3");
                    platforms.create(368, 232, "plateform3");
                    platforms.create(336, 234, "plateform3");
                    platforms.create(305, 236, "plateform3");
                    platforms.create(274, 238, "plateform3");
                    platforms.create(242, 240, "plateform3");
                    platforms.create(210, 242, "plateform3");
                    platforms.create(178, 244, "plateform3");
                    platforms.create(146, 246, "plateform3");
                    platforms.create(114, 248, "plateform3");
                    platforms.create(82, 250, "plateform3");
                    platforms.create(433, 228, "plateform3");
                    platforms.create(400, 185, "plateform3");
                    platforms.create(370, 183, "plateform3");
                    platforms.create(338, 181, "plateform3");
                    platforms.create(306, 179, "plateform3");
                    platforms.create(274, 177, "plateform3");
                    platforms.create(242, 177, "plateform3");
                    platforms.create(210, 177, "plateform3");
                    platforms.create(178, 177, "plateform3");
                    platforms.create(146, 177, "plateform3");
                    platforms.create(114, 177, "plateform3");
                    platforms.create(82, 177, "plateform3");
                    platforms.create(50, 177, "plateform3");
                    platforms.create(17, 177, "plateform3");
                    platforms.create(258, 120, "plateform3");
                    platforms.create(226, 120, "plateform3");
                    platforms.create(194, 120, "plateform3");
                    // -------------------------------------------|
                    // create's walking plateforms. |block end|


                    //create's the ladders |block start|
                    
                    Ladders = this.physics.add.staticGroup();
                    Ladders.enableBody = true;
                    // --------------------------------------|
                    Ladders.create(378, 472, "ladder1");
                    Ladders.create(74, 405, "ladder1");
                    Ladders.create(74, 273, "ladder1");
                    Ladders.create(154, 275, "ladder1");
                    Ladders.create(266, 155, "ladder1");
                    Ladders.create(266, 145, "ladder1");
                    Ladders.create(379, 208, "ladder1");
                    Ladders.create(379, 338, "ladder1");
                    Ladders.create(185, 230, "ladder1");
                    Ladders.create(172, 515, "ladder2");                    
                    Ladders.create(235, 345, "ladder1");
                    Ladders.create(235, 333, "ladder1");
                    Ladders.create(203, 415, "ladder1");
                    Ladders.create(203, 400, "ladder1");
                    // --------------------------------------|
                    Ladders.children.iterate(function (Ladd) {
                        Ladd.body.immovable = true;
                    });
                    

                    //create's the ladders |block end|

                    

                    this.add.image(224, 256, "firststage9");

                    //create's the Barral Class |block start|
                    Barrals = this.physics.add.group();

                    
                    this.physics.add.collider(Barrals, platforms);

                    //spawn new Barral |start Block|

                    setInterval(function () {
                        CrateNewBarral();
                    }, 5000);

                    //spawn new Barral |end   Block|

                    //create's the Barral Class|block end|

                    // creating aminations (changing skins) |start|

                    this.anims.create({
                        key: 'left',
                        frames: this.anims.generateFrameNumbers('dude', { start: 0, end: 3 }),
                        frameRate: 10,
                        repeat: -1
                    });

                    this.anims.create({
                        key: 'nutral',
                        frames: [{ key: 'dude', frame: 4 }],
                        frameRate: 20
                    });

                    this.anims.create({
                        key: 'right',
                        frames: this.anims.generateFrameNumbers('dude', { start: 5, end: 8 }),
                        frameRate: 10,
                        repeat: -1
                    });
                    // what ever - |end|

                    Dk = this.physics.add.sprite(30, 0, 'Dk1');
                    DkSkin = 0;
                    setInterval(function () {
                        if (DkSkin == 0 || DkSkin == 2) {
                            Dk.setTexture('Dk1');
                        }
                        else if (DkSkin == 1) {
                            Dk.setTexture('Dk2');
                        }
                        else if (DkSkin == 3) {
                            Dk.setTexture('Dk3');
                            DkSkin = -1;
                        }
                        DkSkin++;
                    }, 333);
                    this.physics.add.collider(Dk, platforms);

                    princess = this.physics.add.sprite(190, 50, "Princess");
                    this.physics.add.collider(princess, platforms);

                    player = this.physics.add.sprite(80, 480, 'dude');

                    player.setScale(0.4);
                    player.setBounce(0.1);
                    player.setCollideWorldBounds(true);
                    player.body.gravity.y = 250;

                    PlayerPlatformC = this.physics.add.collider(player, platforms);
                    this.physics.add.collider(player, Barrals, BarralHits, null, this);

                    cursors = this.input.keyboard.createCursorKeys();

                }

                function update() {

                    if (((player.x >= princess.x) && (player.x <= princess.x + 50)) && ((player.y >= princess.y - 3) && (player.y <= princess.y + 3))) {
                        this.physics.pause();
                        this.add.text(150, 70, 'You Won, Good Job!.', { fontFamily: '"PressStart2P-vaV7.ttf"', fontSize: '24px' });
                    }

                    Barrals.children.iterate(function (barral) {
                         
                        if (barral.x >= 448) {
                            barral.setVelocityX(-100);
                        }
                        else if (barral.x <= 0) {
                            if (barral.y >= 450) {
                                
                                //barral.destroy();
                            }
                            else {
                                barral.setVelocityX(100);
                            }
                        }

                    });
                    


                    if (cursors.left.isDown) {
                        player.setVelocityX(-160);
                        player.anims.play('left', true);
                    }
                    else if (cursors.right.isDown) {
                        player.setVelocityX(160);
                        player.anims.play('right', true);
                    }
                    else {
                        player.setVelocityX(0);
                        player.anims.play('nutral', true);
                    }

                    if (cursors.up.isDown && player.body.touching.down) {

                        player.setVelocityY(-170);
                    }

                    Ladders.children.iterate(function (Ladd) {

                        if (((player.x <= Ladd.x + 17) && (player.x >= Ladd.x - 17)) && ((player.y <= Ladd.y - 43) && (player.y >= Ladd.y - 46))) {
                            PlayerPlatformC.active = true;
                            player.allowGravity = true;
                        }
                        else if (((player.x <= Ladd.x + 17) && (player.x >= Ladd.x - 17)) && ((player.y <= Ladd.y + 19) && (player.y >= Ladd.y - 43))) {


                            if (cursors.up.isDown) {
                                player.setVelocityY(-20);
                                platforms.children.iterate(function (Plate) {
                                    if (((player.x <= Plate.x + 31) && (player.x >= Plate.x - 31)) && ((player.y <= Plate.y + 21) && (player.y >= Plate.y - 21))) {
                                        PlayerPlatformC.active = false;
                                    }

                                });
                            }
                            else {
                                PlayerPlatformC.active = true;
                                player.setAllowGravity = false;
                            }
                            

                        }

                    });
                   
                    
                }

                function CrateNewBarral() {
                    barral = Barrals.create(70, 150, 'Barral1');
                    barral.setVelocityX(100);
                    barral.setScale(0.6);
                }

                function BarralHits() {
                    this.physics.pause();

                    player.setTint(0xff0000);
                    player.anims.play('turn');
                    this.add.text(150, 70, 'You Died, Game Over!.', { fontFamily: '"PressStart2P-vaV7.ttf"', fontSize: '24px'});                    
                }

                





            </script>
        </div>
    </form>
</body>
</html>
