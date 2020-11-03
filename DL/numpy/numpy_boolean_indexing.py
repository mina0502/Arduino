import numpy as np

list=[
    [1,2,3],
    [4,5,6],
    [7,8,9]
    ]
aa= np.array(list)

b_arr=np.array([
    [False,True,False],
    [True,False,True],
    [False,True,False]
    ])

n=aa[b_arr]

#print(n)

arr=np.array(list)
#배열 arr에 대해 짝수이면 True, 홀수면 False
b_arr=(arr%2==0)
#print(b_arr)

#print("\n\n")
#print(arr[b_arr])

n= arr[arr%2==0]
print(n)
