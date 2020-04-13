#include "myLib.h"
#include "game.h"
#include "buzz.h"

int direction;

//player animation states
enum {PLAYERRIGHT, PLAYERLEFT, PLAYERUP, PLAYERDOWN, PLAYERIDLE};

//balloon states
enum {SINGLE, AOE};

//global variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
PLAYER player;
BALLOON balloons[MAXBALLOONS];
int remainingEnemies;
int numBalloons;

//game functions-------------------------
void initGame() {
    vOff = 96;
    hOff = 0;
    direction = RIGHT; 
    remainingEnemies = MAXBEES;
    numBalloons = 0;
    REG_BG0VOFF = vOff;
    REG_BG1VOFF = vOff;
    initPlayer();
    initBuzz();
    initBalloons();
}

void updateGame() {
    int numActiveBalloons = 0;

    updatePlayer();
    for (int i = 0; i < MAXBEES; i++) {
        updateBuzz(&bees[i]);
    }
    for (int i = 0; i < MAXBALLOONS; i++) {
        updateBalloons(&balloons[i]);
        if (balloons[i].active) {
            numActiveBalloons++;
        }
    }
    if (numActiveBalloons < MAXBALLOONS) {
        for (int i = 0; i < MAXBALLOONS; i++) {
            if (!balloons[i].active) {
                balloons[i].active = 1;
                balloons[i].held = 1;
                break;
            } 
        }
    }
}

void drawGame() {
    drawPlayer();
    for (int i = 0; i < MAXBEES; i++) {
        drawBuzz(&bees[i]);
    }
    for (int i = 0; i < MAXBALLOONS; i++) {
        drawBalloons(&balloons[i]);
    }
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff/2;
}



//player functions----------------------------
void initPlayer() {
    player.height = 30;
    player.width = 20;
    player.colDelta = 2;
    player.rowDelta = 2;
    player.worldCol = 10;
    player.worldRow = MAPHEIGHT - player.height - 14;
    player.prevWorldCol = player.worldCol;

    player.upLimit = player.worldRow - 100;
    player.downLimit = player.worldRow;

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

    player.jumping = 0;
    player.crouching = 0;

    player.balloonTimer = 0;

    //change later to more health
    player.health = 10;

    //player animation
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 4;
    player.aniState = PLAYERRIGHT;
}

void animatePlayer() {
    player.prevAniState = player.aniState; 
    player.aniState = PLAYERIDLE;

    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if(BUTTON_HELD(BUTTON_LEFT)) {
        player.aniState = PLAYERLEFT;
        direction = LEFT;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        player.aniState = PLAYERRIGHT;
        direction = RIGHT;
    }
    if(BUTTON_HELD(BUTTON_UP)) {
        if (direction == RIGHT) {
            player.aniState = PLAYERRIGHT;
        }
        if (direction == LEFT) {
            player.aniState = PLAYERLEFT;
        }
        player.curFrame = 4;
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (direction == RIGHT) {
            player.aniState = PLAYERRIGHT;
        }
        if (direction == LEFT) {
            player.aniState = PLAYERLEFT;
        }
        player.curFrame = 5;
    } 
    

    if (player.aniState == PLAYERIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

void drawPlayer() {
    shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.curFrame * 4) | ATTR2_PALROW(0); 
}

void updatePlayer() {
    player.prevWorldCol = player.worldCol;

    //change MAPWIDTH value in game.h to make map longer
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol + player.width - 1 < MAPWIDTH) {
            player.worldCol += player.colDelta; 
            
            if (hOff + 1 < MAPWIDTH - SCREENWIDTH && player.screenCol > SCREENWIDTH/4) {
                hOff += player.colDelta;
            }
        }
    }

    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.worldCol >= 0) {
            player.worldCol -= player.colDelta;

            if (hOff - 1 >= 0 && player.screenCol < SCREENWIDTH/4) {
                hOff -= player.colDelta;
            }
        }
    }

    if(BUTTON_HELD(BUTTON_DOWN)) {
        player.crouching = 1;
        player.height = 22;
        player.worldCol = player.prevWorldCol;
    } else {
        player.crouching = 0;
        player.height = 30;
    }
   
    if(BUTTON_HELD(BUTTON_UP)) {
         if (player.worldRow >= player.downLimit) {
            player.jumping = 1;
        }
    } else {
        player.jumping = 0;
    }  

    //player balloon attack
    if(BUTTON_PRESSED(BUTTON_A) && player.balloonTimer >= 10) {
        playerAttack();
        player.balloonTimer = 0;
    }
    player.balloonTimer++;
 

    //player taunts
    if(BUTTON_PRESSED(BUTTON_B)) {
        for (int i = 0; i < MAXBEES; i++) {
            if (bees[i].active && bees[i].screenCol >= 0 && bees[i].screenCol < 240) {
                bees[i].state = ANGRY;
            }
        }
    }

    //gravity-ish
    if (!player.jumping && player.worldRow < player.downLimit) {
        player.worldRow += player.rowDelta;
    }
    if (player.jumping) {
        player.worldRow -= player.rowDelta;
        if (player.worldRow <= player.upLimit) {
            player.jumping = 0;
        }
    }

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

    animatePlayer();
}

void playerAttack() {
    for (int i = 0; i < MAXBALLOONS; i++) {
        if (balloons[i].active && balloons[i].held) {
            balloons[i].held = 0;
            break;
        }
    }
    // for (int i = 0; i < MAXBALLOONS; i++) {
    //     if (!balloons[i].active) {
    //         balloons[i].active = 1;
    //         balloons[i].held = 1;
    //         break;
    //     } 
    // }
}





//balloon functions---------------------------------------
void initBalloons() {
    for (int i = 0; i < MAXBALLOONS; i++) {
        balloons[i].width = 12;
        balloons[i].height = 16;
        balloons[i].type = SINGLE;
        balloons[i].colDelta = player.colDelta;
        balloons[i].rowDelta = player.rowDelta;
        balloons[i].held = 0;
        balloons[i].active = 0;
        balloons[i].num = i;

        balloons[i].worldCol = player.worldCol + 16;
        balloons[i].worldRow = player.worldRow;
        balloons[i].screenCol = balloons[i].worldCol - hOff;
        balloons[i].screenRow = balloons[i].worldRow - vOff;

        balloons[i].prevWorldCol = balloons[i].worldCol;
        balloons[i].prevWorldRow = balloons[i].worldRow;

        if (i == 0) {
            balloons[i].active = 1;
            balloons[i].held = 1;
        }
    }
}

void updateBalloons(BALLOON *balloon) {
    if (balloon->active) {
        if (balloon->screenCol < 0 || balloon->screenCol >= 240) {
            balloon->active = 0;
            balloon->held = 0;
            balloon->worldCol = player.worldCol + 16;
            balloon->worldRow = player.worldRow;
            balloon->prevWorldCol = balloon->worldCol;
            balloon->prevWorldRow = balloon->worldRow;
        } else {
            balloon->prevWorldCol = balloon->worldCol;
            balloon->prevWorldRow = balloon->worldRow;

            if (balloon->held) {
                updateHeldBalloon(balloon);
            } else if (!balloon->held) {
                balloon->worldCol = balloon->prevWorldCol;
                balloon->worldRow = balloon->prevWorldRow;
            }
        }
    }

    balloon->screenCol = balloon->worldCol - hOff;
    balloon->screenRow = balloon->worldRow - vOff;
}

void drawBalloons(BALLOON *balloon) {
     if (balloon->active) {
        shadowOAM[10 + balloon->num].attr0 = (ROWMASK & balloon->screenRow) | ATTR0_SQUARE;
        shadowOAM[10 + balloon->num].attr1 = (COLMASK & balloon->screenCol) | ATTR1_SMALL;
        shadowOAM[10 + balloon->num].attr2 = ATTR2_TILEID(0, 24) | ATTR2_PALROW(0); 
    } else {
        shadowOAM[10 + balloon->num].attr0 = ATTR0_HIDE;
    }
}

void updateHeldBalloon(BALLOON *balloon) {
    if (balloon->held && balloon->active) {
        if (player.aniState == PLAYERRIGHT) {
            switch(player.curFrame) {
                case 0:
                    balloon->worldCol = player.worldCol + 16;
                    balloon->worldRow = player.worldRow;
                    break;
                case 1:
                    balloon->worldCol = player.worldCol + 18;
                    balloon->worldRow = player.worldRow;
                    break;
                case 2:
                    balloon->worldCol = player.worldCol + 18;
                    balloon->worldRow = player.worldRow - 6;
                    break;
                case 3:
                    balloon->worldCol = player.worldCol + 16;
                    balloon->worldRow = player.worldRow;
                    break;
                case 4:
                    balloon->worldCol = player.worldCol + 18;
                    balloon->worldRow = player.worldRow - 6;
                    break;
                case 5:
                    balloon->worldCol = player.worldCol + 13;
                    balloon->worldRow = player.worldRow + 16;
                    break;
            }
        }

        if (player.aniState == PLAYERLEFT) {
            switch(player.curFrame) {
                case 0:
                    balloon->worldCol = player.worldCol;
                    balloon->worldRow = player.worldRow;
                    break;
                case 1:
                    balloon->worldCol = player.worldCol - 2;
                    balloon->worldRow = player.worldRow;
                    break;
                case 2:
                    balloon->worldCol = player.worldCol - 2;
                    balloon->worldRow = player.worldRow - 6;
                    break;
                case 3:
                    balloon->worldCol = player.worldCol;
                    balloon->worldRow = player.worldRow;
                    break;
                case 4:
                    balloon->worldCol = player.worldCol - 2;
                    balloon->worldRow = player.worldRow - 6;
                    break;
                case 5:
                    balloon->worldCol = player.worldCol + 3;
                    balloon->worldRow = player.worldRow + 16;
                    break;
            }
        }
    }
}

