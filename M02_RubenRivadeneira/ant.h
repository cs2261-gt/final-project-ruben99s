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
} ANT;

typedef enum {
    CALM,
    ANGRY 
};

extern ANT ants[];

#define MAXANTS 1;

void initAnts();
void updateAnts(ANT *ant);
void animateAnts(ANT *ant);
void drawAnt(ANT *ant);

