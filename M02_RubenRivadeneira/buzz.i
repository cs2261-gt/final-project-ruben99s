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

typedef enum {LEFT, RIGHT};
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

    int health;

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
} HONEY;


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
# 4 "buzz.c" 2
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
    int balloonType;
    int lastBalloonType;
    int highJumpLimit;

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

typedef struct {
    int screenCol;
    int screenRow;
    int width;
    int num;
    int aniState;
    int active;
} HEART;

extern PLAYER player;
extern HEART healthMeter[];



void initPlayer(int *hOff, int *vOff);
void updatePlayer(const unsigned short *bitmap, int *hOff, int *vOff);
void animatePlayer();
void drawPlayer();
void playerAttack();

void initHearts();
void updateHearts();
void drawHearts();
# 5 "buzz.c" 2
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

    int radius;

    int aniState;
    int curFrame;
    int aniCounter;
    int numFrames;
} BALLOON;

typedef enum {
    SINGLE,
    AOE,
    JUMP,
    CHEAT
};


extern BALLOON allBalloons[];
# 46 "balloon.h"
void initBalloons();
void initBalloonsSingle();
void initBalloonsAOE();
void initJumpBalloon();
void initCheatBalloon();

void updateBalloons();
void drawBalloons();
void animateBalloons();
void updateHeldBalloon();
void updateDropBalloon();
# 6 "buzz.c" 2
# 1 "game1.h" 1



extern int hOff;
extern int vOff;

extern int remainingEnemies;
extern int numBalloons;
extern int direction;
extern int isPlayerEndL1;
extern int playerHealth;







void initGame1();
void updateGame1();
void drawGame1();
# 7 "buzz.c" 2
# 1 "game2.h" 1



extern int hOff;
extern int vOff;

extern int remainingEnemies;
extern int numBalloons;
extern int direction;
extern int isPlayerEndL2;
extern int playerHealth;







void initGame2();
void updateGame2();
void drawGame2();
# 8 "buzz.c" 2


BUZZ bees[13];
int healthTimer;

void initBuzz() {
    healthTimer = 0;
    for (int i = 0; i < 13; i++) {
        bees[i].height = 20;
        bees[i].width = 23;
        bees[i].active = 0;
        bees[i].state = CALM;
        bees[i].direction = LEFT;
        bees[i].colDelta = 1;
        bees[i].rowDelta = 1;
        bees[i].num = i;
        bees[i].erased = 0;
        bees[i].health = 100;

        bees[i].worldRow = 256 - 33 - bees[i].height;
        bees[i].worldCol = 240 + (30 * i);
        bees[i].screenRow = bees[i].worldRow - vOff;
        if (i > 7) {
            bees[i].worldCol = (23 * i);

            bees[i].state = ANGRY;
        }


        bees[i].rightLimit = bees[i].worldCol + bees[i].width + 35;
        bees[i].leftLimit = bees[i].worldCol - 35;

        bees[i].aniState = 3;
        bees[i].curFrame = 0;
    }
}

void drawBuzz(BUZZ *buzz) {
    if (buzz->active) {
        shadowOAM[37 + buzz->num].attr0 = (0xFF & buzz->screenRow) | (0<<14);
        shadowOAM[37 + buzz->num].attr1 = (0x1FF & buzz->screenCol) | (2<<14);
        shadowOAM[37 + buzz->num].attr2 = ((buzz->curFrame * 4)*32+(buzz->aniState * 4)) | ((0)<<12);
    } else {
        shadowOAM[37 + buzz->num].attr0 = (2<<8);
    }
}

void updateBuzz(BUZZ *buzz) {
    if (buzz->num < 8) {
        int screenCol = buzz->worldCol - hOff;
        if (screenCol >= 0 && screenCol < 240 && !buzz->erased) {
            buzz->screenCol = screenCol;
            buzz->active = 1;
        }
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


        for (int i = 0; i < 5 * 2 + 2; i++) {
            if (allBalloons[i].active && !allBalloons[i].held) {
                if (collision(allBalloons[i].worldCol, allBalloons[i].worldRow, allBalloons[i].width, allBalloons[i].height,
                buzz->worldCol, buzz->worldRow, buzz->width, buzz->height)) {

                    if (allBalloons[i].type == SINGLE) {
                        buzz->health -= 100;
                    }
                    if (allBalloons[i].type == AOE) {

                        int rightLimit = allBalloons[i].worldCol + allBalloons[i].width + allBalloons[i].radius;
                        int leftLimit = allBalloons[i].worldCol - allBalloons[i].radius;
                        for (int i = 0; i < 13; i++) {
                            if (bees[i].worldCol >= leftLimit && bees[i].worldCol < rightLimit) {
                                bees[i].health -= 34;
                            }
                        }
                    }

                    allBalloons[i].active = 0;
                }
            }
        }

        if (buzz->health <= 0) {
            buzz->active = 0;
            buzz->erased = 1;
            remainingEnemies--;
        }


        if (collision(player.worldCol, player.worldRow, player.width, player.height,
            buzz->worldCol, buzz->worldRow, buzz->width, buzz->height)) {
                if (healthTimer % 75 == 0) {
                    player.health -= 5;
                    healthTimer = 0;
                    updateHearts();
                }
                healthTimer++;
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
# 164 "buzz.c"
        if (buzz->direction == LEFT) {
            buzz->aniState = 3;
        }
        if (buzz->direction == RIGHT) {
            buzz->aniState = 2;
        }
        if (buzz->state == ANGRY) {
            buzz->curFrame = 3;
        }


    }
}
