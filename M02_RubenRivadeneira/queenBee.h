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

#define MAXSTINGERS 3

void initQueenBee();
void initStingers();
void updateQueenBee(const unsigned short *bitmap);
void updateStingers(STINGER *stinger);
void drawQueenBee();
void drawStingers(STINGER *stinger);