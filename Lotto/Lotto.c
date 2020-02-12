/*
 * 1.c
 *
 *  Created on: 2020. 2. 12.
 *      Author: LESH
 */




#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define MAX  5000
int r,cnt=0,hap=0;

int main()
{
srand((unsigned int)time(NULL));
int A[7],B[46]={0};
while(cnt<MAX)
{
for(int i=0;i<6;i++)
{
	r=rand()%45+1;
	A[i]=r;
}

for(int i=0;i<6;i++)
{
	if(A[i]==A[i+1])
	{
		A[i]=r=rand()%45+1;
	}
}
for(int i=1;i<46;i++)
{
	for(int j=0; j<6;j++)
	{
		if(A[j]==i)
		{
			B[i]+=1;
			hap++;
		}
	}
	if(cnt==MAX-1)
	{

	printf("%d ",B[i]);
	if(i%5==0)
		{
			printf("\n");
		}
	}
}
cnt++;
}

printf("\n\n hap: %d",hap);
}

