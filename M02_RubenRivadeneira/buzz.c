#include "myLib.h"
#include "buzz.h"
#include "game.h"
#include "player.h"
#include "balloon.h"

//global variables
BUZZ bees[MAXBEES];

void initBuzz() {
    for (int i = 0; i < MAXBEES; i++) {
        bees[i].height = 20;
        bees[i].width = 23;
        bees[i].active = 0;
        bees[i].state = CALM;
        bees[i].direction = LEFT;
        bees[i].colDelta = 1;
        bees[i].rowDelta = 1;
        bees[i].num = i;
        bees[i].erased = 0;

        bees[i].worldRow = MAPHEIGHT - 33 - bees[i].height;
        bees[i].worldCol = SCREENWIDTH + (30 * i);
        bees[i].screenRow = bees[i].worldRow - vOff;
        // enemies[i].screenCol = enemies[i].worldCol - hOff;

        bees[i].rightLimit = bees[i].worldCol + bees[i].width + 35;
        bees[i].leftLimit = bees[i].worldCol - 35;

        bees[i].aniState = 3;        
    }
}

void drawBuzz(BUZZ *buzz) {
    if (buzz->active) {
        shadowOAM[1 + buzz->num].attr0 = (ROWMASK & buzz->screenRow) | ATTR0_SQUARE;
        shadowOAM[1 + buzz->num].attr1 = (COLMASK & buzz->screenCol) | ATTR1_MEDIUM;
        shadowOAM[1 + buzz->num].attr2 = ATTR2_TILEID(buzz->aniState * 4, 0 * 4) | ATTR2_PALROW(0); 
    } else {
        shadowOAM[1 + buzz->num].attr0 = ATTR0_HIDE;
    }
}

void updateBuzz(BUZZ *buzz) {
    int screenCol = buzz->worldCol - hOff;
    if (screenCol >= 0 && screenCol < 240 && !buzz->erased) {
        buzz->screenCol = screenCol;
        buzz->active = 1;
    } 

    if (buzz->active) {
        //behavior when buzz is calm, just goes back and forth
        if (buzz->state == CALM) {
            if (buzz->direction == LEFT) {
                if (buzz->worldCol > buzz->leftLimit) {
                    buzz->worldCol -= buzz->colDelta;
                } else {
                    buzz->direction = RIGHT;
                }
            }

            if (buzz->direction == RIGHT) {
                if (buzz->worldCol < buzz->rightLimit) {
                    buzz->worldCol += buzz->colDelta;
                } else {
                    buzz->direction = LEFT;
                }
            }
        }

        //behavior when buzz is angry, chases player
        if (buzz->state == ANGRY) {
            if (player.worldCol <= buzz->worldCol) {
                buzz->direction = LEFT;
            } else {
                buzz->direction = RIGHT;
            }
            
            if (buzz->direction == LEFT) {
                buzz->worldCol -= buzz->colDelta;
            }
            if (buzz->direction == RIGHT) {
                buzz->worldCol += buzz->colDelta;
            }
        }

        //collision with floating balloons
        for (int i = 0; i < MAXBALLOONS; i++) {
            if (balloons[i].active && !balloons[i].held) {
                if (collision(balloons[i].worldCol, balloons[i].worldRow, balloons[i].width, balloons[i].height, 
                buzz->worldCol, buzz->worldRow, buzz->width, buzz->height)) {
                    balloons[i].active = 0;
                    buzz->active = 0;
                    buzz->erased = 1;
                    remainingEnemies--;
                }
            }   
        } 

        //collision with player
        if (collision(player.worldCol, player.worldRow, player.width, player.height, 
            buzz->worldCol, buzz->worldRow, buzz->width, buzz->height)) {
                player.health = 0;
        }
        //TODO: needs to be changed to damage over time instead of insta kill

        //if player enters buzz space then buzz gets angry
        if (player.worldCol >= buzz->leftLimit && player.worldCol <= buzz->rightLimit) {
            buzz->state = ANGRY;
        }
    }

    buzz->screenCol = buzz->worldCol - hOff;
    buzz->screenRow = buzz->worldRow - vOff;
    animateBuzz(buzz);
}

void animateBuzz(BUZZ *buzz) {
    if (buzz->active) {
        if (buzz->direction == LEFT) {
            buzz->aniState = 3;
        }
        if (buzz->direction == RIGHT) {
            buzz->aniState = 2;
        }
    }
}