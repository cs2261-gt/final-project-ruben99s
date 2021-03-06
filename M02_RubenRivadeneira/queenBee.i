# 1 "queenBee.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "queenBee.c"
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
# 2 "queenBee.c" 2
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

    int origWorldCol;
    int origWorldRow;
    int direction;

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
void animateQueenBee();
void attackQueenBee();
# 3 "queenBee.c" 2
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
# 4 "queenBee.c" 2
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
# 5 "queenBee.c" 2
# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();

void pauseSoundA();
void pauseSoundB();
void unPauseSoundA();
void unPauseSoundB();
void stopSoundA();
void stopSoundB();
# 6 "queenBee.c" 2
# 1 "fastGame2.h" 1




extern const signed char fastGame2[989182];
# 7 "queenBee.c" 2
# 1 "calmGame2.h" 1




extern const signed char calmGame2[881783];
# 8 "queenBee.c" 2
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
# 9 "queenBee.c" 2
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
# 10 "queenBee.c" 2
# 1 "Pop.h" 1




extern const signed char pop[3248];
# 11 "queenBee.c" 2

void updateStingerPosition(STINGER *stinger);

QUEENBEE queenBee;
STINGER stingers[3];

int queenBeeSpawned = 0;

int attackTimer;
int healthTimer;

void initQueenBee() {
    queenBee.height = 64;
    queenBee.width = 64;
    queenBee.worldRow = 231 - queenBee.height;
    queenBee.worldCol = 394;
    queenBee.screenRow = queenBee.worldRow - vOff;
    queenBee.colDelta = 1;
    queenBee.rowDelta = 1;
    queenBee.health = 1500;
    queenBee.direction = LEFT;
    queenBee.aniState = 16;
    queenBee.curFrame = 0;
    queenBee.active = 0;
    queenBee.erased = 0;

    attackTimer = 0;
    healthTimer = 0;

    queenBeeSpawned = 0;
    initStingers();
}

void initStingers() {
    for (int i = 0; i < 3; i++) {
        stingers[i].height = 5;
        stingers[i].width = 16;
        stingers[i].worldCol = queenBee.worldCol;
        stingers[i].worldRow = queenBee.worldRow + 64;
        stingers[i].screenCol = stingers[i].worldCol - hOff;
        stingers[i].screenRow = stingers[i].worldRow - vOff;
        stingers[i].colDelta = 2;
        stingers[i].active = 0;
        stingers[i].curFrame = 30;
        stingers[i].num = i;
    }
}

void updateQueenBee(const unsigned short *bitmap) {
    int screenCol = queenBee.worldCol - hOff;
    if (screenCol >= 0 && screenCol < 240 && !queenBee.erased) {
        if (!queenBeeSpawned) {
            stopSound();
            playSoundA(fastGame2, 989182, 1);
            queenBeeSpawned = 1;
        }
        queenBee.active = 1;
        queenBee.screenCol = screenCol;
    }

    if (queenBee.active && queenBee.health <= 0) {
        queenBee.active = 0;
        queenBee.erased = 1;

        remainingEnemiesL2--;
    }







    if (queenBee.active) {






        if (player.worldCol <= queenBee.worldCol) {
            queenBee.direction = LEFT;
        } else if (player.worldCol > queenBee.worldCol) {
            queenBee.direction = RIGHT;
        }

        if (queenBee.direction == LEFT) {
            if (bitmap[((queenBee.worldRow)*(512)+(queenBee.worldCol - 1))] &&
                bitmap[((queenBee.worldRow + queenBee.height - 1)*(512)+(queenBee.worldCol - 1))]) {

                queenBee.worldCol -= queenBee.colDelta;

            }
        } else if (queenBee.direction == RIGHT) {
            if (bitmap[((queenBee.worldRow)*(512)+(queenBee.worldCol + queenBee.width - 1 + 1))] &&
                bitmap[((queenBee.worldRow + queenBee.height - 1)*(512)+(queenBee.worldCol + queenBee.width - 1 + 1))]) {

                queenBee.worldCol += queenBee.colDelta;

            }
        }


        if (attackTimer % 100 == 0) {
            attackQueenBee();
            attackTimer = 0;
        }
        attackTimer++;


        for (int i = 0; i < 5 * 2 + 2; i++) {
            if (allBalloons[i].active && !allBalloons[i].held) {
                if (collision(allBalloons[i].worldCol, allBalloons[i].worldRow, allBalloons[i].width, allBalloons[i].height,
                queenBee.worldCol, queenBee.worldRow, queenBee.width, queenBee.height)) {

                    playSoundB(pop, 3248, 0);

                    if (allBalloons[i].type == SINGLE) {
                        queenBee.health -= 100;
                    }
                    if (allBalloons[i].type == AOE) {

                        int rightLimit = allBalloons[i].worldCol + allBalloons[i].width + allBalloons[i].radius;
                        int leftLimit = allBalloons[i].worldCol - allBalloons[i].radius;
                        for (int i = 0; i < 13; i++) {
                            if (bees[i].worldCol >= leftLimit && bees[i].worldCol < rightLimit) {
                                bees[i].health -= 34;
                            }
                        }
                        queenBee.health -= 34;
                    }

                    allBalloons[i].active = 0;

                }
            }
        }


        if (collision(player.worldCol, ((player.worldRow) >> 8), player.width, player.height,
            queenBee.worldCol, queenBee.worldRow, queenBee.width, queenBee.height)) {
                if (healthTimer % 300 == 0) {
                    player.health -= 5;
                    healthTimer = 0;
                    updateHearts();
                }
                healthTimer++;
        }


    }

    queenBee.screenCol = queenBee.worldCol - hOff;
    queenBee.screenRow = queenBee.worldRow - vOff;
    animateQueenBee();

    for (int i = 0; i < 3; i++) {
        updateStingers(&stingers[i]);
    }

}

void drawQueenBee() {
    if (queenBee.active) {
        shadowOAM[70].attr0 = (0xFF & queenBee.screenRow) | (0<<14);
        shadowOAM[70].attr1 = (0x1FF & queenBee.screenCol) | (3<<14);
        shadowOAM[70].attr2 = ((queenBee.curFrame)*32+(queenBee.aniState)) | ((0)<<12);
    } else {
        shadowOAM[70].attr0 = (2<<8);
    }

    for (int i = 0; i < 3; i++) {
        drawStingers(&stingers[i]);
    }
}

void drawStingers(STINGER *stinger) {
    if (stinger->active) {
        shadowOAM[71 + stinger->num].attr0 = (0xFF & stinger->screenRow) | (1<<14);
        shadowOAM[71 + stinger->num].attr1 = (0x1FF & stinger->screenCol) | (0<<14);
        shadowOAM[71 + stinger->num].attr2 = ((stinger->curFrame)*32+(0)) | ((0)<<12);
    } else {
        shadowOAM[71 + stinger->num].attr0 = (2<<8);
    }
}

void animateQueenBee() {
    if (queenBee.direction == LEFT) {
        queenBee.aniState = 16;
    } else if (queenBee.direction == RIGHT) {
        queenBee.aniState = 24;
    }
}

void attackQueenBee() {
    for (int i = 0; i < 3; i++) {
        if (!stingers[i].active) {
            stingers[i].active = 1;
            updateStingerPosition(&stingers[i]);
            break;
        }
    }
}

void updateStingers(STINGER *stinger) {
    if (stinger->active) {
        if (stinger->direction == LEFT) {
            if ((stinger->origWorldCol - stinger->worldCol) <= 300) {
                stinger->worldCol += stinger->colDelta;
            } else {
                stinger->active = 0;
            }
        } else if (stinger->direction == RIGHT) {
            if ((stinger->worldCol - stinger->origWorldCol) <= 300) {
                stinger->worldCol += stinger->colDelta;
            } else if (stinger->worldCol > 512) {
                stinger->active = 0;
            } else {
                stinger->active = 0;
            }
        }


        if (collision(stinger->worldCol, stinger->worldRow, stinger->width, stinger->height,
            player.worldCol, ((player.worldRow) >> 8), player.width, player.height)) {
            stinger->active = 0;
            player.health -= 15;
            updateHearts();
        }


        for (int i = 0; i < 5; i++) {
            if (allBalloons[i].active && collision(stinger->worldCol, stinger->worldRow, stinger->width, stinger->height,
                allBalloons[i].worldCol, allBalloons[i].worldRow, allBalloons[i].width, allBalloons[i].height)) {

                    allBalloons[i].active = 0;
                    stinger->active = 0;
                    playSoundB(pop, 3248, 0);
            }
        }

        stinger->screenCol = stinger->worldCol - hOff;
        stinger->screenRow = stinger->worldRow - vOff;
    }
}

void updateStingerPosition(STINGER *stinger) {
    if (queenBee.direction == LEFT) {
        stinger->direction = LEFT;
        stinger->worldCol = queenBee.worldCol;
        stinger->worldRow = queenBee.worldRow + 64;
        stinger->colDelta = -2;
        stinger->curFrame = 30;
    } else if (queenBee.direction == RIGHT) {
        stinger->direction = RIGHT;
        stinger->worldCol = queenBee.worldCol + 64;
        stinger->worldRow = queenBee.worldRow + 64;
        stinger->colDelta = 2;
        stinger->curFrame = 31;
    }

    stinger->origWorldCol = stinger->worldCol;
    stinger->origWorldRow = stinger->worldRow;
}
