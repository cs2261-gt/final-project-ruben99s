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
    int active;
} BULLET;

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

//constants
#define MAPHEIGHT 256
#define MAPWIDTH 512
#define MAXBULLETS 5

//Prototypes
void initGame();
void updateGame();
void drawGame();