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
extern int remainingEnemies;
# 105 "game.h"
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
void animateBalloons();
# 3 "game.c" 2


enum {LEFT, RIGHT};
int direction;


enum {PLAYERRIGHT, PLAYERLEFT, PLAYERUP, PLAYERDOWN, PLAYERIDLE};


enum {CALM, ANGRY};


enum {SINGLE, AOE};


int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
PLAYER player;
BUZZ enemies[1];
BALLOON balloons[5];
int remainingEnemies;


void initGame() {
    vOff = 96;
    hOff = 0;
    direction = RIGHT;
    remainingEnemies = 1;
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000016) = vOff;
    initPlayer();
    initBuzz();
    initBalloons();
}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < 1; i++) {
        updateBuzz(&enemies[i]);
    }
    for (int i = 0; i < 5; i++) {
        updateBalloons(&balloons[i]);
    }
}

void drawGame() {
    drawPlayer();
    for (int i = 0; i < 1; i++) {
        drawBuzz(&enemies[i]);
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
        if (player.worldCol + player.width - 1 < 2048) {
            player.worldCol += player.colDelta;

            if (hOff + 1 < 2048 - 240 && player.screenCol > 240/4) {
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

    if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && player.balloonTimer >= 15) {
        playerAttack();
        player.balloonTimer = 0;
    }
    player.balloonTimer++;

    if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        for (int i = 0; i < 1; i++) {
            if (enemies[i].active && enemies[i].screenCol >= 0 && enemies[i].screenCol < 240) {
                enemies[i].state = ANGRY;
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
        }
        if (!balloons[i].active) {
            balloons[i].active = 1;
            balloons[i].held = 1;
            animateBalloons(&balloons[i]);
            break;
        }
    }
}




void initBuzz() {
    for (int i = 0; i < 1; i++) {
        enemies[i].height = 20;
        enemies[i].width = 23;
        enemies[i].active = 0;
        enemies[i].state = CALM;
        enemies[i].direction = LEFT;
        enemies[i].colDelta = 1;
        enemies[i].rowDelta = 1;

        enemies[i].worldRow = 256 - 33 - enemies[i].height;
        enemies[i].worldCol = 240 + (10 * i);
        enemies[i].screenRow = enemies[i].worldRow - vOff;


        enemies[i].rightLimit = enemies[i].worldCol + enemies[i].width + 35;
        enemies[i].leftLimit = enemies[i].worldCol - 35;

        enemies[i].aniState = 3;
    }
}

void drawBuzz(BUZZ *enemy) {
    if (enemy->active) {
        shadowOAM[1].attr0 = (0xFF & enemy->screenRow) | (0<<14);
        shadowOAM[1].attr1 = (0x1FF & enemy->screenCol) | (2<<14);
        shadowOAM[1].attr2 = ((0 * 4)*32+(enemy->aniState * 4)) | ((0)<<12);
    }
}

void updateBuzz(BUZZ *enemy) {
    int screenCol = enemy->worldCol - hOff;
    if (screenCol >= 0 && screenCol < 240) {
        enemy->screenCol = screenCol;
        enemy->active = 1;
    }

    if (enemy->active) {

        if (enemy->state == CALM) {
            if (enemy->direction == LEFT) {
                if (enemy->worldCol > enemy->leftLimit) {
                    enemy->worldCol -= enemy->colDelta;
                } else {
                    enemy->direction = RIGHT;
                }
            }

            if (enemy->direction == RIGHT) {
                if (enemy->worldCol < enemy->rightLimit) {
                    enemy->worldCol += enemy->colDelta;
                } else {
                    enemy->direction = LEFT;
                }
            }
        }

        if (enemy->state == ANGRY) {
            if (player.worldCol <= enemy->worldCol) {
                enemy->direction = LEFT;
            } else {
                enemy->direction = RIGHT;
            }

            if (enemy->direction == LEFT) {
                enemy->worldCol -= enemy->colDelta;
            }
            if (enemy->direction == RIGHT) {
                enemy->worldCol += enemy->colDelta;
            }
        }


        for (int i = 0; i < 5; i++) {
            if (balloons[i].active && !balloons[i].held &&
                collision(balloons[i].worldCol, balloons[i].worldRow, balloons[i].width, balloons[i].height,
                enemy->worldCol, enemy->worldRow, enemy->width, enemy->height)) {
                    balloons[i].active = 0;
                    enemy->active = 0;
                    remainingEnemies--;
            }
        }


        if (collision(player.worldCol, player.worldRow, player.width, player.height,
            enemy->worldCol, enemy->worldRow, enemy->width, enemy->height)) {
                player.health = 0;
        }



        if (player.worldCol >= enemy->leftLimit && player.worldCol <= enemy->rightLimit) {
            enemy->state = ANGRY;
        }
    }

    enemy->screenCol = enemy->worldCol - hOff;
    enemy->screenRow = enemy->worldRow - vOff;
    animateBuzz(enemy);
}

void animateBuzz(BUZZ *enemy) {
    if (enemy->direction == LEFT) {
        enemy->aniState = 3;
    }
    if (enemy->direction == RIGHT) {
        enemy->aniState = 2;
    }
}




void initBalloons() {
    for (int i = 0; i < 5; i++) {
        balloons[i].width = 12;
        balloons[i].height = 16;
        balloons[i].type = SINGLE;
        balloons[i].worldCol = player.worldCol + 16;
        balloons[i].worldRow = player.worldRow;
        balloons[i].screenCol = balloons[i].worldCol - hOff;
        balloons[i].screenRow = balloons[i].worldRow - vOff;
        balloons[i].colDelta = player.colDelta;
        balloons[i].rowDelta = player.rowDelta;
        balloons[i].held = 0;
        balloons[i].active = 0;
        balloons[i].prevWorldCol = balloons[i].worldCol;
        balloons[i].prevWorldRow = balloons[i].worldRow;
        if (i == 0) {
            balloons[i].active = 1;
            balloons[i].held = 1;
        }
        balloons[i].num = i;
    }
}

void updateBalloons(BALLOON *balloon) {
    if (balloon->active) {

        balloon->prevWorldCol = balloon->worldCol;
        balloon->prevWorldRow = balloon->worldRow;

        if (balloon->held) {
            animateBalloons(balloon);
        }

        if (!balloon->held) {
            balloon->worldCol = balloon->prevWorldCol;
            balloon->worldRow = balloon->prevWorldRow;
        }
    }
    balloon->screenCol = balloon->worldCol - hOff;
    balloon->screenRow = balloon->worldRow - vOff;
}

void drawBalloons(BALLOON *balloon) {
     if (balloon->active) {
        shadowOAM[2 + balloon->num].attr0 = (0xFF & balloon->screenRow) | (0<<14);
        shadowOAM[2 + balloon->num].attr1 = (0x1FF & balloon->screenCol) | (1<<14);
        shadowOAM[2 + balloon->num].attr2 = ((24)*32+(0)) | ((1)<<12);
    }
}

void animateBalloons(BALLOON *balloon) {
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

    balloon->screenCol = balloon->worldCol - hOff;
    balloon->screenRow = balloon->worldRow - vOff;
}
