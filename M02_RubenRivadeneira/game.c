#include "myLib.h"
#include "game.h"

//directional enum
enum {LEFT, RIGHT};
int direction;

//player animation states
enum {PLAYERRIGHT, PLAYERLEFT, PLAYERUP, PLAYERDOWN, PLAYERIDLE};

//global variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
PLAYER player;

//game functions-------------------------
void initGame() {
    vOff = 96;
    hOff = 0;
    direction = RIGHT;
    REG_BG0VOFF = vOff;
    REG_BG1VOFF = vOff;
    initPlayer();
}

void drawGame() {
    drawPlayer();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff/2;
}

void updateGame() {
    updatePlayer();
}

//player functions-----------------------
void initPlayer() {
    player.height = 32;
    player.width = 32;
    player.colDelta = 2;
    player.rowDelta = 2;
    player.worldCol = 10;
    player.worldRow = MAPHEIGHT - player.height - 13;

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

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
        player.aniState = PLAYERUP;
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        player.aniState = PLAYERDOWN;
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
    if (player.aniState == PLAYERDOWN) {
        if (direction == RIGHT) {
            shadowOAM[0].attr2 = ATTR2_TILEID(0, 5 * 4) | ATTR2_PALROW(0);
        }
        if (direction == LEFT) {
            shadowOAM[0].attr2 = ATTR2_TILEID(1 * 4, 5 * 4) | ATTR2_PALROW(0);
        }
    } else {
        shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.curFrame * 4) | ATTR2_PALROW(0);
    }
    
}

void updatePlayer() {
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol + player.width - 1 < 512) {
            player.worldCol += player.colDelta;
            
            if (hOff + 1 < MAPWIDTH - SCREENWIDTH && player.screenCol > SCREENWIDTH/2) {
                hOff += player.colDelta;
            }
        }
    }

    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.worldCol >= 0) {
            player.worldCol -= player.colDelta;

            if (hOff - 1 >= 0 && player.screenCol < SCREENWIDTH/2) {
                hOff -= player.colDelta;
            }
        }
    }

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

    animatePlayer();
}