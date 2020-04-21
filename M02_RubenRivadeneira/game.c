#include "myLib.h"
#include "game.h"
#include "buzz.h"
#include "player.h"
#include "balloon.h"

#include "bg00CollisionMap.h"

int direction; 

//global variables 
int hOff; 
int vOff;
OBJ_ATTR shadowOAM[128]; 
int remainingEnemies;
int numBalloons;
int isPlayerEnd;
int playerHealth;
int secondWaveHappened;

void activateSecondWave();

//game functions-------------------------
void initGame() { 
    vOff = 96;
    hOff = 0;
    direction = RIGHT; 
    remainingEnemies = MAXBEES; 
    numBalloons = 0;
    isPlayerEnd = 0;
    secondWaveHappened = 0;
    REG_BG0VOFF = vOff;
    REG_BG1VOFF = vOff;
    initPlayer(&hOff, &vOff, 0); 
    initBuzz();
    initBalloons();
}

void updateGame() {
    int numActiveBalloons = 0; 

    if (remainingEnemies <= 5 && !secondWaveHappened) {
        activateSecondWave();
        secondWaveHappened = 1;
    }

    updatePlayer(&bg00CollisionMapBitmap, &hOff, &vOff, 0);
    
    for (int i = 0; i < MAXBEES; i++) {
        updateBuzz(&bees[i]);
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
        isPlayerEnd = 1;
    } else {
        isPlayerEnd = 0;
    }
    playerHealth = player.health;
}

void activateSecondWave() {
    for (int i = 8; i < MAXBEES; i++) {
        bees[i].active = 1;
    }
}

void drawGame() {
    drawPlayer();
    for (int i = 0; i < MAXBEES; i++) { 
        drawBuzz(&bees[i]);
    }
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
    
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hOff;
    REG_BG1HOFF = hOff/2;
}
