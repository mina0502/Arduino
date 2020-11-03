import numpy as np

list=[
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12]
    ]

a=np.array(list)

#integer indexing

res=a[[0,2],[1,3]] # 2, 12
print(res)
