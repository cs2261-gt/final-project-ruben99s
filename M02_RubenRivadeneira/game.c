#include "myLib.h"
#include "game.h"
#include "buzz.h"
#include "player.h"
#include "balloon.h"

int direction; 

//global variables
int hOff; 
int vOff;
OBJ_ATTR shadowOAM[128];
int remainingEnemies;
int numBalloons;

//game functions-------------------------
void initGame() {
    vOff = 96;
    hOff = 0;
    direction = RIGHT; 
    remainingEnemies = MAXBEES;
    numBalloons = 0;
    REG_BG0VOFF = vOff;
    REG_BG1VOFF = vOff;
    initPlayer();
    initBuzz();
    initBalloons();
}

void updateGame() {
    int numActiveBalloons = 0;

    updatePlayer();
    for (int i = 0; i < MAXBEES; i++) {
        updateBuzz(&bees[i]);
    }
    for (int i = 0; i < MAXBALLOONS; i++) {
        updateBalloons(&balloons[i]);
        if (balloons[i].active) {
            numActiveBalloons++;
        }
    }
    if (numActiveBalloons < MAXBALLOONS) {
        for (int i = 0; i < MAXBALLOONS; i++) {
            if (!balloons[i].active) {
                balloons[i].active = 1;
                balloons[i].held = 1;
                break;
            } 
        }
    }
}

void drawGame() {
    drawPlayer();
    for (int i = 0; i < MAXBEES; i++) {
        drawBuzz(&bees[i]);
    }
    for (int i = 0; i < MAXBALLOONS; i++) {
        drawBalloons(&balloons[i]);
    }
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff/2;
}
