#include "myLib.h"
#include "queenBee.h"
#include "game2.h"
#include "player.h"

QUEENBEE queenBee;
STINGER stingers[MAXSTINGERS];

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
        queenBee.active = 1;
        queenBee.screenCol = screenCol;
    }

    if (queenBee.active && queenBee.health <= 0) {
        queenBee.active = 0;
        queenBee.erased = 1;
        remainingEnemiesL2--;
    }

    if (queenBee.active) {
        if (player.worldCol <= queenBee.worldCol) {
            queenBee.direction = LEFT;
        } else {
            queenBee.direction = RIGHT;
        }

        if (queenBee.direction == LEFT) {
            if (bitmap[OFFSET(queenBee.worldCol - 1, queenBee.worldRow, MAPWIDTH)] &&
                bitmap[OFFSET(queenBee.worldCol - 1, queenBee.worldRow + queenBee.height - 1, MAPWIDTH)]) {
                
                queenBee.worldCol -= queenBee.colDelta;

            } else {
                queenBee.direction = RIGHT;
            }
        } else if (queenBee.direction == RIGHT) {
            if (bitmap[OFFSET(queenBee.worldCol + queenBee.width - 1 + 1, queenBee.worldRow, MAPWIDTH)] &&
                bitmap[OFFSET(queenBee.worldCol + queenBee.width - 1 + 1, queenBee.worldRow + queenBee.height - 1, MAPWIDTH)]) {
                
                queenBee.worldCol += queenBee.colDelta;

            } else {
                queenBee.direction = LEFT;
            }
        }
    }

    queenBee.screenCol = queenBee.worldCol - hOff;
    queenBee.screenRow = queenBee.worldRow - vOff;
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
        shadowOAM[71 + stinger->num].attr0 = (ROWMASK & stinger->screenRow) | ATTR0_SQUARE;
        shadowOAM[71 + stinger->num].attr1 = (COLMASK & stinger->screenCol) | ATTR1_MEDIUM;
        shadowOAM[71 + stinger->num].attr2 = ATTR2_TILEID(0, stinger->curFrame) | ATTR2_PALROW(0); 
    } else {
        shadowOAM[71 + stinger->num].attr0 = ATTR0_HIDE;
    }
}