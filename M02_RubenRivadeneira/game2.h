#include "myLib.h"

//global variables 
extern int hOff;
extern int vOff;
// extern OBJ_ATTR shadowOAM[128];
extern int remainingEnemies;
extern int numBalloons;
extern int direction;
extern int isPlayerEndL2;
extern int playerHealth;

//constants
#define MAPHEIGHT 256
#define MAPWIDTH 512
#define MAXBULLETS 5

//Prototypes
void initGame2();
void updateGame2();
void drawGame2();