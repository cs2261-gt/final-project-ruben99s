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
    initPlayer();
}

void drawGame() {
    drawPlayer();
}

//player functions-----------------------
void initPlayer() {
    player.height = 32;
    player.width = 32;
    player.colDelta = 1;
    player.rowDelta = 1;
    player.worldCol = 10;
    player.worldRow = MAPHEIGHT - player.height - 13;

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 5;
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
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        player.aniState = PLAYERRIGHT;
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
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
}