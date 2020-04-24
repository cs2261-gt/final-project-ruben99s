#include "myLib.h"
#include "queenBee.h"
#include "game2.h"
#include "player.h"
#include "sound.h"
#include "fastGame2.h"
#include "calmGame2.h"
#include "balloon.h"
#include "buzz.h"
#include "Pop.h"

void updateStingerPosition(STINGER *stinger);

QUEENBEE queenBee;
STINGER stingers[MAXSTINGERS];

int queenBeeSpawned = 0;
// int queenBeeDead = 0;
int attackTimer;

void initQueenBee() {
    queenBee.height = 64;
    queenBee.width = 64;
    queenBee.worldRow = 231 - queenBee.height;
    queenBee.worldCol = 394;
    queenBee.screenRow = queenBee.worldRow - vOff;
    queenBee.colDelta = 1;
    queenBee.rowDelta = 1;
    queenBee.health = 500;
    queenBee.direction = LEFT;
    queenBee.aniState = 16;
    queenBee.curFrame = 0;
    queenBee.active = 0;
    queenBee.erased = 0;

    attackTimer = 0;

    initStingers();
}

void initStingers() {
    for (int i = 0; i < MAXSTINGERS; i++) {
        stingers[i].height = 5;
        stingers[i].width = 16;
        stingers[i].worldCol = queenBee.worldCol;
        stingers[i].worldRow = queenBee.worldRow + 64;
        stingers[i].screenCol = stingers[i].worldCol - hOff;
        stingers[i].screenRow = stingers[i].worldRow - vOff;
        stingers[i].colDelta = 2;
        stingers[i].active = 0;
        stingers[i].curFrame = 30;
        stingers[i].num = i;
    }
}

void updateQueenBee(const unsigned short *bitmap) {
    int screenCol = queenBee.worldCol - hOff;
    if (screenCol >= 0 && screenCol < 240 && !queenBee.erased) {
        if (!queenBeeSpawned) {
            stopSound();
            playSoundA(fastGame2, FASTGAME2LEN, 1);
            queenBeeSpawned = 1;
        }
        queenBee.active = 1;
        queenBee.screenCol = screenCol;
    }

    if (queenBee.active && queenBee.health <= 0) {
        queenBee.active = 0;
        queenBee.erased = 1;
        // queenBeeDead = 1;
        remainingEnemiesL2--;
    }

    // if (queenBee.erased && queenBeeDead) {
    //     stopSound();
    //     playSoundA(calmGame2, CALMGAME2LEN, 1);
    //     queenBeeDead = 0;
    // }

    if (queenBee.active) {
        // if (player.worldCol >= 320 && player.worldCol <= queenBee.worldCol) {
        //     queenBee.direction = LEFT;
        // } else if (player.worldCol > queenBee.worldCol) {
        //     queenBee.direction = RIGHT;
        // }

        if (player.worldCol <= queenBee.worldCol) {
            queenBee.direction = LEFT;
        } else if (player.worldCol > queenBee.worldCol) {
            queenBee.direction = RIGHT;
        }

        if (queenBee.direction == LEFT) {
            if (bitmap[OFFSET(queenBee.worldCol - 1, queenBee.worldRow, MAPWIDTH)] &&
                bitmap[OFFSET(queenBee.worldCol - 1, queenBee.worldRow + queenBee.height - 1, MAPWIDTH)]) {
                
                queenBee.worldCol -= queenBee.colDelta;

            } 
        } else if (queenBee.direction == RIGHT) {
            if (bitmap[OFFSET(queenBee.worldCol + queenBee.width - 1 + 1, queenBee.worldRow, MAPWIDTH)] &&
                bitmap[OFFSET(queenBee.worldCol + queenBee.width - 1 + 1, queenBee.worldRow + queenBee.height - 1, MAPWIDTH)]) {
                
                queenBee.worldCol += queenBee.colDelta;

            } 
        }

        //queenBee shoots stinger
        if (attackTimer % 100 == 0) {
            attackQueenBee();
            attackTimer = 0;
        }
        attackTimer++;

        //collision with balloons
        for (int i = 0; i < MAXBALLOONS * 2 + 2; i++) { 
            if (allBalloons[i].active && !allBalloons[i].held) {
                if (collision(allBalloons[i].worldCol, allBalloons[i].worldRow, allBalloons[i].width, allBalloons[i].height, 
                queenBee.worldCol, queenBee.worldRow, queenBee.width, queenBee.height)) {

                    playSoundB(pop, POPLEN, 0);
                    
                    if (allBalloons[i].type == SINGLE) { 
                        queenBee.health -= 100;
                    }
                    if (allBalloons[i].type == AOE) { 
                        //a data structure that allows for O(1) lookup of bees coordinates
                        int rightLimit = allBalloons[i].worldCol + allBalloons[i].width + allBalloons[i].radius;
                        int leftLimit = allBalloons[i].worldCol - allBalloons[i].radius;
                        for (int i = 0; i < MAXBEES; i++) {
                            if (bees[i].worldCol >= leftLimit && bees[i].worldCol < rightLimit) {
                                bees[i].health -= 34;
                            }
                        }
                        queenBee.health -= 34;
                    }
                    
                    allBalloons[i].active = 0; 
                    
                }
            }   
        }

        
    }

    queenBee.screenCol = queenBee.worldCol - hOff;
    queenBee.screenRow = queenBee.worldRow - vOff;
    animateQueenBee();

    for (int i = 0; i < MAXSTINGERS; i++) {
        updateStingers(&stingers[i]);
    }
    
}

void drawQueenBee() {
    if (queenBee.active) {
        shadowOAM[70].attr0 = (ROWMASK & queenBee.screenRow) | ATTR0_SQUARE;
        shadowOAM[70].attr1 = (COLMASK & queenBee.screenCol) | ATTR1_LARGE;
        shadowOAM[70].attr2 = ATTR2_TILEID(queenBee.aniState, queenBee.curFrame) | ATTR2_PALROW(0); 
    } else {
        shadowOAM[70].attr0 = ATTR0_HIDE;
    }

    for (int i = 0; i < MAXSTINGERS; i++) {
        drawStingers(&stingers[i]);
    }
}

void drawStingers(STINGER *stinger) {
    if (stinger->active) {
        shadowOAM[71 + stinger->num].attr0 = (ROWMASK & stinger->screenRow) | ATTR0_WIDE;
        shadowOAM[71 + stinger->num].attr1 = (COLMASK & stinger->screenCol) | ATTR1_TINY;
        shadowOAM[71 + stinger->num].attr2 = ATTR2_TILEID(0, stinger->curFrame) | ATTR2_PALROW(0); 
    } else {
        shadowOAM[71 + stinger->num].attr0 = ATTR0_HIDE;
    }
}

void animateQueenBee() {
    if (queenBee.direction == LEFT) {
        queenBee.aniState = 16;
    } else if (queenBee.direction == RIGHT) {
        queenBee.aniState = 24;
    }
}

void attackQueenBee() {
    for (int i = 0; i < MAXSTINGERS; i++) {
        if (!stingers[i].active) {
            stingers[i].active = 1;
            updateStingerPosition(&stingers[i]);
            break;
        }
    }
}

void updateStingers(STINGER *stinger) {
    if (stinger->active) {
        if (stinger->direction == LEFT) {
            if ((stinger->origWorldCol - stinger->worldCol) <= 150) {
                stinger->worldCol += stinger->colDelta;
            } else {
                stinger->active = 0;
            }
        } else if (stinger->direction == RIGHT) {
            if ((stinger->worldCol - stinger->origWorldCol) <= 150) {
                stinger->worldCol += stinger->colDelta;
            } else if (stinger->worldCol > 512) {
                stinger->active = 0;
            } else {
                stinger->active = 0;
            }
        }

        if (collision(stinger->worldCol, stinger->worldRow, stinger->width, stinger->height, 
            player.worldCol, SHIFTDOWN(player.worldRow), player.width, player.height)) {
            stinger->active = 0;
            player.health -= 10;
            updateHearts();
        }

        stinger->screenCol = stinger->worldCol - hOff;
        stinger->screenRow = stinger->worldRow - vOff;
    }
}

void updateStingerPosition(STINGER *stinger) {
    if (queenBee.direction == LEFT) {
        stinger->direction = LEFT;
        stinger->worldCol = queenBee.worldCol;
        stinger->worldRow = queenBee.worldRow + 64;
        stinger->colDelta = -2;
        stinger->curFrame = 30;
    } else if (queenBee.direction == RIGHT) {
        stinger->direction = RIGHT;
        stinger->worldCol = queenBee.worldCol + 64;
        stinger->worldRow = queenBee.worldRow + 64;
        stinger->colDelta = 2;
        stinger->curFrame = 31;
    }

    stinger->origWorldCol = stinger->worldCol;
    stinger->origWorldRow = stinger->worldRow;
}