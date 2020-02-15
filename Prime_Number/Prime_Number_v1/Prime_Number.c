/*
 * 1.c
 *
 *  Created on: 2020. 2. 15.
 *      Author: LESH
 */
#include <stdio.h>
#define NUM 100
int cnt=0;
void main() {
    printf("%d Under All prime number:\n",NUM);
	int i,j;
	for(i=2;i<=NUM;i++)
	{
		for(j=2;j<=i;j++)
		{
			if(i%j==0)
				break;
		}
		if(i==j)
		{
			cnt++;
			printf("%d ",i);
		}
	}
	printf("\n %d",cnt);
}
