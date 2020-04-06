#include "myLib.h"
#include "mainScreen.h"
#include "gameScreen2.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "loseScreen.h"

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
    //initialize background and mode
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    //initialize spritesheet
    // DMANow(3, snakeSpritesPal, SPRITEPALETTE, 256);
    // DMANow(3, snakeSpritesTiles, &CHARBLOCK[4], snakeSpritesTilesLen/2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);


    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

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
        // initGame();
        srand(seed);
    }
}

void goToGame() {
    DMANow(3, gameScreen2Pal, PALETTE, 256);
    DMANow(3, gameScreen2Tiles, &CHARBLOCK[0], gameScreen2TilesLen/2);
    DMANow(3, gameScreen2Map, &SCREENBLOCK[28], gameScreen2MapLen/2);
    state = GAME;
}

void game() {
    // updateGame();
    // drawGame();
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
