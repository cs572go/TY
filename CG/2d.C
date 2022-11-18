//Write a program to draw a polygon using line function and perform the following 2-D
//transformations : Translation, scaling and rotation about given point.

#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include<math.h>
#define pi 3.14

void drawaxis()
{ 
	int i,j,x,y;
	char string[20];
	line(320,0,320,480);
	line(0,240,640,240);
	for(i=-10,x=20;i<=10;i++,x=x+30)
  	{
		setcolor(GREEN);
		line(x,236,x,244);
		itoa(i,string,10);
		outtextxy(x,248,string);
   	}
	for(i=-8,y=0;i<=8;i++,y=y+30)
	{
		setcolor(GREEN);
		line(316,y,324,y);
		itoa(i,string,10);
		outtextxy(328,y,string);
   	}
}

int polygon(float a[10][3])
{
	int i,j,v;
	printf("\nEnter number of vertices");
	scanf("%d",&v);
	printf("\nEnter values: ");
	for(i=0;i<v;i++)
	{
		for(j=0;j<2;j++)
		{
			 scanf("%f",&a[i][j]);
		}
		a[i][2]=1;
	}
return(v);
}

void display(float a[10][3],int v,int color)
{
	int i;
	setcolor(color);
	for(i=0;i<v;i++)
	{
		line(320+30*a[i][0],240+30*a[i][1],320+30*a[(i+1)%v][0],240+30*a[(i+1)%v][1]);
	}
}

void trans(float b[3][3],int tx, int ty)
{
	int i,j;
	for(i=0;i<3;i++)
	{
		for(j=0;j<3;j++)
		{
			if(i==j)
			{
				b[i][j]=1;
			}
			else
			{
				b[i][j]=0;
			}
		}
	}
 	b[2][0]=tx;
	b[2][1]=ty;
}

void mul(float a[10][3],float b[3][3],float c[10][3],int v)
{
	int i,j,k;
	for(i=0;i<v;i++)
	{
		c[i][j]=0;
		for(j=0;j<3;j++)
		{
			c[i][j]=0;
			for(k=0;k<3;k++)
			{
				c[i][j]+=a[i][k]*b[k][j];
			}
		}
	}
}

void scaling(float d[3][3],int sx,int sy)
{
	int i,j;
	for(i=0;i<3;i++)
	{
		for(j=0;j<3;j++)
		{
			if(i==j)
			{
				d[i][j]=1;
			}
			else
			{
				d[i][j]=0;
			}
		}
	}
  d[0][0]=sx;
  d[1][1]=sy;
}

void rot(float e[3][3],int ang)
{
	 int i,j,s1=1,xp,yp;
	 float t;
	 printf("Enter xp yp");
	 scanf("%d%d",&xp,&yp);
	 if(ang<0)
	 {
		s1=-1;
	 }
	 t=abs(ang)*3.14/180;
	 for(i=0;i<3;i++)
	 {
		for(j=0;j<3;j++)
			{
				if(i==j)
				{
					e[i][j]=1;
				}
				else
				{
					e[i][j]=0;
				}
			}
	}
	e[0][0]=e[1][1]=s1*cos(t);
	e[0][1]=s1*sin(t);
	e[1][0]=-s1*sin(t);
	e[2][0]=-xp*cos(t)+yp*s1*sin(t)+xp;
	e[2][1]=-xp*s1*sin(t)-yp*cos(t)+yp;
}

int main()
{
   /* request auto detection */
   int gd = DETECT,sx,sy,tx,ty, gm, errorcode;
   float a[10][3],b[3][3],c[10][3],d[3][3],e[3][3];
   int i,x,y,v,ch,op;
   char string[20];
   int ang;

   /* initialize graphics and local variables */
   initgraph(&gd, &gm,(char*)"");
   line(320,0,320,480);
   line(0,240,640,240);

   drawaxis();
	  do
	  {
		 printf("\n*********MENU**********");
		 printf("\n1.Accept polygon");
		 printf("\n2 Display polygon");
		 printf("\n3 Translation");
		 printf("\n4 Scaling");
		 printf("\n5 Rotation");
		 printf("\n***********************");
		 printf("\n Enter ur option");
		 scanf("%d",&op);
		 switch(op)
		 {
			case 1:
				initgraph(&gd,&gm,(char*)"");
				drawaxis();
				v=polygon(a);
				break;
			case 2:
				initgraph(&gd,&gm,(char*)"");
				drawaxis();
				display(a,v,9);
				getch();
				break;
			case 3:
				initgraph(&gd,&gm,(char*)"");
				drawaxis();
				printf("Polygon befor translation");
				display(a,v,3);
				printf("\n Enter tx ty");
				scanf("%d%d",&tx,&ty);
				trans(b,tx,ty);
				mul(a,b,c,v);
				display(c,v,6);
				getch();
				break;
			case 4:
				initgraph(&gd,&gm,(char*)"");
				drawaxis();
				printf("Polygon befor scaling");
				display(a,v,3);
				printf("\nEnter sx sy");
				scanf("%d%d",&sx,&sy);
				scaling(d,sx,sy);
				mul(a,d,c,v);
				display(c,v,6);
				getch();
				break;
			case 5:
				initgraph(&gd,&gm,(char*)"");
				drawaxis();
				printf("Polygon befor rotation");
				display(a,v,3);
				printf("\nEnter angle");
				scanf("%d",&ang);
				rot(e,ang);
				mul(a,e,c,v);
				display(c,v,6);
				getch();
				break;
		 }
	  printf("Do u want 2 continue yes(1)\no(0): ");
	  scanf("%d",&ch);
	  }while(ch!=0);

	  getch();
	  return 0;
}
