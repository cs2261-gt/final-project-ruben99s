# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 342 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);

typedef enum {LEFT, RIGHT};
# 2 "main.c" 2
# 1 "mainScreen.h" 1
# 22 "mainScreen.h"
extern const unsigned short mainScreenTiles[960];


extern const unsigned short mainScreenMap[1024];


extern const unsigned short mainScreenPal[256];
# 3 "main.c" 2
# 1 "gameScreen2.h" 1
# 22 "gameScreen2.h"
extern const unsigned short gameScreen2Tiles[32];


extern const unsigned short gameScreen2Map[1024];


extern const unsigned short gameScreen2Pal[256];
# 4 "main.c" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[816];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 5 "main.c" 2
# 1 "winScreen.h" 1
# 22 "winScreen.h"
extern const unsigned short winScreenTiles[784];


extern const unsigned short winScreenMap[1024];


extern const unsigned short winScreenPal[256];
# 6 "main.c" 2
# 1 "loseScreen.h" 1
# 22 "loseScreen.h"
extern const unsigned short loseScreenTiles[800];


extern const unsigned short loseScreenMap[1024];


extern const unsigned short loseScreenPal[256];
# 7 "main.c" 2

# 1 "bg00.h" 1
# 22 "bg00.h"
extern const unsigned short bg00Tiles[6096];


extern const unsigned short bg00Map[3072];


extern const unsigned short bg00Pal[256];
# 9 "main.c" 2
# 1 "bg01.h" 1
# 22 "bg01.h"
extern const unsigned short bg01Tiles[7264];


extern const unsigned short bg01Map[2048];


extern const unsigned short bg01Pal[256];
# 10 "main.c" 2

# 1 "game.h" 1



extern int hOff;
extern int vOff;

extern int remainingEnemies;
extern int numBalloons;
extern int direction;
extern int isPlayerEnd;
extern int playerHealth;







void initGame();
void updateGame();
void drawGame();
# 12 "main.c" 2
# 1 "spriteSheetTest.h" 1
# 21 "spriteSheetTest.h"
extern const unsigned short spriteSheetTestTiles[16384];


extern const unsigned short spriteSheetTestPal[256];
# 13 "main.c" 2
# 1 "finalSpriteSheet.h" 1
# 21 "finalSpriteSheet.h"
extern const unsigned short finalSpriteSheetTiles[16384];


extern const unsigned short finalSpriteSheetPal[256];
# 14 "main.c" 2
# 1 "instructionScreen.h" 1
# 22 "instructionScreen.h"
extern const unsigned short instructionScreenTiles[1152];


extern const unsigned short instructionScreenMap[1024];


extern const unsigned short instructionScreenPal[256];
# 15 "main.c" 2
# 1 "FinalInstructionScreen.h" 1
# 22 "FinalInstructionScreen.h"
extern const unsigned short FinalInstructionScreenTiles[5616];


extern const unsigned short FinalInstructionScreenMap[1024];


extern const unsigned short FinalInstructionScreenPal[256];
# 16 "main.c" 2

# 1 "bg00Level1.h" 1
# 22 "bg00Level1.h"
extern const unsigned short bg00Level1Tiles[4624];


extern const unsigned short bg00Level1Map[2048];


extern const unsigned short bg00Level1Pal[256];
# 18 "main.c" 2
# 1 "bg01Level1.h" 1
# 22 "bg01Level1.h"
extern const unsigned short bg01Level1Tiles[8160];


extern const unsigned short bg01Level1Map[2048];


extern const unsigned short bg01Level1Pal[256];
# 19 "main.c" 2
# 1 "game1.h" 1



extern int hOff;
extern int vOff;

extern int remainingEnemiesL1;
extern int numBalloons;
extern int direction;
extern int isPlayerEndL1;
extern int playerHealth;







void initGame1();
void updateGame1();
void drawGame1();
# 20 "main.c" 2

# 1 "bg00Level2.h" 1
# 22 "bg00Level2.h"
extern const unsigned short bg00Level2Tiles[14864];


extern const unsigned short bg00Level2Map[2048];


extern const unsigned short bg00Level2Pal[256];
# 22 "main.c" 2
# 1 "game2.h" 1



extern int hOff;
extern int vOff;

extern int remainingEnemiesL2;
extern int numBalloons;
extern int direction;
extern int isPlayerEndL2;
extern int playerHealth;







void initGame2();
void updateGame2();
void drawGame2();
# 23 "main.c" 2

# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 25 "main.c" 2
# 1 "News_Room_News.h" 1




extern const signed char gameSong[1045440];
# 26 "main.c" 2
# 1 "Pop.h" 1




extern const signed char pop[8189];
# 27 "main.c" 2
# 35 "main.c"
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


enum {START, GAME, GAME1, GAME2, PAUSE, WIN, LOSE, INSTRUCTION};
int state;
int prevState;


SOUND soundA;
SOUND soundB;


unsigned short buttons;
unsigned short oldButtons;




int hOffInstruction = 0;
int vOffInstruction = 0;

int main() {
    initialize();

    while(1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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





void initialize() {

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (1<<14);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((30)<<8) | (0<<7) | (1<<14);


    DMANow(3, finalSpriteSheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, finalSpriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);



    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);


    setupInterrupts();
    setupSounds();


    goToStart();
}





void goToStart() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, mainScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, mainScreenTiles, &((charblock *)0x6000000)[0], 1920/2);
    DMANow(3, mainScreenMap, &((screenblock *)0x6000000)[28], 2048/2);


    state = START;
}

void start() {

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initGame();
        goToGame();

    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToInstruction();
    }
}





void goToGame() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);
    (*(volatile unsigned short *)0x04000012) = 96;
    (*(volatile unsigned short *)0x04000010) = 0;






    DMANow(3, bg00Pal, ((unsigned short *)0x5000000), 512/2);

    DMANow(3, bg00Tiles, &((charblock *)0x6000000)[0], 12192/2);
    DMANow(3, bg00Map, &((screenblock *)0x6000000)[28], 6144/2);

    DMANow(3, bg01Tiles, &((charblock *)0x6000000)[1], 14528/2);
    DMANow(3, bg01Map, &((screenblock *)0x6000000)[30], 4096/2);


    prevState = state;
    state = GAME;
}

void game() {

    updateGame();
    drawGame();

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }






    if(remainingEnemies <= 0 && isPlayerEnd) {

        initGame1();
        goToGame1();
    }
    if(playerHealth <= 0) {
        goToLose();
    }
}





void goToGame1() {
# 234 "main.c"
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);
    (*(volatile unsigned short *)0x04000012) = 96;
    (*(volatile unsigned short *)0x04000010) = 0;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, bg00Level1Pal, ((unsigned short *)0x5000000), 512/2);

    DMANow(3, bg00Level1Tiles, &((charblock *)0x6000000)[0], 9248/2);
    DMANow(3, bg00Level1Map, &((screenblock *)0x6000000)[28], 4096/2);

    DMANow(3, bg01Level1Tiles, &((charblock *)0x6000000)[1], 16320/2);
    DMANow(3, bg01Level1Map, &((screenblock *)0x6000000)[30], 4096/2);


    prevState = state;
    state = GAME1;
}

void game1() {

    updateGame1();
    drawGame1();

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }

    if(isPlayerEndL1 && remainingEnemiesL1 <= 0) {

        initGame2();
        goToGame2();
    }






    if(playerHealth <= 0) {
        goToLose();
    }




}





void goToGame2() {
# 298 "main.c"
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000012) = 96;
    (*(volatile unsigned short *)0x04000010) = 0;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, bg00Level2Pal, ((unsigned short *)0x5000000), 512/2);

    DMANow(3, bg00Level2Tiles, &((charblock *)0x6000000)[0], 29728/2);
    DMANow(3, bg00Level2Map, &((screenblock *)0x6000000)[28], 4096/2);

    prevState = state;
    state = GAME2;
}

void game2() {

    updateGame2();
    drawGame2();

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }

    if(isPlayerEndL2 && remainingEnemiesL2 <= 0) {
        goToWin();


    }






    if(playerHealth <= 0) {
        goToLose();
    }




}





void goToPause() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    DMANow(3, pauseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseScreenTiles, &((charblock *)0x6000000)[0], 1632/2);
    DMANow(3, pauseScreenMap, &((screenblock *)0x6000000)[28], 2048/2);

    prevState = state;
    state = PAUSE;
}

void pause() {
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        if (prevState == GAME) {
            goToGame();
        } else if (prevState == GAME1) {
            goToGame1();
        } else {
            goToGame2();
        }

    }
    if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }
}





void goToWin() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    DMANow(3, winScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, winScreenTiles, &((charblock *)0x6000000)[0], 1568/2);
    DMANow(3, winScreenMap, &((screenblock *)0x6000000)[28], 2048/2);

    prevState = state;
    state = WIN;
}

void win() {
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}





void goToLose() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    DMANow(3, loseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseScreenTiles, &((charblock *)0x6000000)[0], 1600/2);
    DMANow(3, loseScreenMap, &((screenblock *)0x6000000)[28], 2048/2);

    prevState = state;
    state = LOSE;
}

void lose() {
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}





void goToInstruction() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;
    hOffInstruction = 0;
    vOffInstruction = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    DMANow(3, FinalInstructionScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, FinalInstructionScreenTiles, &((charblock *)0x6000000)[0], 11232/2);
    DMANow(3, FinalInstructionScreenMap, &((screenblock *)0x6000000)[28], 2048/2);

    prevState = state;
    state = INSTRUCTION;
}

void instruction() {
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<3)))) {
        vOffInstruction = 0;
        hOffInstruction = 0;
        goToStart();
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (vOffInstruction < 96) {
            vOffInstruction++;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (vOffInstruction > 0) {
            vOffInstruction--;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (hOffInstruction > 0) {
            hOffInstruction--;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (hOffInstruction < 16) {
            hOffInstruction++;
        }
    }

    waitForVBlank();
    (*(volatile unsigned short *)0x04000012) = vOffInstruction;
    (*(volatile unsigned short *)0x04000010) = hOffInstruction;
}
