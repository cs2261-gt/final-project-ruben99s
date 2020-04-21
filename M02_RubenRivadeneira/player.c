#include "myLib.h"
#include "player.h"
#include "game.h"
#include "buzz.h"
#include "balloon.h"
// #include "bg00CollisionMap.h"
#include "game1.h"
#include "game2.h"

PLAYER player;
HEART healthMeter[numHearts];
int lostHearts = 0;
 
void initPlayer(int *hOff, int *vOff, int level) {
    player.height = 30;
    player.width = 20; 
    player.colDelta = 2; 
    player.rowDelta = 2;
    player.worldCol = 10;
    player.worldRow = MAPHEIGHT - player.height - 14; 
    player.prevWorldCol = player.worldCol;

    player.upLimit = player.worldRow - 100;
    player.downLimit = player.worldRow;

    player.screenCol = player.worldCol - *hOff;
    player.screenRow = player.worldRow - *vOff;

    player.jumping = 0;
    player.crouching = 0;

    if (level == 0) {
        player.health = 100;
        initHearts();
    }

    player.balloonTimer = 0;
    player.balloonType = SINGLE;
    player.lastBalloonType = 4;
    player.highJumpLimit = 0;


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

    for (int i = 0; i < numHearts; i++) {
        drawHearts(&healthMeter[i]);
    }
}

void updatePlayer(const unsigned short *bitmap, int *hOff, int *vOff) {
    player.prevWorldCol = player.worldCol;

    //change MAPWIDTH value in game.h to make map longer
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol + player.width + 12 - 1 < MAPWIDTH) {

            if (bitmap[OFFSET(player.worldCol + player.width - 1 + 1, player.worldRow, MAPWIDTH)] &&
                bitmap[OFFSET(player.worldCol + player.width - 1 + 1, player.worldRow + player.height - 1, MAPWIDTH)]) {
                
                player.worldCol += player.colDelta;

            }
             
            
            if (*hOff + 1 < MAPWIDTH - SCREENWIDTH && player.screenCol > SCREENWIDTH/4) {
                *hOff += player.colDelta;
            }
        }
    }

    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.worldCol >= 6) {

            if (bitmap[OFFSET(player.worldCol - 1, player.worldRow, MAPWIDTH)] &&
                bitmap[OFFSET(player.worldCol - 1, player.worldRow + player.height - 1, MAPWIDTH)]) {
                
                player.worldCol -= player.colDelta;

            }

            if (*hOff - 1 >= 0 && player.screenCol < SCREENWIDTH/4) {
                *hOff -= player.colDelta;
            }
        }
    }

    if(BUTTON_HELD(BUTTON_DOWN)) {
        player.crouching = 1;
        // player.height = 22;
        player.worldCol = player.prevWorldCol;
    } else {
        player.crouching = 0;
        // player.height = 30;
    }
   




    if(BUTTON_HELD(BUTTON_UP)) {
        if (player.worldRow <= player.upLimit) {
            player.jumping = 0;
        } else {
            player.jumping = 1;
        }
        
        // if (player.worldRow >= player.downLimit) {
        //     player.jumping = 1;
        // }
        
    } else {
        player.jumping = 0;
    }  

    //allows to jump higher if balloon type is jump
    if (player.balloonType == JUMP) {
        player.upLimit = 90;
    } else {
        player.upLimit = 150;
    }

    //gravity-ish
    if (!player.jumping) {
        //falling down
        if (bitmap[OFFSET(player.worldCol, player.worldRow + player.height - 1 + player.rowDelta, MAPWIDTH)] &&
            bitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow + player.height - 1 + player.rowDelta, MAPWIDTH)]) {
            
            player.worldRow += player.rowDelta;
                
        }
    }
    if (player.jumping) {
        //going up
        if (bitmap[OFFSET(player.worldCol, player.worldRow - player.rowDelta, MAPWIDTH)] &&
            bitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow - player.rowDelta, MAPWIDTH)]) {
                
            player.worldRow -= player.rowDelta;
        }
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

    if (BUTTON_PRESSED(BUTTON_L)) {
        //shift to different balloon type
        if (player.balloonType == SINGLE) {
            for (int i = 0; i < MAXBALLOONS; i++) {
                allBalloons[i].active = 0;
                allBalloons[i].held = 0;
            }

            player.lastBalloonType = player.balloonType;
            player.balloonType = CHEAT;
            allBalloons[11].active = 1;
            allBalloons[11].held = 1;
        } else if (player.balloonType == CHEAT) {
            allBalloons[11].active = 0;
            allBalloons[11].held = 0;

            player.lastBalloonType = player.balloonType;
            player.balloonType = JUMP;
            allBalloons[10].active = 1;
            allBalloons[10].held = 1;
        } else if (player.balloonType == JUMP) {
            allBalloons[10].active = 0;
            allBalloons[10].held = 0;

            player.lastBalloonType = player.balloonType;
            player.balloonType = AOE;
            allBalloons[5].active = 1;
            allBalloons[5].held = 1;
        } else if (player.balloonType == AOE) {
            for (int i = MAXBALLOONS; i < MAXBALLOONS * 2; i++) {
                allBalloons[i].active = 0;
                allBalloons[i].held = 0;
            }

            player.lastBalloonType = player.balloonType; 
            player.balloonType = SINGLE;
            allBalloons[0].active = 1;
            allBalloons[0].held = 1;
        }
    }

    if (BUTTON_PRESSED(BUTTON_R)) {
        //shift to different balloon type in balloon pool
        if (player.balloonType == SINGLE) {
            for (int i = 0; i < MAXBALLOONS; i++) {
                allBalloons[i].active = 0;
                allBalloons[i].held = 0;
            }

            player.lastBalloonType = player.balloonType;
            player.balloonType = AOE;
            allBalloons[5].active = 1;
            allBalloons[5].held = 1;
        } else if (player.balloonType == AOE) {
            //comment out if you want balloons to be live even if type isn't selected, but buggy
            for (int i = MAXBALLOONS; i < MAXBALLOONS * 2; i++) {
                allBalloons[i].active = 0;
                allBalloons[i].held = 0;
            }

            player.lastBalloonType = player.balloonType;
            player.balloonType = JUMP;
            allBalloons[10].active = 1;
            allBalloons[10].held = 1;
        } else if (player.balloonType == JUMP) {
            allBalloons[10].active = 0;
            allBalloons[10].held = 0;

            player.lastBalloonType = player.balloonType;
            player.balloonType = CHEAT;
            allBalloons[11].active = 1;
            allBalloons[11].held = 1;
        } else if (player.balloonType == CHEAT) {
            allBalloons[11].active = 0;
            allBalloons[11].held = 0;

            player.lastBalloonType = player.balloonType;
            player.balloonType = SINGLE;
            allBalloons[0].active = 1;
            allBalloons[0].held = 1;
        }
    }


    

    player.screenCol = player.worldCol - *hOff;
    player.screenRow = player.worldRow - *vOff;

    animatePlayer();
    // updateHearts();
}

void playerAttack() {
    if (player.balloonType == SINGLE) {
        for (int i = 0; i < MAXBALLOONS; i++) {
            if (allBalloons[i].active && allBalloons[i].held) {
                allBalloons[i].held = 0;
                break; 
            } 
        }
    }
    if (player.balloonType == AOE) {
        for (int i = MAXBALLOONS; i < MAXBALLOONS * 2; i++) {
            if (allBalloons[i].active && allBalloons[i].held) {
                allBalloons[i].held = 0;
                break;
            }
        }
    }
}


void initHearts() {
    for (int i = 0; i < numHearts; i++) {
        healthMeter[i].num = i;
        healthMeter[i].width = 7;
        if (i % 2 == 0) {
            healthMeter[i].aniState = 4;
        } else {
            healthMeter[i].aniState = 6;
        }
        healthMeter[i].screenRow = 5;
        healthMeter[i].screenCol = 100 + (7 * i);
        healthMeter[i].active = 1;
    }
}

void drawHearts(HEART *heart) {
    if (heart->active) {
        shadowOAM[13 + heart->num].attr0 = (ROWMASK & heart->screenRow) | ATTR0_SQUARE;
        shadowOAM[13 + heart->num].attr1 = (COLMASK & heart->screenCol) | ATTR1_SMALL;
        shadowOAM[13 + heart->num].attr2 = ATTR2_TILEID(heart->aniState, 30) | ATTR2_PALROW(0); 
    } else {
        shadowOAM[13 + heart->num].attr0 = ATTR0_HIDE;
    }
}

void updateHearts() {
    if (player.health != 100) {
        lostHearts = 20 - (player.health / 5);

        for (int i = 0; i < lostHearts; i++) {
            healthMeter[i].active = 0;
        }
    }
}





