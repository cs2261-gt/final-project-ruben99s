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

typedef enum {
    PLAYERRIGHT,
    PLAYERLEFT,
    PLAYERUP,
    PLAYERDOWN,
    PLAYERIDLE
};

extern PLAYER player;
// enum {PLAYERRIGHT, PLAYERLEFT, PLAYERUP, PLAYERDOWN, PLAYERIDLE};

void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void playerAttack();