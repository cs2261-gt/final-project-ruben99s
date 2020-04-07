# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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


    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} PLAYER;


extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern PLAYER player;






void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
# 3 "game.c" 2


enum {LEFT, RIGHT};
int direction;


enum {PLAYERRIGHT, PLAYERLEFT, PLAYERUP, PLAYERDOWN, PLAYERIDLE};


int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
PLAYER player;


void initGame() {
    vOff = 96;
    hOff = 0;
    initPlayer();
}

void drawGame() {
    drawPlayer();
}


void initPlayer() {
    player.height = 32;
    player.width = 32;
    player.colDelta = 1;
    player.rowDelta = 1;
    player.worldCol = 10;
    player.worldRow = 256 - player.height - 13;

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

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        player.aniState = PLAYERLEFT;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        player.aniState = PLAYERRIGHT;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        player.aniState = PLAYERUP;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
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
    shadowOAM[0].attr0 = (0xFF & player.screenRow) | (0<<14);
    shadowOAM[0].attr1 = (0x1FF & player.screenCol) | (2<<14);
    shadowOAM[0].attr2 = ((0)*32+(0)) | ((0)<<12);
}