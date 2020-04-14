#include "myLib.h"

typedef enum {
    LEFT,
    RIGHT
};

//global variables
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern int remainingEnemies;
extern int numBalloons;
extern int direction;
extern int isPlayerEnd;
extern int playerHealth;

//constants
#define MAPHEIGHT 256
#define MAPWIDTH 512
#define MAXBULLETS 5

//Prototypes
void initGame();
void updateGame();
void drawGame();