#include "myLib.h"

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

// enum {SINGLE, AOE, JUMP, CHEAT}; 
extern BALLOON allBalloons[];

// extern BALLOON balloons[];
// extern BALLOON balloonsAOE[];
// extern BALLOON jumpBalloon;
// extern BALLOON cheatBalloon;

#define MAXBALLOONS 5

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