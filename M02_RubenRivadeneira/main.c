#include "myLib.h"
#include "mainScreen.h"
#include "gameScreen2.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "loseScreen.h"

#include "bg00.h"
#include "bg01.h"
// #include "spriteSheet.h"
#include "game.h"
#include "spriteSheetTest.h"
#include "finalSpriteSheet.h"
#include "instructionScreen.h"

#include "bg00Level1.h"
#include "bg01Level1.h"
#include "game1.h"

#include "bg00Level2.h"
#include "game2.h"


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
void goToInstruction();
void instruction();

void goToGame1();
void game1(); 
void goToGame2();
void game2();

//state enum
enum {START, GAME, GAME1, GAME2, PAUSE, WIN, LOSE, INSTRUCTION};
int state;
int prevState;

//button inputs
unsigned short buttons;
unsigned short oldButtons;

//random seed
// int seed;

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
            case GAME1:
                game1();
                break;
            case GAME2:
                game2();
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
            case INSTRUCTION:
                instruction();
                break;
        }
    }
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void initialize() {
    //initialize background and mode
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_WIDE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_4BPP | BG_SIZE_WIDE;

    //initialize spritesheet
    DMANow(3, finalSpriteSheetPal, SPRITEPALETTE, 256);
    DMANow(3, finalSpriteSheetTiles, &CHARBLOCK[4], finalSpriteSheetTilesLen/2);

    // DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);
    // DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    //sets state to start
    goToStart();
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void goToStart() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
    
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    //testing bg
    DMANow(3, mainScreenPal, PALETTE, 256);
    DMANow(3, mainScreenTiles, &CHARBLOCK[0], mainScreenTilesLen/2);
    DMANow(3, mainScreenMap, &SCREENBLOCK[28], mainScreenMapLen/2);
    state = START;
}

void start() {
    // seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame();
        goToGame();
        // srand(seed);
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstruction();
    }
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 96;
    REG_BG0HOFF = 0;
    //testing background
    // DMANow(3, gameScreen2Pal, PALETTE, 256);
    // DMANow(3, gameScreen2Tiles, &CHARBLOCK[0], gameScreen2TilesLen/2);
    // DMANow(3, gameScreen2Map, &SCREENBLOCK[28], gameScreen2MapLen/2);

    //simultaneous backgrounds
    DMANow(3, bg00Pal, PALETTE, bg01PalLen/2);

    DMANow(3, bg00Tiles, &CHARBLOCK[0], bg00TilesLen/2);
    DMANow(3, bg00Map, &SCREENBLOCK[28], bg00MapLen/2);

    DMANow(3, bg01Tiles, &CHARBLOCK[1], bg01TilesLen/2);
    DMANow(3, bg01Map, &SCREENBLOCK[30], bg01MapLen/2);
  
    prevState = state;
    state = GAME;
}

void game() {
    //level 0 code
    updateGame();
    drawGame();

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    // if(BUTTON_PRESSED(BUTTON_A)) {
    //     goToWin();
    // }
    // if(BUTTON_PRESSED(BUTTON_B)) {
    //     goToLose();
    // }
    if(remainingEnemies <= 0 && isPlayerEnd) {
        // goToWin(); 
        initGame1();
        goToGame1();
    }
    if(playerHealth <= 0) {
        goToLose();
    }
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void goToGame1() {
    // testing background
    // REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    // REG_BG0VOFF = 0;
    // REG_BG0HOFF = 0;
    // hideSprites();
    // DMANow(3, shadowOAM, OAM, 512);
    // DMANow(3, gameScreen2Pal, PALETTE, 256);
    // DMANow(3, gameScreen2Tiles, &CHARBLOCK[0], gameScreen2TilesLen/2);
    // DMANow(3, gameScreen2Map, &SCREENBLOCK[28], gameScreen2MapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 96;
    REG_BG0HOFF = 0;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    //simultaneous backgrounds
    DMANow(3, bg00Level1Pal, PALETTE, bg00Level1PalLen/2);

    DMANow(3, bg00Level1Tiles, &CHARBLOCK[0], bg00Level1TilesLen/2);
    DMANow(3, bg00Level1Map, &SCREENBLOCK[28], bg00Level1MapLen/2);

    DMANow(3, bg01Level1Tiles, &CHARBLOCK[1], bg01Level1TilesLen/2);
    DMANow(3, bg01Level1Map, &SCREENBLOCK[30], bg01Level1MapLen/2);


    prevState = state;
    state = GAME1;
}

void game1() {
    //level 1 code here
    updateGame1();
    drawGame1();

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
  
    if(isPlayerEndL1) { 
        // goToWin();
        initGame2();
        goToGame2();
    }
    
    // if(remainingEnemies <= 0 && isPlayerEnd) {
    //     // goToWin(); 
    //     goToGame2();
    // }

    if(playerHealth <= 0) {
        goToLose();
    }
 
    if(BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void goToGame2() {
    // // testing background
    // REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    // REG_BG0VOFF = 0;
    // REG_BG0HOFF = 0;
    // hideSprites();
    // DMANow(3, shadowOAM, OAM, 512);
    // DMANow(3, gameScreen2Pal, PALETTE, 256);
    // DMANow(3, gameScreen2Tiles, &CHARBLOCK[0], gameScreen2TilesLen/2);
    // DMANow(3, gameScreen2Map, &SCREENBLOCK[28], gameScreen2MapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 96;
    REG_BG0HOFF = 0;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    //simultaneous backgrounds
    DMANow(3, bg00Level2Pal, PALETTE, bg00Level2PalLen/2);

    DMANow(3, bg00Level2Tiles, &CHARBLOCK[0], bg00Level2TilesLen/2);
    DMANow(3, bg00Level2Map, &SCREENBLOCK[28], bg00Level2MapLen/2);

    prevState = state;
    state = GAME2;
}

void game2() {
    //level 2 code here
    updateGame2();
    drawGame2(); 

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
  
    if(isPlayerEndL2) { 
        goToWin();
        // initGame2();
        // goToGame2();
    }
    
    // if(remainingEnemies <= 0 && isPlayerEnd) {
    //     // goToWin(); 
    //     goToGame2();
    // }

    if(playerHealth <= 0) {
        goToLose();
    }
 
    if(BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void goToPause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen/2);

    prevState = state;
    state = PAUSE;
}

void pause() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        if (prevState == GAME) {
            goToGame();
        } else if (prevState == GAME1) {
            goToGame1();
        } else {
            goToGame2();
        }
        
    }
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void goToWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, winScreenPal, PALETTE, 256);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[28], winScreenMapLen/2);

    prevState = state;
    state = WIN;
}

void win() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void goToLose() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, loseScreenPal, PALETTE, 256);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[28], loseScreenMapLen/2);

    prevState = state;
    state = LOSE;
}

void lose() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void goToInstruction() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, instructionScreenPal, PALETTE, 256);
    DMANow(3, instructionScreenTiles, &CHARBLOCK[0], instructionScreenTilesLen/2);
    DMANow(3, instructionScreenMap, &SCREENBLOCK[28], instructionScreenMapLen/2);

    prevState = state;
    state = INSTRUCTION;
}

void instruction() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
