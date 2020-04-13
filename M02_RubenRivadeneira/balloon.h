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
} BALLOON;

typedef enum {
    SINGLE,
    AOE,
    JUMP,
    CHEAT
};

// enum {SINGLE, AOE, JUMP, CHEAT}; 

extern BALLOON balloons[];

#define MAXBALLOONS 5

void initBalloons();
void updateBalloons();
void drawBalloons();
void animateBalloons();
void updateHeldBalloon();