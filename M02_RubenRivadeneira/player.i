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
void updateBuzz(BUZZ *buzz, int level);
void animateBuzz(BUZZ *buzz);
void drawBuzz(BUZZ *buzz);
# 5 "player.c" 2
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
# 6 "player.c" 2
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
# 7 "player.c" 2

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
# 9 "player.c" 2
# 1 "game2.h" 1



extern int hOff;
extern int vOff;

extern int remainingEnemiesL2;
extern int numBalloons;
extern int direction;
extern int isPlayerEndL2;
extern int playerHealth;







void initGame2();
void updateGame2();
void drawGame2();
# 10 "player.c" 2
# 1 "queenBee.h" 1


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

    int health;
    int direction;

    int aniCounter;
    int aniState;
    int curFrame;
    int numFrame;
} QUEENBEE;

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
    int num;

    int curFrame;
} STINGER;

extern QUEENBEE queenBee;
extern STINGER stingers[];



void initQueenBee();
void initStingers();
void updateQueenBee(const unsigned short *bitmap);
void updateStingers(STINGER *stinger);
void drawQueenBee();
void drawStingers(STINGER *stinger);
# 11 "player.c" 2

PLAYER player;
HEART healthMeter[20];
int lostHearts = 0;
int jumpPower = 1500;

void initPlayer(int *hOff, int *vOff, int level) {
    player.height = 30;
    player.width = 20;
    player.colDelta = 2;
    player.rowDelta = 2;
    player.worldCol = 10;
    player.worldRow = ((256 - player.height - 18) << 8);
    player.prevWorldCol = player.worldCol;

    player.upLimit = ((player.worldRow) >> 8) - 100;
    player.downLimit = ((player.worldRow) >> 8);

    player.screenCol = player.worldCol - *hOff;
    player.screenRow = ((player.worldRow) >> 8) - *vOff;

    player.jumping = 1;
    player.crouching = 0;

    if (level == 0) {
        player.health = 100;
        initHearts();
    }

    player.balloonTimer = 0;
    player.balloonType = SINGLE;
    player.lastBalloonType = 4;
    player.highJumpLimit = 0;



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

    for (int i = 0; i < 20; i++) {
        drawHearts(&healthMeter[i]);
    }
}

void updatePlayer(const unsigned short *bitmap, int *hOff, int *vOff, int level) {
    player.prevWorldCol = player.worldCol;


    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (player.worldCol + player.width + 12 - 1 < 512) {

            if (bitmap[((((player.worldRow) >> 8))*(512)+(player.worldCol + player.width - 1 + 1))] &&
                bitmap[((((player.worldRow) >> 8) + player.height - 1)*(512)+(player.worldCol + player.width - 1 + 1))]) {

                player.worldCol += player.colDelta;

            }


            if (*hOff + 1 < 512 - 240 && player.screenCol > 240/4) {
                *hOff += player.colDelta;
            }
        }
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.worldCol >= 6) {

            if (bitmap[((((player.worldRow) >> 8))*(512)+(player.worldCol - 1))] &&
                bitmap[((((player.worldRow) >> 8) + player.height - 1)*(512)+(player.worldCol - 1))]) {

                player.worldCol -= player.colDelta;

            }

            if (*hOff - 1 >= 0 && player.screenCol < 240/4) {
                *hOff -= player.colDelta;
            }
        }
    }

    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        player.crouching = 1;

        player.worldCol = player.prevWorldCol;
    } else {
        player.crouching = 0;

    }


    if (player.rowDelta < 500) {
        player.rowDelta += 100;
    }


    if (bitmap[((((player.worldRow + player.rowDelta) >> 8) + player.height - 1)*(512)+(player.worldCol))] &&
        bitmap[((((player.worldRow + player.rowDelta) >> 8) + player.height - 1)*(512)+(player.worldCol + player.width - 1))]) {




        player.worldRow += player.rowDelta;
    } else {
        player.rowDelta = 0;
        player.jumping = 0;
    }


    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && !player.jumping) {
        player.rowDelta -= jumpPower;
        player.jumping = 1;
    }







    if (player.balloonType == JUMP) {

        jumpPower = 1500 + 700;
    } else {

        jumpPower = 1500;
    }
# 217 "player.c"
    if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && player.balloonTimer >= 10) {
        playerAttack(level);
        player.balloonTimer = 0;
    }
    player.balloonTimer++;



    if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        for (int i = 0; i < 13; i++) {
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




    player.screenCol = player.worldCol - *hOff;
    player.screenRow = ((player.worldRow) >> 8) - *vOff;

    animatePlayer();

}

void playerAttack(int level) {
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

    if (player.balloonType == CHEAT) {
        if (level == 0 || level == 2) {
            for (int i = 0; i < 13; i++) {
                if (bees[i].active && bees[i].screenCol >= 0 && bees[i].screenCol < 240) {
                    bees[i].health = 0;
                }
            }
        }
        if (level == 1) {
            for (int i = 0; i < 15; i++) {
                if (ants[i].active && ants[i].screenCol >= 0 && ants[i].screenCol < 240) {
                    ants[i].health = 0;
                }
            }
        }
        if (level == 2) {
            if (queenBee.screenCol >= 0 && queenBee.screenCol < 240) {
                queenBee.health = 0;
            }
        }
    }

}


void initHearts() {
    for (int i = 0; i < 20; i++) {
        healthMeter[i].num = i;
        healthMeter[i].width = 7;
        if (i % 2 == 0) {
            healthMeter[i].aniState = 4;
        } else {
            healthMeter[i].aniState = 6;
        }
        healthMeter[i].screenRow = 5;
        healthMeter[i].screenCol = 100 + (7 * i);
        healthMeter[i].active = 1;
    }
}

void drawHearts(HEART *heart) {
    if (heart->active) {
        shadowOAM[13 + heart->num].attr0 = (0xFF & heart->screenRow) | (0<<14);
        shadowOAM[13 + heart->num].attr1 = (0x1FF & heart->screenCol) | (1<<14);
        shadowOAM[13 + heart->num].attr2 = ((30)*32+(heart->aniState)) | ((0)<<12);
    } else {
        shadowOAM[13 + heart->num].attr0 = (2<<8);
    }
}

void updateHearts() {
    if (player.health != 100) {
        lostHearts = 20 - (player.health / 5);

        for (int i = 0; i < lostHearts; i++) {
            healthMeter[i].active = 0;
        }
    }
}
