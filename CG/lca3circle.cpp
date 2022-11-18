#include<iostream>
#include<conio.h>
#include<graphics.h>

void drawCircle(int x, int y, int xc, int yc);

int main()
{
	int gd = DETECT, gm;
	int r, xc, yc, pk, x, y;
	initgraph(&gd, &gm, (char*)"");
	printf("Enter the center co-ordinates\n");
	scanf("%d %d",&xc,&yc);
	printf("Enter the radius of circle\n");
	scanf("%d",&r);
	pk = 3 - 2*r;
	x=0; y = r;
	drawCircle(x,y,xc,yc);
	while(x < y)
	{
		if(pk <= 0)
		{
			pk = pk + (4*x) + 6;
			drawCircle(++x,y,xc,yc);
		}
		else
		{
			pk = pk + (4*(x-y)) + 10;
			drawCircle(++x,--y,xc,yc);
		}
	}

	getch();
	closegraph();
}

void drawCircle(int x, int y, int xc, int yc)
{
	putpixel(x+xc,y+yc,9);
	putpixel(-x+xc,y+yc,8);
	putpixel(x+xc, -y+yc,7);
	putpixel(-x+xc, -y+yc, 9);
	putpixel(y+xc, x+yc, 8);
	putpixel(y+xc, -x+yc, 7);
	putpixel(-y+xc, x+yc, 6);
	putpixel(-y+xc, -x+yc, 6);
}