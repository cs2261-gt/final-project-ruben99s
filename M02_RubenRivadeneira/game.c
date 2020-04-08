#include "myLib.h"
#include "game.h"

//directional enum
enum {LEFT, RIGHT};
int direction;

//player animation states
enum {PLAYERRIGHT, PLAYERLEFT, PLAYERUP, PLAYERDOWN, PLAYERIDLE};

//enemy states
enum {BUZZCALM, BUZZANGRY};

//balloon states
enum {SINGLE, AOF};

//global variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
PLAYER player;
BUZZ enemies[MAXENEMIES];
BALLOON balloons[MAXBALLOONS];

//game functions-------------------------
void initGame() {
    vOff = 96;
    hOff = 0;
    direction = RIGHT;
    REG_BG0VOFF = vOff;
    REG_BG1VOFF = vOff;
    initPlayer();
    initBuzz();
    initBalloons();
}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < MAXENEMIES; i++) {
        updateBuzz(&enemies[i]);
    }
    for (int i = 0; i < MAXBALLOONS; i++) {
        updateBalloons(&balloons[i]);
    }
}

void drawGame() {
    drawPlayer();
    for (int i = 0; i < MAXENEMIES; i++) {
        drawBuzz(&enemies[i]);
    }
    for (int i = 0; i < MAXBALLOONS; i++) {
        drawBalloons(&balloons[i]);
    }
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff/2;
}

//player functions-----------------------
void initPlayer() {
    player.height = 30;
    player.width = 20;
    player.colDelta = 2;
    player.rowDelta = 2;
    player.worldCol = 10;
    player.worldRow = MAPHEIGHT - player.height - 14;
    player.prevWorldCol = player.worldCol;

    player.upLimit = player.worldRow - 80;
    player.downLimit = player.worldRow;

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

    player.jumping = 0;
    player.crouching = 0;

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
        // player.aniState = PLAYERDOWN;
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

    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol + player.width - 1 < 512) {
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

//enemy functions
void initBuzz() {
    for (int i = 0; i < MAXENEMIES; i++) {
        enemies[i].height = 20;
        enemies[i].width = 23;
        enemies[i].active = 0;
        enemies[i].state = BUZZCALM;
        enemies[i].direction = LEFT;
        enemies[i].colDelta = 1;
        enemies[i].rowDelta = 1;

        enemies[i].worldRow = MAPHEIGHT - 33 - enemies[i].height;
        enemies[i].worldCol = SCREENWIDTH + (10 * i);
        enemies[i].screenRow = enemies[i].worldRow - vOff;
        // enemies[i].screenCol = enemies[i].worldCol - hOff;

        enemies[i].rightLimit = enemies[i].worldCol + enemies[i].width + 20;
        enemies[i].leftLimit = enemies[i].worldCol - 20;

        enemies[i].aniState = 3;        
    }
}

void drawBuzz(BUZZ *enemy) {
    if (enemy->active) {
        shadowOAM[1].attr0 = (ROWMASK & enemy->screenRow) | ATTR0_SQUARE;
        shadowOAM[1].attr1 = (COLMASK & enemy->screenCol) | ATTR1_MEDIUM;
        shadowOAM[1].attr2 = ATTR2_TILEID(enemy->aniState * 4, 0 * 4) | ATTR2_PALROW(0); 
    }
}

void updateBuzz(BUZZ *enemy) {
    int screenCol = enemy->worldCol - hOff;
    if (screenCol >= 0 && screenCol < 240) {
        enemy->screenCol = screenCol;
        enemy->active = 1;
    } 

    if (enemy->active) {
        if (enemy->state == BUZZCALM) {
            if (enemy->direction == LEFT) {
                if (enemy->worldCol > enemy->leftLimit) {
                    enemy->worldCol -= enemy->colDelta;
                } else {
                    enemy->direction = RIGHT;
                }
            }

            if (enemy->direction == RIGHT) {
                if (enemy->worldCol < enemy->rightLimit) {
                    enemy->worldCol += enemy->colDelta;
                } else {
                    enemy->direction = LEFT;
                }
            }
        }
    }

    enemy->screenCol = enemy->worldCol - hOff;
    enemy->screenRow = enemy->worldRow - vOff;
    animateBuzz(enemy);
}

void animateBuzz(BUZZ *enemy) {
    if (enemy->direction == LEFT) {
        enemy->aniState = 3;
    }
    if (enemy->direction == RIGHT) {
        enemy->aniState = 2;
    }
}

//balloon functions
void initBalloons() {
    for (int i = 0; i < MAXBALLOONS; i++) {
        balloons[i].width = 12;
        balloons[i].height = 16;
        balloons[i].type = SINGLE;
        balloons[i].worldCol = player.worldCol + 16;
        balloons[i].worldRow = player.worldRow;
        balloons[i].screenCol = balloons[i].worldCol - hOff;
        balloons[i].screenRow = balloons[i].worldRow - vOff;
        balloons[i].colDelta = player.colDelta;
        balloons[i].rowDelta = player.rowDelta;
        balloons[i].held = 0;
        balloons[i].active = 0;
        if (i == 0) {
            balloons[i].active = 1;
            balloons[i].held = 1;
        }
        balloons[i].num = i;
    }
}

void updateBalloons(BALLOON *balloon) {
    if (balloon->active) {
        if (balloon->held) {
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
    balloon->screenCol = balloon->worldCol - hOff;
    balloon->screenRow = balloon->worldRow - vOff;
}

void drawBalloons(BALLOON *balloon) {
     if (balloon->active) {
        shadowOAM[2 + balloon->num].attr0 = (ROWMASK & balloon->screenRow) | ATTR0_SQUARE;
        shadowOAM[2 + balloon->num].attr1 = (COLMASK & balloon->screenCol) | ATTR1_SMALL;
        shadowOAM[2 + balloon->num].attr2 = ATTR2_TILEID(0, 24) | ATTR2_PALROW(1); 
    }
}

