/*
 * prime_Number.c
 *
 *  Created on: 2020. 2. 16.
 *      Author: LESH
 */
#include<stdio.h>
#include<math.h>
#include<stdbool.h>
#define NUM 97
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
CP();
if(NUM>1&&a==true)
{
	printf("prime number");
	printf("\n %d th prime",cnt);
}
else
{
	printf("Not prime number");
}
}
void CP()
{
	int i,j;
	for(i=2;i<=NUM;i++)
		{
			for (j=2;j<=i;j++)
			{
				if(i%j==0)
					break;
			}
			if(i==j)
			{
				cnt++;
			}
}
};
