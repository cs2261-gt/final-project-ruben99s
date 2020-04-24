#include "myLib.h"
// #include "mainScreen.h"
// #include "gameScreen2.h"
// #include "pauseScreen.h"
// #include "winScreen.h"
// #include "loseScreen.h"

#include "bg00.h"
#include "bg01.h"
// #include "spriteSheet.h"
#include "game.h"
// #include "spriteSheetTest.h"
#include "finalSpriteSheet.h"
// #include "instructionScreen.h"
#include "FinalInstructionScreen.h"
#include "finalMainScreen.h"
#include "finalLoseScreen.h"
#include "finalWinScreen.h"
#include "finalPauseScreen.h"

#include "bg00Level1.h"
#include "bg01Level1.h"
#include "game1.h"

#include "bg00Level2.h"
#include "game2.h"

#include "sound.h"
#include "News_Room_News.h"
#include "Pop.h"
#include "mainMenuSong.h"
#include "game0Song.h"
#include "calmGame2.h"
#include "pauseSong.h"

/*Different sounds need to be added and there is a bug with
the gravity that needs to be fixed as well. The instruction screen
should have all the instructions to play the game and the artwork for 
all the game levels is finished but the main menu might change before
final submission :)*/

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

//sound
SOUND soundA;
SOUND soundB;

//button inputs
unsigned short buttons;
unsigned short oldButtons;

//random seed
// int seed;

int hOffInstruction = 0;
int vOffInstruction = 0;

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

    //sound
    setupInterrupts();
    setupSounds();

    //sets state to start
    // prevState = START;
    // state = START;
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
    DMANow(3, finalMainScreenPal, PALETTE, 256);
    DMANow(3, finalMainScreenTiles, &CHARBLOCK[0], finalMainScreenTilesLen/2);
    DMANow(3, finalMainScreenMap, &SCREENBLOCK[28], finalMainScreenMapLen/2);

    // playSoundA(gameSong, GAMESONGLEN, 1);
    prevState = state;
    if (prevState != INSTRUCTION) {
        stopSound();
        playSoundA(mainSong, MAINSONGLEN, 1);
    }
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
        // playSoundB(pop, POPLEN, 0);
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

    if (prevState != PAUSE) {
        stopSound();
        playSoundA(game0Song, GAME0SONGLEN, 1);
    }
    
    state = GAME;
}

void game() {
    //level 0 code
    updateGame();
    drawGame();

    if(BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
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
    if (prevState != PAUSE) {
        stopSound();
        playSoundA(gameSong, GAMESONGLEN, 1);
    }
    state = GAME1;
}

void game1() {
    //level 1 code here
    updateGame1();
    drawGame1();

    if(BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    }
  
    if(isPlayerEndL1 && remainingEnemiesL1 <= 0) { 
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
 
    // if(BUTTON_PRESSED(BUTTON_B)) {
    //     goToLose();
    // }
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
    if (prevState != PAUSE) {
        stopSound();
        playSoundA(calmGame2, CALMGAME2LEN, 1);
    }
    state = GAME2;
}

void game2() {
    //level 2 code here
    updateGame2();
    drawGame2(); 

    if(BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    }
  
    if(isPlayerEndL2 && remainingEnemiesL2 <= 0) { 
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
 
    // if(BUTTON_PRESSED(BUTTON_B)) {
    //     goToLose();
    // }
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
    DMANow(3, finalPauseScreenPal, PALETTE, 256);
    DMANow(3, finalPauseScreenTiles, &CHARBLOCK[0], finalPauseScreenTilesLen/2);
    DMANow(3, finalPauseScreenMap, &SCREENBLOCK[28], finalPauseScreenMapLen/2);

    playSoundB(pauseSong, PAUSESONGLEN, 1);

    prevState = state;
    state = PAUSE;
}

void pause() {
    if(BUTTON_PRESSED(BUTTON_START)) { 
        stopSoundB();
        unPauseSoundA();
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
    DMANow(3, finalWinScreenPal, PALETTE, 256);
    DMANow(3, finalWinScreenTiles, &CHARBLOCK[0], finalWinScreenTilesLen/2);
    DMANow(3, finalWinScreenMap, &SCREENBLOCK[28], finalWinScreenMapLen/2);

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
    DMANow(3, finalLoseScreenPal, PALETTE, 256);
    DMANow(3, finalLoseScreenTiles, &CHARBLOCK[0], finalLoseScreenTilesLen/2);
    DMANow(3, finalLoseScreenMap, &SCREENBLOCK[28], finalLoseScreenMapLen/2);

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
    hOffInstruction = 0;
    vOffInstruction = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, FinalInstructionScreenPal, PALETTE, 256);
    DMANow(3, FinalInstructionScreenTiles, &CHARBLOCK[0], FinalInstructionScreenTilesLen/2);
    DMANow(3, FinalInstructionScreenMap, &SCREENBLOCK[28], FinalInstructionScreenMapLen/2);

    prevState = state;
    state = INSTRUCTION;
}

void instruction() {
    if(BUTTON_HELD(BUTTON_START)) {
        vOffInstruction = 0;
        hOffInstruction = 0;
        goToStart();
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (vOffInstruction < 96) {
            vOffInstruction++;
        }
    }
    if(BUTTON_HELD(BUTTON_UP)) {
        if (vOffInstruction > 0) {
            vOffInstruction--;
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (hOffInstruction > 0) {
            hOffInstruction--;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (hOffInstruction < 16) {
            hOffInstruction++;
        }
    }
    
    waitForVBlank();
    REG_BG0VOFF = vOffInstruction;
    REG_BG0HOFF = hOffInstruction;
}
