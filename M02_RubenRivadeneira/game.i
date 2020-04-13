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



int direction;


enum {PLAYERRIGHT, PLAYERLEFT, PLAYERUP, PLAYERDOWN, PLAYERIDLE};


enum {SINGLE, AOE};


int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
PLAYER player;
BALLOON balloons[5];
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




void initPlayer() {
    player.height = 30;
    player.width = 20;
    player.colDelta = 2;
    player.rowDelta = 2;
    player.worldCol = 10;
    player.worldRow = 256 - player.height - 14;
    player.prevWorldCol = player.worldCol;

    player.upLimit = player.worldRow - 100;
    player.downLimit = player.worldRow;

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

    player.jumping = 0;
    player.crouching = 0;

    player.balloonTimer = 0;


    player.health = 10;


    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 4;
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
        direction = LEFT;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        player.aniState = PLAYERRIGHT;
        direction = RIGHT;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (direction == RIGHT) {
            player.aniState = PLAYERRIGHT;
        }
        if (direction == LEFT) {
            player.aniState = PLAYERLEFT;
        }
        player.curFrame = 4;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (direction == RIGHT) {
            player.aniState = PLAYERRIGHT;
        }
        if (direction == LEFT) {
            player.aniState = PLAYERLEFT;
        }
        player.curFrame = 5;
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
    shadowOAM[0].attr2 = ((player.curFrame * 4)*32+(player.aniState * 4)) | ((0)<<12);
}

void updatePlayer() {
    player.prevWorldCol = player.worldCol;


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (player.worldCol + player.width - 1 < 512) {
            player.worldCol += player.colDelta;

            if (hOff + 1 < 512 - 240 && player.screenCol > 240/4) {
                hOff += player.colDelta;
            }
        }
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.worldCol >= 0) {
            player.worldCol -= player.colDelta;

            if (hOff - 1 >= 0 && player.screenCol < 240/4) {
                hOff -= player.colDelta;
            }
        }
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        player.crouching = 1;
        player.height = 22;
        player.worldCol = player.prevWorldCol;
    } else {
        player.crouching = 0;
        player.height = 30;
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
         if (player.worldRow >= player.downLimit) {
            player.jumping = 1;
        }
    } else {
        player.jumping = 0;
    }


    if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && player.balloonTimer >= 10) {
        playerAttack();
        player.balloonTimer = 0;
    }
    player.balloonTimer++;



    if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        for (int i = 0; i < 3; i++) {
            if (bees[i].active && bees[i].screenCol >= 0 && bees[i].screenCol < 240) {
                bees[i].state = ANGRY;
            }
        }
    }


    if (!player.jumping && player.worldRow < player.downLimit) {
        player.worldRow += player.rowDelta;
    }
    if (player.jumping) {
        player.worldRow -= player.rowDelta;
        if (player.worldRow <= player.upLimit) {
            player.jumping = 0;
        }
    }

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

    animatePlayer();
}

void playerAttack() {
    for (int i = 0; i < 5; i++) {
        if (balloons[i].active && balloons[i].held) {
            balloons[i].held = 0;
            break;
        }
    }







}
# 264 "game.c"
void initBalloons() {
    for (int i = 0; i < 5; i++) {
        balloons[i].width = 12;
        balloons[i].height = 16;
        balloons[i].type = SINGLE;
        balloons[i].colDelta = player.colDelta;
        balloons[i].rowDelta = player.rowDelta;
        balloons[i].held = 0;
        balloons[i].active = 0;
        balloons[i].num = i;

        balloons[i].worldCol = player.worldCol + 16;
        balloons[i].worldRow = player.worldRow;
        balloons[i].screenCol = balloons[i].worldCol - hOff;
        balloons[i].screenRow = balloons[i].worldRow - vOff;

        balloons[i].prevWorldCol = balloons[i].worldCol;
        balloons[i].prevWorldRow = balloons[i].worldRow;

        if (i == 0) {
            balloons[i].active = 1;
            balloons[i].held = 1;
        }
    }
}

void updateBalloons(BALLOON *balloon) {
    if (balloon->active) {
        if (balloon->screenCol < 0 || balloon->screenCol >= 240) {
            balloon->active = 0;
            balloon->held = 0;
            balloon->worldCol = player.worldCol + 16;
            balloon->worldRow = player.worldRow;
            balloon->prevWorldCol = balloon->worldCol;
            balloon->prevWorldRow = balloon->worldRow;
        } else {
            balloon->prevWorldCol = balloon->worldCol;
            balloon->prevWorldRow = balloon->worldRow;

            if (balloon->held) {
                updateHeldBalloon(balloon);
            } else if (!balloon->held) {
                balloon->worldCol = balloon->prevWorldCol;
                balloon->worldRow = balloon->prevWorldRow;
            }
        }
    }

    balloon->screenCol = balloon->worldCol - hOff;
    balloon->screenRow = balloon->worldRow - vOff;
}

void drawBalloons(BALLOON *balloon) {
     if (balloon->active) {
        shadowOAM[10 + balloon->num].attr0 = (0xFF & balloon->screenRow) | (0<<14);
        shadowOAM[10 + balloon->num].attr1 = (0x1FF & balloon->screenCol) | (1<<14);
        shadowOAM[10 + balloon->num].attr2 = ((24)*32+(0)) | ((0)<<12);
    } else {
        shadowOAM[10 + balloon->num].attr0 = (2<<8);
    }
}

void updateHeldBalloon(BALLOON *balloon) {
    if (balloon->held && balloon->active) {
        if (player.aniState == PLAYERRIGHT) {
            switch(player.curFrame) {
                case 0:
                    balloon->worldCol = player.worldCol + 16;
                    balloon->worldRow = player.worldRow;
                    break;
                case 1:
                    balloon->worldCol = player.worldCol + 18;
                    balloon->worldRow = player.worldRow;
                    break;
                case 2:
                    balloon->worldCol = player.worldCol + 18;
                    balloon->worldRow = player.worldRow - 6;
                    break;
                case 3:
                    balloon->worldCol = player.worldCol + 16;
                    balloon->worldRow = player.worldRow;
                    break;
                case 4:
                    balloon->worldCol = player.worldCol + 18;
                    balloon->worldRow = player.worldRow - 6;
                    break;
                case 5:
                    balloon->worldCol = player.worldCol + 13;
                    balloon->worldRow = player.worldRow + 16;
                    break;
            }
        }

        if (player.aniState == PLAYERLEFT) {
            switch(player.curFrame) {
                case 0:
                    balloon->worldCol = player.worldCol;
                    balloon->worldRow = player.worldRow;
                    break;
                case 1:
                    balloon->worldCol = player.worldCol - 2;
                    balloon->worldRow = player.worldRow;
                    break;
                case 2:
                    balloon->worldCol = player.worldCol - 2;
                    balloon->worldRow = player.worldRow - 6;
                    break;
                case 3:
                    balloon->worldCol = player.worldCol;
                    balloon->worldRow = player.worldRow;
                    break;
                case 4:
                    balloon->worldCol = player.worldCol - 2;
                    balloon->worldRow = player.worldRow - 6;
                    break;
                case 5:
                    balloon->worldCol = player.worldCol + 3;
                    balloon->worldRow = player.worldRow + 16;
                    break;
            }
        }
    }
}
