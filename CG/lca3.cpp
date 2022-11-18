#include<graphics.h>
#include<stdio.h>
#include<stdlib.h>

int main()
{`
    
    closegraph();
    int gd=DETECT, gm, i=0;

    initgraph(&gd, &gm, (char*)"");
    line(320,0,320,480);
    line(0,240,640,240);
    printf("\nGraphics window initialized");

    getch();
    return 0;
}