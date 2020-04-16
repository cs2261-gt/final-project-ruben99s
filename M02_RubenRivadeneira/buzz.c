#include "myLib.h"
#include "buzz.h"
#include "game.h"
#include "player.h"
#include "balloon.h"
#include "game1.h"

//global variables
BUZZ bees[MAXBEES];
int healthTimer;

void initBuzz() {
    healthTimer = 0; 
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
        bees[i].health = 100;

        bees[i].worldRow = MAPHEIGHT - 33 - bees[i].height;
        bees[i].worldCol = SCREENWIDTH + (30 * i);
        bees[i].screenRow = bees[i].worldRow - vOff;
        // enemies[i].screenCol = enemies[i].worldCol - hOff;

        bees[i].rightLimit = bees[i].worldCol + bees[i].width + 35;
        bees[i].leftLimit = bees[i].worldCol - 35;

        bees[i].aniState = 3;
        bees[i].curFrame = 0;         
    }
}

void drawBuzz(BUZZ *buzz) {
    if (buzz->active) {
        shadowOAM[37 + buzz->num].attr0 = (ROWMASK & buzz->screenRow) | ATTR0_SQUARE;
        shadowOAM[37 + buzz->num].attr1 = (COLMASK & buzz->screenCol) | ATTR1_MEDIUM;
        shadowOAM[37 + buzz->num].attr2 = ATTR2_TILEID(buzz->aniState * 4, buzz->curFrame * 4) | ATTR2_PALROW(0); 
    } else {
        shadowOAM[37 + buzz->num].attr0 = ATTR0_HIDE;
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
        for (int i = 0; i < MAXBALLOONS * 2 + 2; i++) { 
            if (allBalloons[i].active && !allBalloons[i].held) {
                if (collision(allBalloons[i].worldCol, allBalloons[i].worldRow, allBalloons[i].width, allBalloons[i].height, 
                buzz->worldCol, buzz->worldRow, buzz->width, buzz->height)) {

                    if (allBalloons[i].type == SINGLE) {
                        buzz->health -= 100;
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
                    }
                    
                    allBalloons[i].active = 0; 
                }
            }   
        } 

        if (buzz->health <= 0) {
            buzz->active = 0;
            buzz->erased = 1;
            remainingEnemies--;
        }

        //collision with player
        if (collision(player.worldCol, player.worldRow, player.width, player.height, 
            buzz->worldCol, buzz->worldRow, buzz->width, buzz->height)) {
                if (healthTimer % 250 == 0) {
                    player.health -= 5;
                    healthTimer = 0;
                }
                healthTimer++;
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
        // if (buzz->aniCounter % 20 == 0) {
        //     buzz->curFrame = (buzz->curFrame + 1) % buzz->numFrames;
        // }

        if (buzz->direction == LEFT) {
            buzz->aniState = 3;
        }
        if (buzz->direction == RIGHT) {
            buzz->aniState = 2;
        }

        if (buzz->state == ANGRY) {
            buzz->curFrame = 3;
        }

        // buzz->aniCounter++;
    }
}