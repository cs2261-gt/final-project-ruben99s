#include "myLib.h"
#include "player.h"
#include "game.h"
#include "buzz.h"

PLAYER player;

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





