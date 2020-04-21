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
    int balloonType;
    int lastBalloonType;
    int highJumpLimit;

    int health;
    
    //animation attributes
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

#define numHearts 20

void initPlayer(int *hOff, int *vOff, int level);
void updatePlayer(const unsigned short *bitmap, int *hOff, int *vOff);
void animatePlayer();
void drawPlayer();
void playerAttack();

void initHearts();
void updateHearts();
void drawHearts();