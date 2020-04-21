# 1 "game2.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game2.c"
# 1 "game2.h" 1
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
# 2 "game2.h" 2


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
# 2 "game2.c" 2


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
# 5 "game2.c" 2
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
void updatePlayer(const unsigned short *bitmap, int *hOff, int *vOff);
void animatePlayer();
void drawPlayer();
void playerAttack();

void initHearts();
void updateHearts();
void drawHearts();
# 6 "game2.c" 2
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
# 7 "game2.c" 2

# 1 "bg00L2CollisionMap.h" 1
# 20 "bg00L2CollisionMap.h"
extern const unsigned short bg00L2CollisionMapBitmap[131072];
# 9 "game2.c" 2

int direction;


int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];

int numBalloons;
int isPlayerEndL2;
int playerHealth;


void initGame2() {
    vOff = 96;
    hOff = 0;
    direction = RIGHT;

    numBalloons = 0;
    isPlayerEndL2 = 0;
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000016) = vOff;
    initPlayer(&hOff, &vOff, 2);

    initBalloons();
}

void updateGame2() {
    int numActiveBalloons = 0;

    updatePlayer(&bg00L2CollisionMapBitmap, &hOff, &vOff);





    if (player.balloonType == SINGLE) {
        for (int i = 0; i < 5; i++) {
            updateBalloons(&allBalloons[i]);
            if (allBalloons[i].active) {
                numActiveBalloons++;
            }
        }

        if (numActiveBalloons < 5) {
            for (int i = 0; i < 5 ; i++) {
                if (!allBalloons[i].active) {
                    allBalloons[i].active = 1;
                    allBalloons[i].held = 1;
                    break;
                }
            }
        }
    }
    if (player.balloonType == AOE) {
        for (int i = 5; i < 5 * 2; i++) {
            updateBalloons(&allBalloons[i]);
            if (allBalloons[i].active) {
                numActiveBalloons++;
            }
        }

        if (numActiveBalloons < 5) {
            for (int i = 5; i < 5 * 2; i++) {
                if (!allBalloons[i].active) {
                    allBalloons[i].active = 1;
                    allBalloons[i].held = 1;
                    break;
                }
            }
        }
    }
    if (player.balloonType == JUMP) {
        updateBalloons(&allBalloons[10]);
    }
    if (player.balloonType == CHEAT) {
        updateBalloons(&allBalloons[11]);
    }


    for (int i = 0; i < 5 * 2 + 2; i++) {
        if (!allBalloons[i].active) {
            updateHeldBalloon(&allBalloons[i]);
        }



    }

    if (player.worldCol >= 460) {
        isPlayerEndL2 = 1;
    } else {
        isPlayerEndL2 = 0;
    }
    playerHealth = player.health;
}

void drawGame2() {
    drawPlayer();




    if (player.balloonType == SINGLE || player.lastBalloonType == SINGLE) {
        for (int i = 0; i < 5; i++) {
            drawBalloons(&allBalloons[i]);
        }
    }
    if (player.balloonType == AOE || player.lastBalloonType == AOE) {
        for (int i = 5; i < 5 * 2; i++) {
            drawBalloons(&allBalloons[i]);
        }
    }
    if (player.balloonType == JUMP || player.lastBalloonType == JUMP) {
        drawBalloons(&allBalloons[10]);
    }
    if (player.balloonType == CHEAT || player.lastBalloonType == CHEAT) {
        drawBalloons(&allBalloons[11]);
    }

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000014) = hOff/2;
}
