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
    int active;
} BULLET;

typedef enum {
    LEFT,
    RIGHT
};


extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern int remainingEnemies;
extern int numBalloons;
extern int direction;







void initGame();
void updateGame();
void drawGame();
# 3 "game.c" 2
# 1 "buzz.h" 1


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
    int erased;

    int rightLimit;
    int leftLimit;
    int direction;
    int state;
    int num;

    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} BUZZ;


typedef enum {
    CALM,
    ANGRY
};


extern BUZZ bees[];





void initBuzz();
void updateBuzz(BUZZ *buzz);
void animateBuzz(BUZZ *buzz);
void drawBuzz(BUZZ *buzz);
# 4 "game.c" 2
# 1 "player.h" 1



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

    int balloonTimer;

    int health;


    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} PLAYER;

typedef enum {
    PLAYERRIGHT,
    PLAYERLEFT,
    PLAYERUP,
    PLAYERDOWN,
    PLAYERIDLE
};

extern PLAYER player;


void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void playerAttack();
# 5 "game.c" 2
# 1 "balloon.h" 1


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
    int prevWorldRow;

    int active;
    int type;
    int held;
    int num;
} BALLOON;

typedef enum {
    SINGLE,
    AOE,
    JUMP,
    CHEAT
};



extern BALLOON balloons[];



void initBalloons();
void updateBalloons();
void drawBalloons();
void animateBalloons();
void updateHeldBalloon();
# 6 "game.c" 2

int direction;


int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
int remainingEnemies;
int numBalloons;


void initGame() {
    vOff = 96;
    hOff = 0;
    direction = RIGHT;
    remainingEnemies = 3;
    numBalloons = 0;
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000016) = vOff;
    initPlayer();
    initBuzz();
    initBalloons();
}

void updateGame() {
    int numActiveBalloons = 0;

    updatePlayer();
    for (int i = 0; i < 3; i++) {
        updateBuzz(&bees[i]);
    }
    for (int i = 0; i < 5; i++) {
        updateBalloons(&balloons[i]);
        if (balloons[i].active) {
            numActiveBalloons++;
        }
    }
    if (numActiveBalloons < 5) {
        for (int i = 0; i < 5; i++) {
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
    for (int i = 0; i < 3; i++) {
        drawBuzz(&bees[i]);
    }
    for (int i = 0; i < 5; i++) {
        drawBalloons(&balloons[i]);
    }
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000014) = hOff/2;
}
