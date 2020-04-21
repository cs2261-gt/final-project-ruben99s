#include "myLib.h"

//global variables 
extern int hOff;
extern int vOff;
// extern OBJ_ATTR shadowOAM[128];
extern int remainingEnemiesL1;
extern int numBalloons;
extern int direction;
extern int isPlayerEndL1;
extern int playerHealth;

//constants
#define MAPHEIGHT 256
#define MAPWIDTH 512
#define MAXBULLETS 5

//Prototypes
void initGame1();
void updateGame1();
void drawGame1();