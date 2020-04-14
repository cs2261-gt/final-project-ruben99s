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

//buzz states
typedef enum {
    CALM,
    ANGRY 
};

//global variables
extern BUZZ bees[];

//constants
#define MAXBEES 8

//prototypes
void initBuzz();
void updateBuzz(BUZZ *buzz);
void animateBuzz(BUZZ *buzz);
void drawBuzz(BUZZ *buzz);
// void buzzAttack(BUZZ *buzz);