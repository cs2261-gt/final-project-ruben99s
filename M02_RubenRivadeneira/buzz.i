# 1 "buzz.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "buzz.c"
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
# 2 "buzz.c" 2
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
# 3 "buzz.c" 2
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

    int balloonTimer;

    int health;


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

    int prevWorldCol;
    int prevWorldRow;

    int active;
    int type;
    int held;
    int num;
} BALLOON;
# 78 "game.h"
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
extern PLAYER player;

extern BALLOON balloons[];
extern int remainingEnemies;
extern int numBalloons;
# 113 "game.h"
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void playerAttack();







void initBalloons();
void updateBalloons();
void drawBalloons();
void animateBalloons();
void updateHeldBalloon();
# 4 "buzz.c" 2

BUZZ bees[3];

void initBuzz() {
    for (int i = 0; i < 3; i++) {
        bees[i].height = 20;
        bees[i].width = 23;
        bees[i].active = 0;
        bees[i].state = CALM;
        bees[i].direction = LEFT;
        bees[i].colDelta = 1;
        bees[i].rowDelta = 1;
        bees[i].num = i;
        bees[i].erased = 0;

        bees[i].worldRow = 256 - 33 - bees[i].height;
        bees[i].worldCol = 240 + (30 * i);
        bees[i].screenRow = bees[i].worldRow - vOff;


        bees[i].rightLimit = bees[i].worldCol + bees[i].width + 35;
        bees[i].leftLimit = bees[i].worldCol - 35;

        bees[i].aniState = 3;
    }
}

void drawBuzz(BUZZ *buzz) {
    if (buzz->active) {
        shadowOAM[1 + buzz->num].attr0 = (0xFF & buzz->screenRow) | (0<<14);
        shadowOAM[1 + buzz->num].attr1 = (0x1FF & buzz->screenCol) | (2<<14);
        shadowOAM[1 + buzz->num].attr2 = ((0 * 4)*32+(buzz->aniState * 4)) | ((0)<<12);
    } else {
        shadowOAM[1 + buzz->num].attr0 = (2<<8);
    }
}

void updateBuzz(BUZZ *buzz) {
    int screenCol = buzz->worldCol - hOff;
    if (screenCol >= 0 && screenCol < 240 && !buzz->erased) {
        buzz->screenCol = screenCol;
        buzz->active = 1;
    }

    if (buzz->active) {

        if (buzz->state == CALM) {
            if (buzz->direction == LEFT) {
                if (buzz->worldCol > buzz->leftLimit) {
                    buzz->worldCol -= buzz->colDelta;
                } else {
                    buzz->direction = RIGHT;
                }
            }

            if (buzz->direction == RIGHT) {
                if (buzz->worldCol < buzz->rightLimit) {
                    buzz->worldCol += buzz->colDelta;
                } else {
                    buzz->direction = LEFT;
                }
            }
        }


        if (buzz->state == ANGRY) {
            if (player.worldCol <= buzz->worldCol) {
                buzz->direction = LEFT;
            } else {
                buzz->direction = RIGHT;
            }

            if (buzz->direction == LEFT) {
                buzz->worldCol -= buzz->colDelta;
            }
            if (buzz->direction == RIGHT) {
                buzz->worldCol += buzz->colDelta;
            }
        }


        for (int i = 0; i < 5; i++) {
            if (balloons[i].active && !balloons[i].held) {
                if (collision(balloons[i].worldCol, balloons[i].worldRow, balloons[i].width, balloons[i].height,
                buzz->worldCol, buzz->worldRow, buzz->width, buzz->height)) {
                    balloons[i].active = 0;
                    buzz->active = 0;
                    buzz->erased = 1;
                    remainingEnemies--;
                }
            }
        }


        if (collision(player.worldCol, player.worldRow, player.width, player.height,
            buzz->worldCol, buzz->worldRow, buzz->width, buzz->height)) {
                player.health = 0;
        }



        if (player.worldCol >= buzz->leftLimit && player.worldCol <= buzz->rightLimit) {
            buzz->state = ANGRY;
        }
    }

    buzz->screenCol = buzz->worldCol - hOff;
    buzz->screenRow = buzz->worldRow - vOff;
    animateBuzz(buzz);
}

void animateBuzz(BUZZ *buzz) {
    if (buzz->active) {
        if (buzz->direction == LEFT) {
            buzz->aniState = 3;
        }
        if (buzz->direction == RIGHT) {
            buzz->aniState = 2;
        }
    }
}
