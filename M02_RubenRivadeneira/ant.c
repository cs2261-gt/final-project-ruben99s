#include "myLib.h"
#include "ant.h"
#include "game1.h"
#include "player.h"
#include "balloon.h"
#include "sound.h"
#include "Pop.h"

ANT ants[MAXANTS];
int healthTimer;

void initAnts() {
    healthTimer = 0;
    for (int i = 0; i < MAXANTS; i++) {
        ants[i].num = i;
        ants[i].height = 14;
        ants[i].width = 15;
        ants[i].colDelta = 1; 
        ants[i].rowDelta = 2;
        ants[i].health = 30;
        ants[i].direction = LEFT;
        ants[i].worldRow = 180;
        ants[i].worldCol = 110 + (ants[i].width * i);
        // ants[i].screenCol = ants[i].worldCol - hOff;
        ants[i].screenRow = ants[i].worldRow - vOff;

        ants[i].active = 0;
        ants[i].erased = 0;

        ants[i].aniCounter = 0;
        ants[i].aniState = 10;
        ants[i].curFrame = 24;
        ants[i].numFrames = 3;

    }
}

void updateAnts(ANT *ant, const unsigned short *bitmap) {
    int screenCol = ant->worldCol - hOff;
    if (screenCol >= 0 && screenCol < 240 && !ant->erased) {
        ant->screenCol = screenCol;
        ant->active = 1;
    }

    if (ant->active && ant->health <= 0) {
        ant->active = 0;
        ant->erased = 1;
        remainingEnemiesL1--;
    }

    if (ant->active) {
        //changed direction to chase player
        if (player.worldCol <= ant->worldCol) {
            ant->direction = LEFT;
        } else {
            ant->direction = RIGHT;
        }

        if (ant->direction == LEFT) {
            if (bitmap[OFFSET(ant->worldCol - 1, ant->worldRow, MAPWIDTH)] &&
                bitmap[OFFSET(ant->worldCol - 1, ant->worldRow + ant->height - 1, MAPWIDTH)]) {
                
                ant->worldCol -= ant->colDelta;

            }
            
            // ant->worldCol -= ant->colDelta;
        }
        if (ant->direction == RIGHT) {
            if (bitmap[OFFSET(ant->worldCol + ant->width - 1 + 1, ant->worldRow, MAPWIDTH)] &&
                bitmap[OFFSET(ant->worldCol + ant->width - 1 + 1, ant->worldRow + ant->height - 1, MAPWIDTH)]) {
                
                ant->worldCol += ant->colDelta;

            }
            // ant->worldCol += ant->colDelta;
        }

        //pulls it to the ground 
        if (bitmap[OFFSET(ant->worldCol, ant->worldRow + ant->height - 1 + ant->rowDelta, MAPWIDTH)] &&
            bitmap[OFFSET(ant->worldCol + ant->width - 1, ant->worldRow + ant->height - 1 + ant->rowDelta, MAPWIDTH)]) {
            
            ant->worldRow += ant->rowDelta;
                
        }

        //collision with floating balloons
        for (int i = 0; i < MAXBALLOONS * 2 + 2; i++) { 
            if (allBalloons[i].active && !allBalloons[i].held) {
                if (collision(allBalloons[i].worldCol, allBalloons[i].worldRow, allBalloons[i].width, allBalloons[i].height, 
                ant->worldCol, ant->worldRow, ant->width, ant->height)) {

                    if (allBalloons[i].type == SINGLE) {
                        ant->health -= 100;
                    }
                    if (allBalloons[i].type == AOE) { 
                        //a data structure that allows for O(1) lookup of bees coordinates
                        int rightLimit = allBalloons[i].worldCol + allBalloons[i].width + allBalloons[i].radius;
                        int leftLimit = allBalloons[i].worldCol - allBalloons[i].radius;
                        for (int i = 0; i < MAXANTS; i++) {
                            if (ants[i].worldCol >= leftLimit && ants[i].worldCol < rightLimit) {
                                ants[i].health -= 34;
                            }
                        }
                    }
                    
                    allBalloons[i].active = 0;
                    playSoundB(pop, POPLEN, 0); 
                }
            }   
        }

        if (collision(player.worldCol, SHIFTDOWN(player.worldRow), player.width, player.height, 
            ant->worldCol, ant->worldRow, ant->width, ant->height)) {
            if (healthTimer % 250 == 0) {
                player.health -= 5;
                healthTimer = 0;
                updateHearts();
            }
            healthTimer++;
        }
    }


    ant->screenCol = ant->worldCol - hOff;
    ant->screenRow = ant->worldRow - vOff;
    animateAnts(ant);
}

void animateAnts(ANT *ant) {
    if (ant->active) {

        if (ant->aniCounter % 10 == 0) {
            ant->curFrame = (ant->curFrame - 24 + 2) % (ant->numFrames * 2) + 24;
        }

        if (ant->direction == LEFT) {
            ant->aniState = 10;
        }
        if (ant->direction == RIGHT) {
            ant->aniState = 8;
        }
        ant->aniCounter++;
    }
}

void drawAnt(ANT *ant) {
    if (ant->active) {
        shadowOAM[52 + ant->num].attr0 = (ROWMASK & ant->screenRow) | ATTR0_SQUARE;
        shadowOAM[52 + ant->num].attr1 = (COLMASK & ant->screenCol) | ATTR1_SMALL;
        shadowOAM[52 + ant->num].attr2 = ATTR2_TILEID(ant->aniState, ant->curFrame) | ATTR2_PALROW(0); 
    } else {
        shadowOAM[52 + ant->num].attr0 = ATTR0_HIDE;
    }
}









