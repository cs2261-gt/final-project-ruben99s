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
# 2 "main.c" 2
# 1 "mainScreen.h" 1
# 22 "mainScreen.h"
extern const unsigned short mainScreenTiles[32];


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
extern const unsigned short pauseScreenTiles[32];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 5 "main.c" 2
# 1 "winScreen.h" 1
# 22 "winScreen.h"
extern const unsigned short winScreenTiles[32];


extern const unsigned short winScreenMap[1024];


extern const unsigned short winScreenPal[256];
# 6 "main.c" 2
# 1 "loseScreen.h" 1
# 22 "loseScreen.h"
extern const unsigned short loseScreenTiles[32];


extern const unsigned short loseScreenMap[1024];


extern const unsigned short loseScreenPal[256];
# 7 "main.c" 2

# 1 "bg00.h" 1
# 22 "bg00.h"
extern const unsigned short bg00Tiles[6944];


extern const unsigned short bg00Map[2048];


extern const unsigned short bg00Pal[256];
# 9 "main.c" 2
# 1 "bg01.h" 1
# 22 "bg01.h"
extern const unsigned short bg01Tiles[7520];


extern const unsigned short bg01Map[2048];


extern const unsigned short bg01Pal[256];
# 10 "main.c" 2

# 1 "game.h" 1



typedef struct {
    int screenCol;
    int screenRow;
    int worldCol;
    int worldRow;
    int colDelta;
    int rowDelta;
    int height;
    int width;

    int prevWorldCol;

    int upLimit;
    int downLimit;

    int jumping;
    int crouching;


    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} PLAYER;

typedef struct {
    int screenCol;
    int screenRow;
    int worldCol;
    int worldRow;
    int colDelta;
    int rowDelta;
    int height;
    int width;

    int active;
    int type;

    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} BALLOON;

typedef struct {
    int screenCol;
    int screenRow;
    int worldCol;
    int worldRow;
    int colDelta;
    int rowDelta;
    int height;
    int width;
    int active;

    int rightLimit;
    int leftLimit;
    int direction;
    int state;

    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} BUZZ;

typedef struct {
    int screenCol;
    int screenRow;
    int worldCol;
    int worldRow;
    int colDelta;
    int rowDelta;
    int height;
    int width;
    int active;
} BULLET;


extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern PLAYER player;
extern BUZZ enemies[];
extern BALLOON balloons[];
# 101 "game.h"
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void playerAttack();

void initBuzz();
void updateBuzz(BUZZ *enemy);
void animateBuzz(BUZZ *enemy);
void drawBuzz(BUZZ *enemy);
void buzzAttack(BUZZ *enemy);

void initBalloons();
void updateBalloons();
void drawBalloons();
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


enum {START, GAME, PAUSE, WIN, LOSE};
int state;


unsigned short buttons;
unsigned short oldButtons;




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

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (1<<14);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((30)<<8) | (0<<7) | (1<<14);


    DMANow(3, finalSpriteSheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, finalSpriteSheetTiles, &((charblock *)0x6000000)[4], 32768/2);



    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);


    goToStart();
}

void goToStart() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    DMANow(3, mainScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, mainScreenTiles, &((charblock *)0x6000000)[0], 64/2);
    DMANow(3, mainScreenMap, &((screenblock *)0x6000000)[28], 2048/2);
    state = START;
}

void start() {

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initGame();
        goToGame();

    }
}

void goToGame() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);






    DMANow(3, bg01Pal, ((unsigned short *)0x5000000), 512/2);

    DMANow(3, bg00Tiles, &((charblock *)0x6000000)[1], 13888/2);
    DMANow(3, bg00Map, &((screenblock *)0x6000000)[30], 4096/2);

    DMANow(3, bg01Tiles, &((charblock *)0x6000000)[0], 15040/2);
    DMANow(3, bg01Map, &((screenblock *)0x6000000)[28], 4096/2);

    state = GAME;
}

void game() {
    updateGame();
    drawGame();

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToWin();
    }
    if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        goToLose();
    }

}

void goToPause() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    DMANow(3, pauseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseScreenTiles, &((charblock *)0x6000000)[0], 64/2);
    DMANow(3, pauseScreenMap, &((screenblock *)0x6000000)[28], 2048/2);
    state = PAUSE;
}

void pause() {
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }
    if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }
}

void goToWin() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    DMANow(3, winScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, winScreenTiles, &((charblock *)0x6000000)[0], 64/2);
    DMANow(3, winScreenMap, &((screenblock *)0x6000000)[28], 2048/2);
    state = WIN;
}

void win() {
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToLose() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000014) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    DMANow(3, loseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseScreenTiles, &((charblock *)0x6000000)[0], 64/2);
    DMANow(3, loseScreenMap, &((screenblock *)0x6000000)[28], 2048/2);
    state = LOSE;
}

void lose() {
    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}
