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
    int num;

    int health;

    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
} ANT;


extern ANT ants[];

#define MAXANTS 15

void initAnts();
void updateAnts(ANT *ant, const unsigned short *bitmap);
void animateAnts(ANT *ant);
void drawAnt(ANT *ant);

