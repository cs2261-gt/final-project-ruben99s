# 1 "balloon.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "balloon.c"
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
# 2 "balloon.c" 2
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
# 3 "balloon.c" 2
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
# 4 "balloon.c" 2
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
# 5 "balloon.c" 2
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
# 6 "balloon.c" 2
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
# 7 "balloon.c" 2







BALLOON allBalloons[5 * 2 + 2];

void initBalloons() {

    initBalloonsSingle();
    initBalloonsAOE();
    initJumpBalloon();
    initCheatBalloon();

}

void initBalloonsSingle() {
    for (int i = 0; i < 5; i++) {
        allBalloons[i].width = 12;
        allBalloons[i].height = 16;
        allBalloons[i].type = SINGLE;
        allBalloons[i].colDelta = player.colDelta;
        allBalloons[i].rowDelta = player.rowDelta;
        allBalloons[i].held = 0;
        allBalloons[i].active = 0;
        allBalloons[i].num = i;

        allBalloons[i].worldCol = player.worldCol + 16;
        allBalloons[i].worldRow = player.worldRow;
        allBalloons[i].screenCol = allBalloons[i].worldCol - hOff;
        allBalloons[i].screenRow = allBalloons[i].worldRow - vOff;

        allBalloons[i].prevWorldCol = allBalloons[i].worldCol;
        allBalloons[i].prevWorldRow = allBalloons[i].worldRow;

        allBalloons[i].aniState = 0;
        allBalloons[i].curFrame = 24;
        allBalloons[i].aniCounter = 0;
        allBalloons[i].numFrames = 3;

        if (i == 0) {
            allBalloons[i].active = 1;
            allBalloons[i].held = 1;
        }
    }
}

void initBalloonsAOE() {
    for (int i = 5; i < 5 * 2; i++) {
        allBalloons[i].width = 12;
        allBalloons[i].height = 16;
        allBalloons[i].type = AOE;
        allBalloons[i].colDelta = player.colDelta;
        allBalloons[i].rowDelta = player.rowDelta;
        allBalloons[i].held = 0;
        allBalloons[i].active = 0;
        allBalloons[i].num = i;

        allBalloons[i].radius = 50;

        allBalloons[i].worldCol = player.worldCol + 16;
        allBalloons[i].worldRow = player.worldRow;
        allBalloons[i].screenCol = allBalloons[i].worldCol - hOff;
        allBalloons[i].screenRow = allBalloons[i].worldRow - vOff;

        allBalloons[i].prevWorldCol = allBalloons[i].worldCol;
        allBalloons[i].prevWorldRow = allBalloons[i].worldRow;

        allBalloons[i].aniState = 2;
        allBalloons[i].curFrame = 24;
        allBalloons[i].aniCounter = 0;
        allBalloons[i].numFrames = 3;

        if (i == 5) {
            allBalloons[i].active = 1;
            allBalloons[i].held = 1;
        }
    }
}

void initJumpBalloon() {
    allBalloons[10].width = 12;
    allBalloons[10].height = 16;
    allBalloons[10].type = JUMP;
    allBalloons[10].colDelta = player.colDelta;
    allBalloons[10].rowDelta = player.rowDelta;
    allBalloons[10].held = 1;
    allBalloons[10].active = 1;
    allBalloons[10].num = 10;

    allBalloons[10].worldCol = player.worldCol + 16;
    allBalloons[10].worldRow = player.worldRow;
    allBalloons[10].screenCol = allBalloons[10].worldCol - hOff;
    allBalloons[10].screenRow = allBalloons[10].worldRow - vOff;

    allBalloons[10].aniState = 4;
    allBalloons[10].curFrame = 24;
    allBalloons[10].aniCounter = 0;
    allBalloons[10].numFrames = 3;
}

void initCheatBalloon() {
    allBalloons[11].width = 12;
    allBalloons[11].height = 16;
    allBalloons[11].type = CHEAT;
    allBalloons[11].colDelta = player.colDelta;
    allBalloons[11].rowDelta = player.rowDelta;
    allBalloons[11].held = 1;
    allBalloons[11].active = 1;
    allBalloons[11].num = 11;

    allBalloons[11].worldCol = player.worldCol + 16;
    allBalloons[11].worldRow = player.worldRow;
    allBalloons[11].screenCol = allBalloons[11].worldCol - hOff;
    allBalloons[11].screenRow = allBalloons[11].worldRow - vOff;

    allBalloons[11].aniState = 6;
    allBalloons[11].curFrame = 24;
    allBalloons[11].aniCounter = 0;
    allBalloons[11].numFrames = 3;
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


                updateDropBalloon(balloon);
            }
        }
    }

    balloon->screenCol = balloon->worldCol - hOff;
    balloon->screenRow = balloon->worldRow - vOff;

    animateBalloons(balloon);
}

void drawBalloons(BALLOON *balloon) {
    if (balloon->active) {
        shadowOAM[1 + balloon->num].attr0 = (0xFF & balloon->screenRow) | (0<<14);
        shadowOAM[1 + balloon->num].attr1 = (0x1FF & balloon->screenCol) | (1<<14);
        shadowOAM[1 + balloon->num].attr2 = ((balloon->curFrame)*32+(balloon->aniState)) | ((0)<<12);
    } else {
        shadowOAM[1 + balloon->num].attr0 = (2<<8);
    }
}

void updateHeldBalloon(BALLOON *balloon) {
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

void updateDropBalloon(BALLOON *balloon) {
    balloon->worldCol = balloon->prevWorldCol;
    balloon->worldRow = balloon->prevWorldRow;
}

void animateBalloons(BALLOON *balloon) {
    if (balloon->active) {
        if (balloon->aniCounter % 10 == 0) {
            balloon->curFrame = (balloon->curFrame - 24 + 2) % (balloon->numFrames * 2) + 24;
        }
        balloon->aniCounter++;
    }
}
