#include<graphics.h>
#include<stdio.h>
#include<stdlib.h>
#define dotspace 4
#define dashlen 8

void plot_line()
{
    closegraph();
    int gd=DETECT, gm, i;
    float x1,y1,x2,y2,dx,dy,cx,cy,len;

    initgraph(&gd, &gm, (char*)"");
    printf("\nEnter x1, y1 :");
    scanf("%f %f",&x1,&y1);
    printf("\nEnter x2, y2 :");
    scanf("%f %f",&x2,&y2);

    dx=abs(x2-x1);
    dy=abs(y2-y1);

    len = dx>dy?dx:dy;
    printf("\nlen is %f", len);
    cx=(x2-x1)/len;
    cy=(y2-y1)/len;

    for(i=0; i<=len; i++)
    {
        putpixel(x1,y1, WHITE);
        x1+=cx;
        y1+=cy;
    }
    
}

void plot_dotted_line()
{
    closegraph();
    int gd=DETECT, gm, i;
    float x1,y1,x2,y2,dx,dy,cx,cy,len;

    initgraph(&gd, &gm, (char*)"");
    printf("\nEnter x1, y1 :");
    scanf("%f %f",&x1,&y1);
    printf("\nEnter x2, y2 :");
    scanf("%f %f",&x2,&y2);

    dx=abs(x2-x1);
    dy=abs(y2-y1);

    len = dx>dy?dx:dy;
    printf("\nlen is %f", len);
    cx=(x2-x1)/len;
    cy=(y2-y1)/len;

    for(i=0; i<=len; i+=dotspace)
    {        
        putpixel(x1,y1, WHITE);
        x1+=(dotspace*cx);
        y1+=(dotspace*cy);

    }
    
}

void plot_dashed_line()
{
    closegraph();
    int gd=DETECT, gm, i;
    float x1,y1,x2,y2,dx,dy,cx,cy,len;

    initgraph(&gd, &gm, (char*)"");
    printf("\nEnter x1, y1 :");
    scanf("%f %f",&x1,&y1);
    printf("\nEnter x2, y2 :");
    scanf("%f %f",&x2,&y2);

    dx=abs(x2-x1);
    dy=abs(y2-y1);

    len = dx>dy?dx:dy;
    printf("\nlen is %f", len);
    cx=(x2-x1)/len;
    cy=(y2-y1)/len;

    for(i=0; i<=len; i++)
    {
        if((i%dashlen)>=(dashlen/2))
        {
            putpixel(x1,y1, WHITE);
        }
        x1+=cx;
        y1+=cy;
    }
    
}
void plot_dashed_dot_line()
{

    closegraph();
    int gd=DETECT, gm, i;
    float x1,y1,x2,y2,dx,dy,cx,cy,len;

    initgraph(&gd, &gm, (char*)"");
    printf("\nEnter x1, y1 :");
    scanf("%f %f",&x1,&y1);
    printf("\nEnter x2, y2 :");
    scanf("%f %f",&x2,&y2);

    dx=abs(x2-x1);
    dy=abs(y2-y1);

    len = dx>dy?dx:dy;
    printf("\nlen is %f", len);
    cx=(x2-x1)/len;
    cy=(y2-y1)/len;

    for(i=0; i<=len; i++)
    {
        if((i%dashlen)>=(dashlen/2))
        {
            putpixel(x1,y1, WHITE);
        }
        else if((i%dashlen)==(dashlen/2-2))
        {
            putpixel(x1,y1,WHITE);
        }
        x1+=cx;
        y1+=cy;
    }

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