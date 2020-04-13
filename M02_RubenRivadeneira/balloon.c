#include "myLib.h"
#include "balloon.h"
#include "game.h"
#include "player.h"


BALLOON balloons[MAXBALLOONS];

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

