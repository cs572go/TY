#include<conio.h>
#include<stdio.h>
#include<graphics.h>
#include<direct.h>

void read(int x[],int y[],int n )
{
	int i;
	for(i=0;i<n;i++)
	{
		printf("\nEnter co-ord of pt.:");
		scanf("%d%d",&x[i],&y[i]);
		x[i]+=(getmaxx()/2);
		y[i]=(getmaxy()/2)-y[i];
	}
	x[n]=x[0];
	y[n]=y[0];
}

void draw1(int x[],int y[],int n)
{
  int xm,ym,i;;
  cleardevice();
  //xm=getmaxx()/2;
  //ym=getmaxy()/2;
 // line(0,ym,xm*2,ym);
  //line(xm,0,xm,ym*2);
  for(i=0;i<n;i++)
    line(x[i],y[i],x[i+1],y[i+1]);
}
void bfill(int x,int y,int newc,int oldc)
{
	int curr;
	curr=getpixel(x,y);
	if((curr==oldc) && (curr!=WHITE))
	{
		putpixel(x,y,newc);
		delay(10);
		bfill(x+1,y,newc,oldc);
		bfill(x-1,y,newc,oldc);
		bfill(x,y+1,newc,oldc);
		bfill(x,y-1,newc,oldc);
       }
}

void flood(int x,int y,int newc,int oldc)
{
	int curr;
	curr=getpixel(x,y);
	if(curr==oldc)
	{
		putpixel(x,y,newc);
		delay(10);
		flood(x+1,y,newc,oldc);
		flood(x-1,y,newc,oldc);
		flood(x,y+1,newc,oldc);
		flood(x,y-1,newc,oldc);
       }
}


void  scan(int x[],int y[],int n,int col)
{
	int inter_x[5],temp,i,k,j,l;
	float m[5],ymax=0,ymin=getmaxy(),dx,dy,cnt;

	for(i=0;i<n;i++)
	{
		if(y[i]>ymax)
			ymax=y[i];
		if(y[i]<ymin)
			ymin=y[i];

		dx=x[i+1]-x[i];
		dy=y[i+1]-y[i];

		if(dx==0)
			m[i]=0;
		else if(dy==0)
			m[i]=1;
		else
			m[i]=(float)dy/dx;
	}
	setcolor(col);
	for(i=ymax;i>ymin;i--)
	{
		cnt=0;
		for(j=0;j<n;j++)
		{
			if((y[j]>i && y[j+1]<=i) || (y[j]<=i && y[j+1]>i))
			{
				if(m[j]==0)
					inter_x[(int)cnt]=x[j];
				else
					inter_x[(int)cnt]=x[j]+(i-y[j])/m[j];
				cnt++;
			}
		}
		for(k=0;k<cnt-1;k++)
		{
			for(l=0;l<cnt-1;l++)
			{
				if(inter_x[l]>inter_x[l+1])
				{
					temp=inter_x[l];
					inter_x[l]=inter_x[l+1];
					inter_x[l+1]=temp;
				}
			}
		 }
		for(k=0;k<cnt-1;k+=2)
		{
			line(inter_x[k]+1,i,inter_x[k+1]-1,i);
			delay(100);
		}
	}
}
int main()
{
	int n,x[10],y[10];
	int ch,sx,sy,col;
	int gd=DETECT,gm;
	initgraph(&gd,&gm,(char *)"");
	printf("\nEnter no. of co-ord:");
	scanf("%d",&n);
	read(x,y,n);
	cleardevice();
	do
	{
		printf("\n\n1.Flood Fill\n2.Boundary Fill\n3.Scan Line\n4.Exit");
		printf("\nEnter choice:");
		scanf("%d",&ch);
		switch(ch)
		{
			case 1:
				printf("\nEnter seed pt co-ord:");
				scanf("%d%d",&sx,&sy);
				sx+=(getmaxx()/2);
				sy=(getmaxy()/2)-sy;
			//	printf("\nEnter new color");
			//	scanf("%d",&col);
				draw1(x,y,n);
				flood(sx,sy,WHITE,BLACK);
				getch();
				break;
			case 2:
				printf("\nEnter seed pt co-ord:");
				scanf("%d%d",&sx,&sy);
				sx+=(getmaxx()/2);
				sy=(getmaxy()/2)-sy;
			//	printf("\nEnter new color");
			//	scanf("%d",&col);
				draw1(x,y,n);
				bfill(sx,sy,WHITE,BLACK);
				getch();
				break;
			case 3:
				printf("\nEnter new color");
				scanf("%d",&col);
				draw1(x,y,n);
				scan(x,y,n,col);
				getch();
				break;
			}
		}while(ch!=4);

	return 0;
}