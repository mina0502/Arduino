import numpy as np

a=np.array([[1,2],[3,4]])
b=10
c=a*b

#print(c) #([[10 20],[30 40]])

x=np.array([[1,2],[3,4]])
y=np.array([10,20])
z=x*y
#print(z) #[[10 40].[30 80]]

x=np.array([[11,21],[34,43],[0,9]])

#for row in x:
#    print(row)

# 2차원 배열을 1차원 배열로 변환(평탄화) : flatten()
x=x.flatten()
# print(x) # [11 21 34 43 0 9]

# print(x[np.array([1,3,5])]) # [21 43 9]

# print(x[x>25]) #x>25 조건에 맞는 값만 가져옴 [34 43]

# print(x>25) #numpy 배열에 부등호 연산자를 사용한 결과 bool 값
