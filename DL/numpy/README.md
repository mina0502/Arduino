'''
Numpy - 수치계산 / 다차원 배열 / 높은 수준의 수학함수

pip3 install numpy

-numpy array
 numpy에서 배열은 동일한 타입의 값들을 가짐
 배열의 차원을 rank라고 함
 
 shape: 각차원의 크기를 튜플로 표시한 것
 ex) 2행 3열 2차원 배열 rank는 2, shape(2,3)
'''
'''
 numpy 배열 생성

 파이썬의 리스트를 사용
 array()함수의 인자로 리스트 이용
 numpy.array([1,2,3])

numpy에서 제공하는 함수를 사용
 zeros(), ones(), full(), eye()

 zeros() - 모든 배열에 0을 집어넣음
 ones() - 모든 배열에 1을 집어넣음
 full() - 배열에 사용자가 지정한 값을 넣음
 eye() - 대각선으로 1, 나머지는 0인 2차원 배열 생성
 range(n) - 0 ~ (n-1)까지 숫자 생성
 reshape() - 다차원으로 변형
''' 
'''
numpy 슬라이싱, 인덱싱, 연산

numpy 슬라이싱

import numpy as np

list=[[1,2,3],[4,5,6],[7,8,9]] 

arr = np.array(list)

a= arr[0:2,0:2]

print(a)
print(\n-----------------)
b=arr[1:,1:]
print(b)
'''

'''
numpy integer indexing
numpy 배열 a 대해 a[[row1,row2],[col1,col2]]
a[row1,col1]와 a[row2,col2]라는 두개 배열 요소 집합 의미

import numpy as np

list=[
[1,2,3,4],
[5,6,7,8],
[9,10,11,12]
]

a=np.array(list)

#integer indexing
res=a[[0,2],[1,3]] 
print(res)
'''
'''
boolean indexing

list1=[
 [1,2,3],
 [4,5,6],
 [7,8,9]
]

aa=np.array(list1)

b_arr=np.array([
[False,True,False],
[True,False,True],
[False,True,False]
])
n=aa[b_arr]

print(n)
'''
'''
boolean indexing 배열 생성 표현식으로 이용하기

배열 a에 대해서 짝수인 배열요소만 True로 지정
b_arr(a%2==0)
arr[b_arr]

n=arr[arr%2==0]
print(n)
'''
'''
numpy 연산

연산자 이용할 경우  +, - , *, / 
함수 사용 할 경우 - add(), subtract(),multiply(),divide()
배열 a와 배열b가 있을 때 a+b --> 리스트 각 요소의 합을 구함

import numpy as np
a=np.array([1,2,3])
b=np.array([4,5,6])

c=a+b # [5 7 9]

c=np.add(a,b) # [5 7 9]

c= a-b

c=np.subtract(a,b)

c=a*b

c=np.multiply(a,b)

c=a/b

c=np.divide(a,b)

list1=[
[1,2],
[3,4]
]

list2=[
[5,6],
[7,8]
]
a=np.array(list1)
b=np.array(list2)

product(np.dot(a,b)
print(product) # [[1*5+2*7,1*6+2*8],[3*5+4*7,3*6+4*8]] 
'''
'''
numpy에서는 배열간 연산을 위한 여러 함수 제공

sum() 각 배열의 요소 더함
prod() 배열의 요소 곱함
axis 옵션 사용함 ( axis가 0 ==> col 끼리 더함, 1==>row 끼리 더함)

a=np.array([1,2],[3,4])
s=np.sum(a) # 10
s1=np.sum(a,axis=0) # [4 6]
s2=np.sum(a,axis=1) # [3 7]
p= np.prod(a) # 24
p1=np.prod(a,axis=0) # [3 8]
p2=np.prod(a,axis=1) # [2 12]
'''
'''
numpy 자료형
int, float, bool, complex

정수형(int)
 int8(-127~127),int16(-32768~32767),int32,int64(부호가 있는 정수형)
 uint : uint8(0~255), uint16(0~65535, uint32, uint64

실수형(float)
float16,float32,float64

complex
complex64 : 두개의 32비트 부동소수점으로 표시되는 복소수
complex32 : 두개의 64비트 부동소수점으로 표시되는 복소수

dtype - 데이터 type 알아봄
'''

'''
import numpy as np

x= np.float32(1.0)
print(x) #1.0
print(type(x)) # <class 'numpy.float32'>
print(x.dtype) #dtype('float32')

z=np.range(5,dtype='f')
print(z)  #[0. 1. 2. 3. 4.]
print(type(z)) #<class 'numpy.ndarray'>
print(z.type) # dtype('float32')

dd=np.arrange(2,3,0.2)
print(dd) #array([2. , 2.2, 2.4, 2.6, 2.8])
'''
