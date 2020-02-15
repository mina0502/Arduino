/*
 * prime_Number.c
 *
 *  Created on: 2020. 2. 16.
 *      Author: LESH
 */
#include<stdio.h>
#include<math.h>
#include<stdbool.h>
#define NUM 100
int cnt=0;
main()
{

bool a=true;
for(int i=2;i<=sqrt(NUM);i++)
{
	if(NUM%i==0)
	{
		a=false;
		break;
	}
	else
	{
		a=true;
	}
}

if(NUM>1&&a==true)
{
	printf("prime number");
}
else
{
	printf("Not prime number");
}
}
