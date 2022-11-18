

#include<iostream.h>
#include<conio.h>
#include<graphics.h>



void get_code(int x,int y,int code[4],int wxmin,int wxmax,int wymin, int wymax)
{
 if(y<wymin)
	code[0]=1;      //bit1= 1 if endpoint is above the window
 else
	code[0]=0;
 if(y>wymax)
	code[1]=1;	//bit2= 1 if endpoint is below the window
 else
	code[1]=0;
 if(x>wxmax)
	code[2]=1;      //bit3= 1 if endpoint is to the right of the window
 else
	code[2]=0;
 if(x<wxmin)
	code[3]=1;      //bit4= 1 if endpoint is to the left of the window
 else
	code[3]=0;
}

int visible_line(int code1[4],int code2[4])
{
 int i;
 for(i=0;i<4;i++)
  if(code1[i]==1 || code2[i]==1)
	return(0);
  return(1);
}

int invisible_line(int code1[4],int code2[4])
{
 int i;
 for(i=0;i<4;i++)
  if(code1[i]==1 && code2[i]==1)
	return(1);
   return(0);
}

void partial_visible(int x1,int y1,int x2,int y2, int *xp,int *yp,int code[],int wxmin,int wxmax,int wymin,int wymax)
{
 int i=0,x,y;
 while(code[i] !=1 && i<4)
  i++;
 switch(i)
 {
  case 0:
	x= x1+ (wymin - y1)* ((float) (x2-x1)/(y2-y1));
	y=wymin;
	break;
  case 1:
	x= x1+ (wymax- y1)* ((float) (x2-x1)/(y2-y1));
	y=wymax;
	break;
  case 2:
	y= y1+ (wxmax - x1)* ((float) (y2-y1)/(x2-x1));
	x=wxmax;
	break;
  case 3:
	y= y1+ (wxmin - x1)* ((float) (y2-y1)/(x2-x1));
	x=wxmin;
	break;
 }
 if(i!=4)
 {
  *xp=x;
  *yp=y;
 }
}

void algorithm(int x1,int y1,int x2,int y2,int wxmin,int wxmax,int wymin,int wymax)
{
 int code1[4],code2[4],i,j,flag=0,temp;
 do
 {
  get_code(x1,y1,code1,wxmin,wxmax,wymin,wymax);
  get_code(x2,y2,code2,wxmin,wxmax,wymin,wymax);
  if(visible_line(code1,code2)==1)
  {
   outtextxy(wxmin+20,wymin-40,"WINDOW AFTER CLIPPING THE LINE");
   rectangle(wxmin,wymin,wxmax,wymax);
   line(x1,y1,x2,y2);
   flag=1;
   getch();
  }
  else
   if(invisible_line(code1,code2)==1)
   {
    outtextxy(wxmin+20,wymin-40,"WINDOW AFTER CLIPPING THE LINE");
    rectangle(wxmin,wymin,wxmax,wymax);
    getch();
    flag=1;
   }
  else
  {
   partial_visible(x1,y1,x2,y2,&x1,&y1,code1,wxmin,wxmax,wymin,wymax);
   partial_visible(x1,y1,x2,y2,&x2,&y2,code2,wxmin,wxmax,wymin,wymax);
  }
 }while(flag==0);
}


void main()
{
 int x1,y1,x2,y2,wxmin,wymin,wxmax,wymax;
 char ans;
 cout<<"\n\t Enter the window co-ordinates: \n";
 cout<<"\n\t\twxmin: ";
 cin>>wxmin;
 cout<<"\n\t\twymin: ";
 cin>>wymin;
 cout<<"\n\t\twxmax: ";
 cin>>wxmax;
 cout<<"\n\t\twymax: ";
 cin>>wymax;
 do
 {
  cout<<"\n\n\tEnter the co-ordinates of the line to be clipped: \n";
  cout<<"\n\t(x1,y1): ";
  cin>>x1>>y1;
  cout<<"\n\t(x2,y2): ";
  cin>>x2>>y2;

  int gd = DETECT, gm,errorcode;
  detectgraph(&gd,&gm);
  initgraph(&gd,&gm,"c:\\tc\\tc\\bgi");
  outtextxy(100,2,"WINDOW BEFORE CLIPPING THE LINE");
  rectangle(wxmin,wymin,wxmax,wymax);
  line(x1,y1,x2,y2);
  getch();
  cleardevice();
  algorithm(x1,y1,x2,y2,wxmin,wxmax,wymin,wymax);
  getch();
  closegraph();
  cout<<"\n\n\tDo you want to clip another line? ";
  cin>>ans;
 }while(ans=='y' || ans=='Y');
}

