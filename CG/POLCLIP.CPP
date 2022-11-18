#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

int accept_poly(int p[10][2])
{
	int i, v;
	printf("\nEnter no. of vertices in a polygon:");
	scanf("%d", &v);
	for (i = 0; i < v; i++)
	{
		printf("\n Enter the %d co-ordinate(x%d,y%d): -->", i + 1, i + 1, i + 1);
		scanf("%d%d", &p[i][0], &p[i][1]);
	}
	return (v);
}

void draw_poly(int p[10][2], int v)
{
	int i;
	setcolor(BLUE);
	for (i = 0; i < v; i++)
	{
		line(p[i][0], p[i][1], p[(i + 1) % v][0], p[(i + 1) % v][1]);
	}
}
int leftclip(int p[10][2], int v, int wxmin)
{
	int i, t[10][2];
	int k = 0;
	int x1, y1, x2, y2;
	for (i = 0; i < v; i++)
	{
		if (p[i][0] >= wxmin)
		{
			t[k][0] = p[i][0];
			t[k][1] = p[i][1];
			k++;
		}
		if ((p[i][0] > wxmin && p[(i + 1) % v][0] < wxmin) || (p[i][0] < wxmin && p[(i + 1) % v][0] > wxmin))
		{
			x1 = p[i][0];
			y1 = p[i][1];
			x2 = p[(i + 1) % v][0];
			y2 = p[(i + 1) % v][1];
			t[k][1] = y1 + (wxmin - x1) * ((float)(y2 - y1) / (x2 - x1));
			t[k][0] = wxmin;
			k++;
		}
	}
	for (i = 0; i < k; i++)
	{
		p[i][0] = t[i][0];
		p[i][1] = t[i][1];
	}
	return (k);
}

int rightclip(int p[10][2], int v, int wxmax)
{
	int i, t[10][2];
	int k = 0;
	int x1, y1, x2, y2;
	for (i = 0; i < v; i++)
	{
		if (p[i][0] <= wxmax)
		{
			t[k][0] = p[i][0];
			t[k][1] = p[i][1];
			k++;
		}
		if ((p[i][0] > wxmax && p[(i + 1) % v][0] < wxmax) || (p[i][0] < wxmax && p[(i + 1) % v][0] > wxmax))
		{
			x1 = p[i][0];
			y1 = p[i][1];
			x2 = p[(i + 1) % v][0];
			y2 = p[(i + 1) % v][1];
			t[k][1] = y1 + (wxmax - x1) * ((float)(y2 - y1) / (x2 - x1));
			t[k][0] = wxmax;
			k++;
		}
	}
	for (i = 0; i < k; i++)
	{
		p[i][0] = t[i][0];
		p[i][1] = t[i][1];
	}
	return (k);
}
int topclip(int p[10][2], int v, int wymin)
{
	int i, t[10][2];
	int k = 0;
	int x1, y1, x2, y2;
	for (i = 0; i < v; i++)
	{
		if (p[i][1] >= wymin)
		{
			t[k][0] = p[i][0];
			t[k][1] = p[i][1];
			k++;
		}
		if ((p[i][1] > wymin && p[(i + 1) % v][1] < wymin) || (p[i][1] < wymin && p[(i + 1) % v][1] > wymin))
		{
			x1 = p[i][0];
			y1 = p[i][1];
			x2 = p[(i + 1) % v][0];
			y2 = p[(i + 1) % v][1];
			t[k][0] = x1 + (wymin - y1) * ((float)(x2 - x1) / (y2 - y1));
			t[k][1] = wymin;
			k++;
		}
	}
	for (i = 0; i < k; i++)
	{
		p[i][0] = t[i][0];
		p[i][1] = t[i][1];
	}
	return (k);
}
int bottomclip(int p[10][2], int v, int wymax)
{
	int i, t[10][2];
	int k = 0;
	int x1, y1, x2, y2;
	for (i = 0; i < v; i++)
	{
		if (p[i][1] <= wymax)
		{
			t[k][0] = p[i][0];
			t[k][1] = p[i][1];
			k++;
		}
		if ((p[i][1] > wymax && p[(i + 1) % v][1] < wymax) || (p[i][1] < wymax && p[(i + 1) % v][1] > wymax))
		{
			x1 = p[i][0];
			y1 = p[i][1];
			x2 = p[(i + 1) % v][0];
			y2 = p[(i + 1) % v][1];
			t[k][0] = x1 + (wymax - y1) * ((float)(x2 - x1) / (y2 - y1));
			t[k][1] = wymax;
			k++;
		}
	}
	for (i = 0; i < k; i++)
	{
		p[i][0] = t[i][0];
		p[i][1] = t[i][1];
	}
	return (k);
}

/*int leftclip(int p[10][2],int v,int wxmin)
{
int i,k=0,x1,y1,x2,y2,t[10][2];
  for(i=0;i<v;i++)
  {
   if(p[i][0]>=wxmin)
   {
	t[k][0]=p[i][0];
	t[k][1]=p[i][1];
	k++;
   }
   if((p[i][0]<wxmin && p[(i+1)%v][0]>wxmin)||(p[i][0]>wxmin && p[(i+1)%v][0]<wxmin))
   {
	x1=p[i][0];
	y1=p[i][1];
	x2=p[(i+1)%v][0];
	y2=p[(i+1)%v][1];
	t[k][0]=wxmin;
	t[k][1]=y1+(float)(y2-y1)/(x2-x1)*(wxmin-x1);
	k++;
   }
  }
  for(i=0;i<=k;i++)
  {
   p[i][0]=t[i][0];
   p[i][0]=t[i][1];
  }
  return(k);
} */
int main(void)
{
	/* request auto detection */
	int gd = DETECT, gm, errorcode;
	detectgraph(&gd, &gm);
	initgraph(&gd, &gm, (char*)"");
	int v, wxmin, wymin, wxmax, wymax, p[10][2];

	printf("\nEnter the window co-ordinates:");
	printf("\nWxmin ==> ");
	scanf("%d", &wxmin);
	printf("\nWymin ==> ");
	scanf("%d", &wymin);
	printf("\nWxmax ==> ");
	scanf("%d", &wxmax);
	printf("\nWymax ==> ");
	scanf("%d", &wymax);

	v = accept_poly(p);

	/* initialize graphics and local variables */
	// initgraph(&gdriver, &gmode, "c:\\tc\\bgi");
	setcolor(RED);
	rectangle(wxmin, wymin, wxmax, wymax);
	draw_poly(p, v);

	getch();
	v = leftclip(p, v, wxmin);
	cleardevice();
	rectangle(wxmin, wymin, wxmax, wymax);
	draw_poly(p, v);
	getch();
	v = rightclip(p, v, wxmax);
	cleardevice();
	rectangle(wxmin, wymin, wxmax, wymax);
	draw_poly(p, v);
	getch();
	v = topclip(p, v, wymin);
	cleardevice();
	rectangle(wxmin, wymin, wxmax, wymax);
	draw_poly(p, v);
	getch();
	v = bottomclip(p, v, wymax);
	cleardevice();
	rectangle(wxmin, wymin, wxmax, wymax);
	draw_poly(p, v);

	/* clean up */
	getch();
	closegraph();
	return 0;
}
