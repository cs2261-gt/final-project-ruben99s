#include "myLib.h"
#include "game1.h"
#include "ant.h"
#include "player.h"
#include "balloon.h"

#include "bg00L1CollisionMap.h"

int direction; 

//global variables 
int hOff; 
int vOff;
OBJ_ATTR shadowOAM[128]; 
// int remainingEnemies; 
int numBalloons;
int isPlayerEndL1;
int playerHealth; 
int remainingEnemiesL1;

//game functions-------------------------
void initGame1() { 
    vOff = 96;
    hOff = 0;
    direction = RIGHT; 
    remainingEnemiesL1 = MAXANTS; 
    numBalloons = 0;
    isPlayerEndL1 = 0;
    REG_BG0VOFF = vOff;
    REG_BG1VOFF = vOff;
    initPlayer(&hOff, &vOff, 1); 
    // initBuzz();
    initAnts();
    initBalloons();
}

void updateGame1() {
    int numActiveBalloons = 0; 

    updatePlayer(&bg00L1CollisionMapBitmap, &hOff, &vOff, 1);
    // for (int i = 0; i < MAXBEES; i++) {
    //     updateBuzz(&bees[i]);
    // }

    for (int i = 0; i < MAXANTS; i++) {
        updateAnts(&ants[i], &bg00L1CollisionMapBitmap);
    } 
    
    //updates only the balloon type that is selected
    if (player.balloonType == SINGLE) {
        for (int i = 0; i < MAXBALLOONS; i++) {
            updateBalloons(&allBalloons[i]);
            if (allBalloons[i].active) {
                numActiveBalloons++; 
            }
        }

        if (numActiveBalloons < MAXBALLOONS) { 
            for (int i = 0; i < MAXBALLOONS ; i++) {
                if (!allBalloons[i].active) {
                    allBalloons[i].active = 1;
                    allBalloons[i].held = 1;
                    break;
                } 
            }
        }
    }
    if (player.balloonType == AOE) {
        for (int i = MAXBALLOONS; i < MAXBALLOONS * 2; i++) {
            updateBalloons(&allBalloons[i]);
            if (allBalloons[i].active) { 
                numActiveBalloons++;
            }
        }

        if (numActiveBalloons < MAXBALLOONS) {
            for (int i = MAXBALLOONS; i < MAXBALLOONS * 2; i++) {
                if (!allBalloons[i].active) {
                    allBalloons[i].active = 1;
                    allBalloons[i].held = 1;
                    break;
                } 
            }
        }
    }
    if (player.balloonType == JUMP) {
        updateBalloons(&allBalloons[10]); 
    }
    if (player.balloonType == CHEAT) {
        updateBalloons(&allBalloons[11]);
    }
    /*constantly keeps all balloons in pool at same spot
    so that no flickering occurs when switching between types*/
    for (int i = 0; i < MAXBALLOONS * 2 + 2; i++) {
        if (!allBalloons[i].active) {
            updateHeldBalloon(&allBalloons[i]);
        }
        // if (allBalloons[i].active && !allBalloons[i].held) {
        //     updateDropBalloon(&allBalloons[i]);
        // }
    }

    if (player.worldCol >= 460) { 
        isPlayerEndL1 = 1;
    } else {
        isPlayerEndL1 = 0; 
    }
    playerHealth = player.health;
}

void drawGame1() {
    drawPlayer();
    // for (int i = 0; i < MAXBEES; i++) {
    //     drawBuzz(&bees[i]);
    // }
    //updates only the balloon type that is selected or deletes the previous type selected
    if (player.balloonType == SINGLE || player.lastBalloonType == SINGLE) {
        for (int i = 0; i < MAXBALLOONS; i++) {
            drawBalloons(&allBalloons[i]); 
        }
    }
    if (player.balloonType == AOE || player.lastBalloonType == AOE) {
        for (int i = MAXBALLOONS; i < MAXBALLOONS * 2; i++) {
            drawBalloons(&allBalloons[i]);
        }
    }
    if (player.balloonType == JUMP || player.lastBalloonType == JUMP) {
        drawBalloons(&allBalloons[10]);
    }
    if (player.balloonType == CHEAT || player.lastBalloonType == CHEAT) {
        drawBalloons(&allBalloons[11]);
    }

    for (int i = 0; i < MAXANTS; i++) {
        drawAnt(&ants[i]);
    }
    
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff/2;
}