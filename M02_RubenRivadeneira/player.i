# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
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
# 2 "player.c" 2
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

extern PLAYER player;


void initPlayer(int *hOff, int *vOff);
void updatePlayer(const unsigned short *bitmap, int *hOff, int *vOff);
void animatePlayer();
void drawPlayer();
void playerAttack();
# 3 "player.c" 2
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
# 4 "player.c" 2
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
# 5 "player.c" 2
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
# 6 "player.c" 2

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
# 8 "player.c" 2

PLAYER player;

void initPlayer(int *hOff, int *vOff) {
    player.height = 30;
    player.width = 20;
    player.colDelta = 2;
    player.rowDelta = 2;
    player.worldCol = 10;
    player.worldRow = 256 - player.height - 14;
    player.prevWorldCol = player.worldCol;

    player.upLimit = player.worldRow - 100;
    player.downLimit = player.worldRow;

    player.screenCol = player.worldCol - *hOff;
    player.screenRow = player.worldRow - *vOff;

    player.jumping = 0;
    player.crouching = 0;

    player.health = 100;

    player.balloonTimer = 0;
    player.balloonType = SINGLE;
    player.lastBalloonType = 4;
    player.highJumpLimit = 0;


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

void updatePlayer(const unsigned short *bitmap, int *hOff, int *vOff) {
    player.prevWorldCol = player.worldCol;


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (player.worldCol + player.width + 12 - 1 < 512) {

            if (bitmap[((player.worldRow)*(512)+(player.worldCol + player.width - 1 + 1))] &&
                bitmap[((player.worldRow + player.height - 1)*(512)+(player.worldCol + player.width - 1 + 1))]) {

                player.worldCol += player.colDelta;

            }


            if (*hOff + 1 < 512 - 240 && player.screenCol > 240/4) {
                *hOff += player.colDelta;
            }
        }
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.worldCol >= 6) {

            if (bitmap[((player.worldRow)*(512)+(player.worldCol - 1))] &&
                bitmap[((player.worldRow + player.height - 1)*(512)+(player.worldCol - 1))]) {

                player.worldCol -= player.colDelta;

            }

            if (*hOff - 1 >= 0 && player.screenCol < 240/4) {
                *hOff -= player.colDelta;
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
        if (player.worldRow <= player.upLimit) {
            player.jumping = 0;
        } else {
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
        for (int i = 0; i < 8; i++) {
            if (bees[i].active && bees[i].screenCol >= 0 && bees[i].screenCol < 240) {
                bees[i].state = ANGRY;
            }
        }
    }

    if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {

        if (player.balloonType == SINGLE) {
            for (int i = 0; i < 5; i++) {
                allBalloons[i].active = 0;
                allBalloons[i].held = 0;
            }

            player.lastBalloonType = player.balloonType;
            player.balloonType = CHEAT;
            allBalloons[11].active = 1;
            allBalloons[11].held = 1;
        } else if (player.balloonType == CHEAT) {
            allBalloons[11].active = 0;
            allBalloons[11].held = 0;

            player.lastBalloonType = player.balloonType;
            player.balloonType = JUMP;
            allBalloons[10].active = 1;
            allBalloons[10].held = 1;
        } else if (player.balloonType == JUMP) {
            allBalloons[10].active = 0;
            allBalloons[10].held = 0;

            player.lastBalloonType = player.balloonType;
            player.balloonType = AOE;
            allBalloons[5].active = 1;
            allBalloons[5].held = 1;
        } else if (player.balloonType == AOE) {
            for (int i = 5; i < 5 * 2; i++) {
                allBalloons[i].active = 0;
                allBalloons[i].held = 0;
            }

            player.lastBalloonType = player.balloonType;
            player.balloonType = SINGLE;
            allBalloons[0].active = 1;
            allBalloons[0].held = 1;
        }
    }

    if ((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {

        if (player.balloonType == SINGLE) {
            for (int i = 0; i < 5; i++) {
                allBalloons[i].active = 0;
                allBalloons[i].held = 0;
            }

            player.lastBalloonType = player.balloonType;
            player.balloonType = AOE;
            allBalloons[5].active = 1;
            allBalloons[5].held = 1;
        } else if (player.balloonType == AOE) {

            for (int i = 5; i < 5 * 2; i++) {
                allBalloons[i].active = 0;
                allBalloons[i].held = 0;
            }

            player.lastBalloonType = player.balloonType;
            player.balloonType = JUMP;
            allBalloons[10].active = 1;
            allBalloons[10].held = 1;
        } else if (player.balloonType == JUMP) {
            allBalloons[10].active = 0;
            allBalloons[10].held = 0;

            player.lastBalloonType = player.balloonType;
            player.balloonType = CHEAT;
            allBalloons[11].active = 1;
            allBalloons[11].held = 1;
        } else if (player.balloonType == CHEAT) {
            allBalloons[11].active = 0;
            allBalloons[11].held = 0;

            player.lastBalloonType = player.balloonType;
            player.balloonType = SINGLE;
            allBalloons[0].active = 1;
            allBalloons[0].held = 1;
        }
    }


    if (player.balloonType == JUMP) {
        player.upLimit = 90;
    } else {
        player.upLimit = 150;
    }


    if (!player.jumping) {

        if (bitmap[((player.worldRow + player.height - 1 + player.rowDelta)*(512)+(player.worldCol))] &&
            bitmap[((player.worldRow + player.height - 1 + player.rowDelta)*(512)+(player.worldCol + player.width - 1))]) {

            player.worldRow += player.rowDelta;

        }
    }
    if (player.jumping) {

        if (bitmap[((player.worldRow - player.rowDelta)*(512)+(player.worldCol))] &&
            bitmap[((player.worldRow - player.rowDelta)*(512)+(player.worldCol + player.width - 1))]) {

            player.worldRow -= player.rowDelta;
        }
    }


    player.screenCol = player.worldCol - *hOff;
    player.screenRow = player.worldRow - *vOff;

    animatePlayer();
}

void playerAttack() {
    if (player.balloonType == SINGLE) {
        for (int i = 0; i < 5; i++) {
            if (allBalloons[i].active && allBalloons[i].held) {
                allBalloons[i].held = 0;
                break;
            }
        }
    }
    if (player.balloonType == AOE) {
        for (int i = 5; i < 5 * 2; i++) {
            if (allBalloons[i].active && allBalloons[i].held) {
                allBalloons[i].held = 0;
                break;
            }
        }
    }
}
