# 1 "ant.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "ant.c"
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
# 2 "ant.c" 2
# 1 "ant.h" 1


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
    int num;

    int health;

    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
} ANT;


extern ANT ants[];



void initAnts();
void updateAnts(ANT *ant, const unsigned short *bitmap);
void animateAnts(ANT *ant);
void drawAnt(ANT *ant);
# 3 "ant.c" 2
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
# 4 "ant.c" 2
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



void initPlayer(int *hOff, int *vOff, int level);
void updatePlayer(const unsigned short *bitmap, int *hOff, int *vOff, int level);
void animatePlayer();
void drawPlayer();
void playerAttack();

void initHearts();
void updateHearts();
void drawHearts();
# 5 "ant.c" 2
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
# 6 "ant.c" 2

ANT ants[15];
int healthTimer;

void initAnts() {
    healthTimer = 0;
    for (int i = 0; i < 15; i++) {
        ants[i].num = i;
        ants[i].height = 14;
        ants[i].width = 15;
        ants[i].colDelta = 1;
        ants[i].rowDelta = 2;
        ants[i].health = 30;
        ants[i].direction = LEFT;
        ants[i].worldRow = 180;
        ants[i].worldCol = 110 + ((ants[i].width + 10) * i);

        ants[i].screenRow = ants[i].worldRow - vOff;

        ants[i].active = 0;
        ants[i].erased = 0;

        ants[i].aniCounter = 0;
        ants[i].aniState = 10;
        ants[i].curFrame = 24;
        ants[i].numFrames = 3;

    }
}

void updateAnts(ANT *ant, const unsigned short *bitmap) {
    int screenCol = ant->worldCol - hOff;
    if (screenCol >= 0 && screenCol < 240 && !ant->erased) {
        ant->screenCol = screenCol;
        ant->active = 1;
    }

    if (ant->active && ant->health <= 0) {
        ant->active = 0;
        ant->erased = 1;
        remainingEnemiesL1--;
    }

    if (ant->active) {

        if (player.worldCol <= ant->worldCol) {
            ant->direction = LEFT;
        } else {
            ant->direction = RIGHT;
        }

        if (ant->direction == LEFT) {
            if (bitmap[((ant->worldRow)*(512)+(ant->worldCol - 1))] &&
                bitmap[((ant->worldRow + ant->height - 1)*(512)+(ant->worldCol - 1))]) {

                ant->worldCol -= ant->colDelta;

            }


        }
        if (ant->direction == RIGHT) {
            if (bitmap[((ant->worldRow)*(512)+(ant->worldCol + ant->width - 1 + 1))] &&
                bitmap[((ant->worldRow + ant->height - 1)*(512)+(ant->worldCol + ant->width - 1 + 1))]) {

                ant->worldCol += ant->colDelta;

            }

        }


        if (bitmap[((ant->worldRow + ant->height - 1 + ant->rowDelta)*(512)+(ant->worldCol))] &&
            bitmap[((ant->worldRow + ant->height - 1 + ant->rowDelta)*(512)+(ant->worldCol + ant->width - 1))]) {

            ant->worldRow += ant->rowDelta;

        }


        for (int i = 0; i < 5 * 2 + 2; i++) {
            if (allBalloons[i].active && !allBalloons[i].held) {
                if (collision(allBalloons[i].worldCol, allBalloons[i].worldRow, allBalloons[i].width, allBalloons[i].height,
                ant->worldCol, ant->worldRow, ant->width, ant->height)) {

                    if (allBalloons[i].type == SINGLE) {
                        ant->health -= 100;
                    }
                    if (allBalloons[i].type == AOE) {

                        int rightLimit = allBalloons[i].worldCol + allBalloons[i].width + allBalloons[i].radius;
                        int leftLimit = allBalloons[i].worldCol - allBalloons[i].radius;
                        for (int i = 0; i < 15; i++) {
                            if (ants[i].worldCol >= leftLimit && ants[i].worldCol < rightLimit) {
                                ants[i].health -= 34;
                            }
                        }
                    }

                    allBalloons[i].active = 0;
                }
            }
        }

        if (collision(player.worldCol, player.worldRow, player.width, player.height,
            ant->worldCol, ant->worldRow, ant->width, ant->height)) {
            if (healthTimer % 150 == 0) {
                player.health -= 2;
                healthTimer = 0;
                updateHearts();
            }
            healthTimer++;
        }
    }


    ant->screenCol = ant->worldCol - hOff;
    ant->screenRow = ant->worldRow - vOff;
    animateAnts(ant);
}

void animateAnts(ANT *ant) {
    if (ant->active) {

        if (ant->aniCounter % 10 == 0) {
            ant->curFrame = (ant->curFrame - 24 + 2) % (ant->numFrames * 2) + 24;
        }

        if (ant->direction == LEFT) {
            ant->aniState = 10;
        }
        if (ant->direction == RIGHT) {
            ant->aniState = 8;
        }
        ant->aniCounter++;
    }
}

void drawAnt(ANT *ant) {
    if (ant->active) {
        shadowOAM[52 + ant->num].attr0 = (0xFF & ant->screenRow) | (0<<14);
        shadowOAM[52 + ant->num].attr1 = (0x1FF & ant->screenCol) | (1<<14);
        shadowOAM[52 + ant->num].attr2 = ((ant->curFrame)*32+(ant->aniState)) | ((0)<<12);
    } else {
        shadowOAM[52 + ant->num].attr0 = (2<<8);
    }
}
