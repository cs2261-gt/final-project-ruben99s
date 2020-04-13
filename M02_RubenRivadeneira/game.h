#include "myLib.h"

//structs
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
    
    //animation attributes
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

// typedef struct {
//     int screenCol;
//     int screenRow;
//     int worldCol;
//     int worldRow;
//     int colDelta;
//     int rowDelta;
//     int height;
//     int width;
//     int active;
//     int erased;

//     int rightLimit;
//     int leftLimit;
//     int direction;
//     int state;
//     int num;

//     int aniCounter;
//     int aniState;
//     int prevAniState;
//     int curFrame;
//     int numFrames;
// } BUZZ;

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

//global variables
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern PLAYER player;
// extern BUZZ enemies[];
extern BALLOON balloons[];
extern int remainingEnemies;
extern int numBalloons;

//constants
#define MAPHEIGHT 256
#define MAPWIDTH 512
#define MAXENEMIES 3
#define MAXBALLOONS 5
#define MAXBULLETS 5

//Prototypes
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void playerAttack();

// void initBuzz();
// void updateBuzz(BUZZ *enemy);
// void animateBuzz(BUZZ *enemy);
// void drawBuzz(BUZZ *enemy);
// void buzzAttack(BUZZ *enemy);

void initBalloons();
void updateBalloons();
void drawBalloons();
void animateBalloons();
void updateHeldBalloon();