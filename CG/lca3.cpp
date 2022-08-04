#include<graphics.h>
#include<stdio.h>
#include<stdlib.h>
#define dotspace 4
#define dashlen 8

int sign(int n) {
    if ( n > 0 ) return 1;
    else if (n < 0) return -1;
    else return 0;
}

void swap(int* a, int* b) {
    int c = *a;
    *a = *b;
    *b = c;
}

void plot_line()
{
    closegraph();
    int gd=DETECT, gm, i=0;
    int x,y,x1,y1,x2,y2,dx,dy,dp,s1,s2,flag=0;

    initgraph(&gd, &gm, (char*)"");
    line(320,0,320,480);
    line(0,240,640,240);
    printf("\nEnter x1, y1 :");
    scanf("%d %d",&x1,&y1);
    printf("\nEnter x2, y2 :");
    scanf("%d %d",&x2,&y2);

    x1 += 320;
    x2 += 320;
    y1 = 240 - y1;
    y2 = 240 - y2;

    dx=abs(x2-x1);
    dy=abs(y2-y1);

    x=x1;
    y=y1;

    s1=sign(x2-x1);
    s2=sign(y2-y1);

    if(dy>dx)
    {
        swap(&dy, &dx);
        flag=1;
    }

    dp = 2*dy - dx;
    do
    {
        putpixel(x, y, WHITE);
        while(dp >= 0) {
            if (flag) x += s1;
            else y += s2;
            dp -= 2*dx;
        }
        if (flag) y += s2;
        else x += s1;
        dp += 2*dy;
        i += 1;
    } while (i <= dx);
    
}

void plot_dotted_line()
{
    closegraph();
    int gd=DETECT, gm, i=0;
    int x,y,x1,y1,x2,y2,dx,dy,dp,s1,s2,flag=0;

    initgraph(&gd, &gm, (char*)"");
    line(320,0,320,480);
    line(0,240,640,240);
    printf("\nEnter x1, y1 :");
    scanf("%d %d",&x1,&y1);
    printf("\nEnter x2, y2 :");
    scanf("%d %d",&x2,&y2);

    x1 += 320;
    x2 += 320;
    y1 = 240 - y1;
    y2 = 240 - y2;

    dx=abs(x2-x1);
    dy=abs(y2-y1);

    x=x1;
    y=y1;

    s1=sign(x2-x1);
    s2=sign(y2-y1);

    if(dy>dx)
    {
        swap(&dy, &dx);
        flag=1;
    }

    dp = 2*dy - dx;
    do
    {
        if(i%dotspace == 0)
        putpixel(x, y, WHITE);

        while(dp >= 0) {
            if (flag) x += s1;
            else y += s2;
            dp -= 2*dx;
        }
        if (flag) y += s2;
        else x += s1;
        dp += 2*dy;
        i += 1;
    } while (i <= dx);
    
}

void plot_dashed_line()
{
   closegraph();
    int gd=DETECT, gm, i=0;
    int x,y,x1,y1,x2,y2,dx,dy,dp,s1,s2,flag=0;

    initgraph(&gd, &gm, (char*)"");
    line(320,0,320,480);
    line(0,240,640,240);
    printf("\nEnter x1, y1 :");
    scanf("%d %d",&x1,&y1);
    printf("\nEnter x2, y2 :");
    scanf("%d %d",&x2,&y2);

    x1 += 320;
    x2 += 320;
    y1 = 240 - y1;
    y2 = 240 - y2;

    dx=abs(x2-x1);
    dy=abs(y2-y1);

    x=x1;
    y=y1;

    s1=sign(x2-x1);
    s2=sign(y2-y1);

    if(dy>dx)
    {
        swap(&dy, &dx);
        flag=1;
    }

    dp = 2*dy - dx;
    do
    {
        if( i%dashlen <= (dashlen/2) )
        putpixel(x, y, WHITE);
        while(dp >= 0) {
            if (flag) x += s1;
            else y += s2;
            dp -= 2*dx;
        }
        if (flag) y += s2;
        else x += s1;
        dp += 2*dy;
        i += 1;
    } while (i <= dx);
    
}
void plot_dashed_dot_line()
{

    closegraph();
    int gd=DETECT, gm, i=0;
    int x,y,x1,y1,x2,y2,dx,dy,dp,s1,s2,flag=0;

    initgraph(&gd, &gm, (char*)"");
    line(320,0,320,480);
    line(0,240,640,240);
    printf("\nEnter x1, y1 :");
    scanf("%d %d",&x1,&y1);
    printf("\nEnter x2, y2 :");
    scanf("%d %d",&x2,&y2);

    x1 += 320;
    x2 += 320;
    y1 = 240 - y1;
    y2 = 240 - y2;

    dx=abs(x2-x1);
    dy=abs(y2-y1);

    x=x1;
    y=y1;

    s1=sign(x2-x1);
    s2=sign(y2-y1);

    if(dy>dx)
    {
        swap(&dy, &dx);
        flag=1;
    }

    dp = 2*dy - dx;
    do
    {
        if( i%dashlen <= (dashlen/2)|| i%dashlen == (dashlen/2) + 2 )
        putpixel(x, y, WHITE);
        while(dp >= 0) {
            if (flag) x += s1;
            else y += s2;
            dp -= 2*dx;
        }
        if (flag) y += s2;
        else x += s1;
        dp += 2*dy;
        i += 1;
    } while (i <= dx);
}

int main()
{
    
    int choice =-1;
    do{
        printf("\nSelect Choice");
        printf("\n1. Line");
        printf("\n2. Dotted Line");
        printf("\n3. Dashed Line");
        printf("\n4. Dash-Dot Line");
        scanf("%d", &choice);

        switch(choice)
        {
            case 1:
                plot_line();
                break;
            case 2:
                plot_dotted_line();
                break;
            case 3:
                plot_dashed_line();
                break;
            case 4:
                plot_dashed_dot_line();
                break;
            default:
                break;
        }
    }
    while(choice!=0);

    getch();
    return 0;
}