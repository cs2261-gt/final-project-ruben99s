#include "myLib.h"
#include "mainScreen.h"
#include "gameScreen2.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "loseScreen.h"

#include "bg00.h"
#include "bg01.h"
#include "spriteSheet.h"
#include "game.h"

//Function prototypes
void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

//state enum
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

//button inputs
unsigned short buttons;
unsigned short oldButtons;

//random seed
int seed;

int main() {
    initialize();

    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        //state machine
        switch(state) {
            case START: 
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }
}

void initialize() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    //initialize background and mode
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_WIDE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_4BPP | BG_SIZE_WIDE;

    //initialize spritesheet
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    //sets state to start
    goToStart();
}

void goToStart() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    //copies main screen into memory
    DMANow(3, mainScreenPal, PALETTE, 256);
    DMANow(3, mainScreenTiles, &CHARBLOCK[0], mainScreenTilesLen/2);
    DMANow(3, mainScreenMap, &SCREENBLOCK[28], mainScreenMapLen/2);
    state = START;
}

void start() {
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
        srand(seed);
    }
}

void goToGame() {
    // DMANow(3, gameScreen2Pal, PALETTE, 256);
    // DMANow(3, gameScreen2Tiles, &CHARBLOCK[0], gameScreen2TilesLen/2);
    // DMANow(3, gameScreen2Map, &SCREENBLOCK[28], gameScreen2MapLen/2);

    //initialized bg palette
    DMANow(3, bg01Pal, PALETTE, bg01PalLen/2);

    DMANow(3, bg00Tiles, &CHARBLOCK[1], bg00TilesLen/2);
    DMANow(3, bg00Map, &SCREENBLOCK[30], bg00MapLen/2);

    DMANow(3, bg01Tiles, &CHARBLOCK[0], bg01TilesLen/2);
    DMANow(3, bg01Map, &SCREENBLOCK[28], bg01MapLen/2);

    REG_BG0VOFF = 96;
    REG_BG1VOFF = 96;
    
    
    state = GAME;
}

void game() {
    // updateGame();
    drawGame();
    // REG_BG0HOFF = hOff;
    // REG_BG1HOFF = hOff/2;

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    if(BUTTON_PRESSED(BUTTON_START)) { 
        goToPause();
    }
    if(BUTTON_PRESSED(BUTTON_A)) {
        goToWin();
    }
    if(BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
    // if(BUTTON_HELD(BUTTON_LEFT)) {
    //     hOff--;
    // }
    // if(BUTTON_HELD(BUTTON_RIGHT)) {
    //     hOff++;
    // }
    // if(loseCol) { 
    //     goToLose();
    // }
    // if(currentLength >= SNAKELENGTH - 1) {
    //     goToWin(); 
    // }
}

void goToPause() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen/2);
    state = PAUSE;
}

void pause() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, winScreenPal, PALETTE, 256);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[28], winScreenMapLen/2);
    state = WIN;
}

void win() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, loseScreenPal, PALETTE, 256);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[28], loseScreenMapLen/2);
    state = LOSE;
}

void lose() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
