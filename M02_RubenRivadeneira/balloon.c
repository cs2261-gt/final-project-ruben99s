#include "myLib.h"
#include "balloon.h"
#include "game.h"
#include "player.h"
#include "game1.h"
#include "game2.h" 


// BALLOON balloons[MAXBALLOONS];
// BALLOON balloonsAOE[MAXBALLOONS];
// BALLOON jumpBalloon;
// BALLOON cheatBalloon; 

BALLOON allBalloons[MAXBALLOONS * 2 + 2];

void initBalloons() { 
    //initializes single damage balloons
    initBalloonsSingle();
    initBalloonsAOE();
    initJumpBalloon();
    initCheatBalloon();
    
}

void initBalloonsSingle() {
    for (int i = 0; i < MAXBALLOONS; i++) { 
        allBalloons[i].width = 12;
        allBalloons[i].height = 16;
        allBalloons[i].type = SINGLE;
        allBalloons[i].colDelta = player.colDelta;
        allBalloons[i].rowDelta = player.rowDelta; 
        allBalloons[i].held = 0;
        allBalloons[i].active = 0;
        allBalloons[i].num = i;

        allBalloons[i].worldCol = player.worldCol + 16;
        allBalloons[i].worldRow = player.worldRow;
        allBalloons[i].screenCol = allBalloons[i].worldCol - hOff;
        allBalloons[i].screenRow = allBalloons[i].worldRow - vOff;

        allBalloons[i].prevWorldCol = allBalloons[i].worldCol;
        allBalloons[i].prevWorldRow = allBalloons[i].worldRow;

        allBalloons[i].aniState = 0;
        allBalloons[i].curFrame = 24;
        allBalloons[i].aniCounter = 0;
        allBalloons[i].numFrames = 3;

        if (i == 0) {
            allBalloons[i].active = 1;
            allBalloons[i].held = 1;
        }
    }
}

void initBalloonsAOE() {
    for (int i = MAXBALLOONS; i < MAXBALLOONS * 2; i++) { 
        allBalloons[i].width = 12;
        allBalloons[i].height = 16;
        allBalloons[i].type = AOE;
        allBalloons[i].colDelta = player.colDelta;
        allBalloons[i].rowDelta = player.rowDelta; 
        allBalloons[i].held = 0;
        allBalloons[i].active = 0;
        allBalloons[i].num = i;

        allBalloons[i].radius = 50;

        allBalloons[i].worldCol = player.worldCol + 16;
        allBalloons[i].worldRow = player.worldRow;
        allBalloons[i].screenCol = allBalloons[i].worldCol - hOff;
        allBalloons[i].screenRow = allBalloons[i].worldRow - vOff;

        allBalloons[i].prevWorldCol = allBalloons[i].worldCol;
        allBalloons[i].prevWorldRow = allBalloons[i].worldRow;

        allBalloons[i].aniState = 2;
        allBalloons[i].curFrame = 24;
        allBalloons[i].aniCounter = 0;
        allBalloons[i].numFrames = 3;

        if (i == MAXBALLOONS) {
            allBalloons[i].active = 1;
            allBalloons[i].held = 1;
        }
    }
}

void initJumpBalloon() {
    allBalloons[10].width = 12;
    allBalloons[10].height = 16;
    allBalloons[10].type = JUMP; 
    allBalloons[10].colDelta = player.colDelta;
    allBalloons[10].rowDelta = player.rowDelta;
    allBalloons[10].held = 1;
    allBalloons[10].active = 1;
    allBalloons[10].num = 10;
    
    allBalloons[10].worldCol = player.worldCol + 16;
    allBalloons[10].worldRow = player.worldRow;
    allBalloons[10].screenCol = allBalloons[10].worldCol - hOff;
    allBalloons[10].screenRow = allBalloons[10].worldRow - vOff;

    allBalloons[10].aniState = 4;
    allBalloons[10].curFrame = 24;
    allBalloons[10].aniCounter = 0;
    allBalloons[10].numFrames = 3;
}

void initCheatBalloon() {
    allBalloons[11].width = 12;
    allBalloons[11].height = 16;
    allBalloons[11].type = CHEAT; 
    allBalloons[11].colDelta = player.colDelta;
    allBalloons[11].rowDelta = player.rowDelta;
    allBalloons[11].held = 1;
    allBalloons[11].active = 1; 
    allBalloons[11].num = 11;
    
    allBalloons[11].worldCol = player.worldCol + 16;
    allBalloons[11].worldRow = player.worldRow;
    allBalloons[11].screenCol = allBalloons[11].worldCol - hOff;
    allBalloons[11].screenRow = allBalloons[11].worldRow - vOff;

    allBalloons[11].aniState = 6;
    allBalloons[11].curFrame = 24;
    allBalloons[11].aniCounter = 0;
    allBalloons[11].numFrames = 3;
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
                // balloon->worldCol = balloon->prevWorldCol;
                // balloon->worldRow = balloon->prevWorldRow;
                updateDropBalloon(balloon); 
            }
        }
    }

    balloon->screenCol = balloon->worldCol - hOff;
    balloon->screenRow = balloon->worldRow - vOff;

    animateBalloons(balloon);
}

void drawBalloons(BALLOON *balloon) {
    if (balloon->active) {
        shadowOAM[1 + balloon->num].attr0 = (ROWMASK & balloon->screenRow) | ATTR0_SQUARE;
        shadowOAM[1 + balloon->num].attr1 = (COLMASK & balloon->screenCol) | ATTR1_SMALL;
        shadowOAM[1 + balloon->num].attr2 = ATTR2_TILEID(balloon->aniState, balloon->curFrame) | ATTR2_PALROW(0); 
    } else {
        shadowOAM[1 + balloon->num].attr0 = ATTR0_HIDE;
    }
}

void updateHeldBalloon(BALLOON *balloon) {
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

void updateDropBalloon(BALLOON *balloon) {
    balloon->worldCol = balloon->prevWorldCol;
    balloon->worldRow = balloon->prevWorldRow; 
}

void animateBalloons(BALLOON *balloon) {
    if (balloon->active) {
        if (balloon->aniCounter % 10 == 0) {
            balloon->curFrame = (balloon->curFrame - 24 + 2) % (balloon->numFrames * 2) + 24;
        }
        balloon->aniCounter++;
    }
}
